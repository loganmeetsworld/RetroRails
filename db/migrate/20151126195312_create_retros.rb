class CreateRetros < ActiveRecord::Migration
  def change
    create_table :retros do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
