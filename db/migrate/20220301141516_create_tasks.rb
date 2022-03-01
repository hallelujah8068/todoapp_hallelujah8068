class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.timestamps
      t.references :board, null: false
      t.string :title, null: false
      t.text :description, null: false
    end
  end
end
