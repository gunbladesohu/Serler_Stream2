class CreateSearchFieldValues < ActiveRecord::Migration
  def change
    create_table :search_field_values do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
