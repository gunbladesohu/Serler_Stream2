class CreateSearchResults < ActiveRecord::Migration
  def change
    create_table :search_results do |t|

      t.string  :description
      t.integer :user_id
      t.integer :from_date
      t.integer :to_date
      t.boolean :isActive

      t.timestamps null: false    
  	end
  end
end
