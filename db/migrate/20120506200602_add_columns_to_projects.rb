class AddColumnsToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :user_id, :integer
    add_column :projects, :role_id, :integer
  end

  def self.down
    remove_column :projects, :role_id
    remove_column :projects, :user_id
  end
end
