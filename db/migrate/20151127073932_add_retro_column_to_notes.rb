class AddRetroColumnToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :retro_id, :integer
  end
end
