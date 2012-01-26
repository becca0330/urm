class AddColumnsToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :persontype, :string
    add_column :people, :pid, :string
  end

  def self.down
  end
end
