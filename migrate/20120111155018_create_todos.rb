class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.boolean :solved
      t.integer :priority

      t.timestamps
    end
  end
end
