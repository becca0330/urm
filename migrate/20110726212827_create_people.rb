class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name
      t.string :alias
      t.string :gender
      t.integer :age
      t.string :occupation
      t.text :itexperience

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
