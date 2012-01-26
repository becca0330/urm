class RemoveFieldPersonidFromInterview < ActiveRecord::Migration
  def self.up
    remove_column :interviews, :personid
  end

  def self.down
    add_column :interviews, :personid, :integer
  end
end
