class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :body
      t.datetime :deadline_at, null: false
      t.datetime :completion_at

      t.timestamps
    end
  end
end
