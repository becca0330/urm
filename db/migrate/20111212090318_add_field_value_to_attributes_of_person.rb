class AddFieldValueToAttributesOfPerson < ActiveRecord::Migration
  def self.up
    add_column :attributes_of_people, :value, :string
  end

  def self.down
    remove_column :attributes_of_people, :value
  end
end
