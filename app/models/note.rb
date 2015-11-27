class Note < ActiveRecord::Base
	belongs_to :retro
	belongs_to :team
end
