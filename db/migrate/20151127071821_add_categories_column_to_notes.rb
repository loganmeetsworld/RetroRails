class AddCategoriesColumnToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :cat_id, :integer
  end
end
