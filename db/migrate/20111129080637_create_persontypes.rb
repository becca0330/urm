class CreatePersontypes < ActiveRecord::Migration
  def self.up
    create_table :persontypes do |t|
      t.string :type
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :persontypes
  end
end
