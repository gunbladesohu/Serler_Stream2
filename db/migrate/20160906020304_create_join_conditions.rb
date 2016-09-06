class CreateJoinConditions < ActiveRecord::Migration
  def change
    create_table :join_conditions do |t|
      t.integer :value
      t.string  :name

      t.timestamps null: false
    end
  end
end
