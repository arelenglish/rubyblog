class AddUpVotesAndDownVotesToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :up_votes, :integer
    add_column :articles, :down_votes, :integer
  end
end
