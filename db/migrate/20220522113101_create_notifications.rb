class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :task, foreign_key: true
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
