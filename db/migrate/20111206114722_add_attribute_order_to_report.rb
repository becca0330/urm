class AddAttributeOrderToReport < ActiveRecord::Migration
  def self.up
    add_column :reports, :order, :integer
  end

  def self.down
    remove_column :reports, :order
  end
end
