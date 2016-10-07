class AddBenefitToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :benefit, :string
  end
end
