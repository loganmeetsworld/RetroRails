class AddConclussiontoNotes < ActiveRecord::Migration
  def change
  	add_column :notes, :conclussion, :string
  end
end
