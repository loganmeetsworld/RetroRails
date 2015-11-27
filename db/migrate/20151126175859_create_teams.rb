class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :password_hash
      t.string :password_salt

      t.timestamps null: false
    end
  end
end
