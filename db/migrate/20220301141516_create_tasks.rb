class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.timestamps
      t.references :board, null: false
      t.references :user, null: :false
      t.string :title, null: false
      t.text :description, null: false
      t.date :deadline
    end
  end
end
