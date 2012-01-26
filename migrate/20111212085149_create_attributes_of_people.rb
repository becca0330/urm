class CreateAttributesOfPeople < ActiveRecord::Migration
  def self.up
    create_table :attributes_of_people do |t|
      t.integer :custom_attribute_id
      t.integer :person_id

      t.timestamps
    end
  end

  def self.down
    drop_table :attributes_of_people
  end
end
