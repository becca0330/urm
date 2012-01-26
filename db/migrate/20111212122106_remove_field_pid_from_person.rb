class RemoveFieldPidFromPerson < ActiveRecord::Migration
  def self.up
    remove_column :people, :pid
  end

  def self.down
    add_column :people, :pid, :integer
  end
end
