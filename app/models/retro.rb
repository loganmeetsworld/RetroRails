class Retro < ActiveRecord::Base
	belongs_to :team
	has_many :notes
	

end
