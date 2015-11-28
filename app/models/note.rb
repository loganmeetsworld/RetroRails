class Note < ActiveRecord::Base
	belongs_to :retro
	belongs_to :team 

	def self.category(cat_id)
		case cat_id
		when 1
			return "Areas for Improvement"
		when 2
			return "Less of..."
		when 3
			return "More of..."
		when 4
			return "Positive Experiences"
		end
	end
end
