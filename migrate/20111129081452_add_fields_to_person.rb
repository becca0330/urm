class AddFieldsToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :type_id, :integer
  end

  def self.down
    remove_column :people, :type_id
  end
end
