class Team < ActiveRecord::Base
	has_many :retros
	has_many :notes

  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def self.authenticate(name, password)
    team = find_by_name(name)
    if team && team.password_hash == BCrypt::Engine.hash_secret(password, team.password_salt)
      team
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
