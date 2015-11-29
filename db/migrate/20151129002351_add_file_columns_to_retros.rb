class AddFileColumnsToRetros < ActiveRecord::Migration
  def change
  	def self.up
     add_attachment :retos, :file_avatar  
    end

   def self.down
     remove_attachment :retos, :file_avatar
   end
  end
end
