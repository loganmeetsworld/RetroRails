class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :content
      t.datetime :date_complete

      t.timestamps null: false
    end
  end
end
