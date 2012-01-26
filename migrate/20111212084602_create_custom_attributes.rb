class CreateCustomAttributes < ActiveRecord::Migration
  def self.up
    create_table :custom_attributes do |t|
      t.integer :order
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :custom_attributes
  end
end
