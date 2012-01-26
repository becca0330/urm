class AddReportidToInterviews < ActiveRecord::Migration
  def self.up
    add_column :interviews, :report_id, :integer
  end

  def self.down
  end
end
