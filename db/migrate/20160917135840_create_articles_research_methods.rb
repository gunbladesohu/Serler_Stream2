class CreateArticlesResearchMethods < ActiveRecord::Migration
  def change
    create_table :articles_research_methods do |t|
      t.references :article, index: true, foreign_key: true
      t.references :research_method, index: true, foreign_key: true
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
