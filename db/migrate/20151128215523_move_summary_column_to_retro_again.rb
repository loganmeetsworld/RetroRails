class MoveSummaryColumnToRetroAgain < ActiveRecord::Migration
  def change
  	remove_column :notes, :data, :binary
  	add_column :retros, :data, :binary
  end
end
