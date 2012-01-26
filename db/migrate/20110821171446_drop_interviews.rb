class DropInterviews < ActiveRecord::Migration
  def self.up
    drop_table :interviews
  end

  def self.down
  end
end
