class AddReportIdToAuthor < ActiveRecord::Migration
  def self.up
    add_column :authors, :report_id, :integer
  end

  def self.down
    remove_column :authors, :report_id
  end
end
