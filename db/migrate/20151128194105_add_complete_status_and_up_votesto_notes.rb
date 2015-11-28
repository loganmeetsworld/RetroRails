class AddCompleteStatusAndUpVotestoNotes < ActiveRecord::Migration
  def change
  	add_column :notes, :complete_status, :integer
  	add_column :notes, :upvote, :integer
  end
end
