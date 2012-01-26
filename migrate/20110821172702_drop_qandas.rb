class DropQandas < ActiveRecord::Migration
  def self.up
    drop_table :qandas
  end

  def self.down
  end
end
