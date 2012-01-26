class AddTimestampToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :timestamp, :datetime
  end

  def self.down
    remove_column :people, :timestamp
  end
end
