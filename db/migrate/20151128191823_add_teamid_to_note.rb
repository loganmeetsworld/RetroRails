class AddTeamidToNote < ActiveRecord::Migration
  def change
  	add_column :notes, :team_id, :integer
  end
end
