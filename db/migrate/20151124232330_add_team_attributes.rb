class AddTeamAttributes < ActiveRecord::Migration
  def change
  	add_column :teams, :name, :string
  	add_column :teams, :bio, :string
  	add_column :teams, :password, :string
  end
end
