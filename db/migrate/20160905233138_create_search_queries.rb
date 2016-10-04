class CreateSearchQueries < ActiveRecord::Migration
  def change
    create_table :search_queries do |t|
      t.string  :description
      t.integer :user_id
      t.integer :from_date
      t.integer :to_date
      t.text    :sql_string
      t.boolean :isActive

      t.timestamps null: false
    end
  end
end
