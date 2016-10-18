class CreateLogsAdmins < ActiveRecord::Migration
  def change
    create_table :logs_admins do |t|

      t.timestamps null: false
    end
  end
end
