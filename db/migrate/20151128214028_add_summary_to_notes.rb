class AddSummaryToNotes < ActiveRecord::Migration
  def change
  	add_column :notes, :data, :binary
  end
end
