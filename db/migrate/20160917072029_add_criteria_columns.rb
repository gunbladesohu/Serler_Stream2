class AddCriteriaColumns < ActiveRecord::Migration
  def change
    add_column :articles, :peer_reviewed, :boolean
    add_column :articles, :relevance, :boolean
    add_column :articles, :not_duplicate, :boolean
    add_column :articles, :user_id, :integer
  end
end
