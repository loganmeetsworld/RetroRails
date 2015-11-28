class MoveSummaryColumnToRetro < ActiveRecord::Migration
  def change
  	remove_column :notes, :data, :binary
  	add_column :notes, :data, :binary
  end
end
