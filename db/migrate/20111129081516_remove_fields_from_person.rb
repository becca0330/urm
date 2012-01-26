class RemoveFieldsFromPerson < ActiveRecord::Migration
  def self.up
    remove_column :people, :persontype
  end

  def self.down
    add_column :people, :persontype, :integer
  end
end
