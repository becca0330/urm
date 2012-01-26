class RemoveAttributeOrderToProject < ActiveRecord::Migration
  def self.up
    remove_column :projects, :order
  end

  def self.down
    add_column :projects, :order, :integer
  end
end
