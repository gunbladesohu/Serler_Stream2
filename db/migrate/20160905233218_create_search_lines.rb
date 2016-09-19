class CreateSearchLines < ActiveRecord::Migration
  def change
    create_table :search_lines do |t|
      t.integer :join_condition
      t.integer :field_id
      t.integer :operator
      t.integer :value_id
      t.string  :value_text
      t.integer :value_number
      t.integer :search_query_id
      t.boolean :isActive

      t.timestamps null: false
    end
  end
end
