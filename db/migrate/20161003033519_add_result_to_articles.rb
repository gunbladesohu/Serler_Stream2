class AddResultToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :result, :string
  end
end
