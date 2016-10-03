class AddContextToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :context, :string
  end
end
