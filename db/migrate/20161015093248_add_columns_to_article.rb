class AddColumnsToArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :context, :string
  	add_column :articles, :benefit, :string
  	add_column :articles, :result, :string
  end
end
