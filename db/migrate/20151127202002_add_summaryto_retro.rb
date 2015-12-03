class AddSummarytoRetro < ActiveRecord::Migration
  def change
    add_column :retros, :summary, :string
  end
end
