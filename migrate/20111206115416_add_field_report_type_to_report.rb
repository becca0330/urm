class AddFieldReportTypeToReport < ActiveRecord::Migration
  def self.up
    add_column :reports, :testtype, :string
  end

  def self.down
    remove_column :reports, :testtype
  end
end
