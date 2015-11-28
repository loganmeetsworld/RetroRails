class ChangeFileTypeSummary < ActiveRecord::Migration
  def change
  	remove_column :retros, :data, :binary
  	add_column :retros, :attachment, :string
  end
end
