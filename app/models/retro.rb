class Retro < ActiveRecord::Base
	belongs_to :team
	has_many :notes

	mount_uploader :attachment, AttachmentUploader
  validates :name, presence: true
end
