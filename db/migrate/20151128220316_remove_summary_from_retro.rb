class RemoveSummaryFromRetro < ActiveRecord::Migration
  def change
  	remove_column :retros, :summary, :string
  end
end
