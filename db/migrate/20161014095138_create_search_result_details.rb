class CreateSearchResultDetails < ActiveRecord::Migration
  def change
    create_table :search_result_details do |t|

    	t.string :article_url
    	t.integer :search_result_id
    	t.integer :article_id
      	t.timestamps null: false
    end
  end
end
