class AddNotesAttributes < ActiveRecord::Migration
  def change
  	add_column :notes, :name, :string
  	add_column :notes, :team_id, :integer
  	add_column :notes, :complete_date, :datetime
  end
end
