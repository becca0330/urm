class AddHasUsabTextExpToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :hasusabtestexperience, :string
  end

  def self.down
    remove_column :people, :hasusabtestexperience
  end
end
