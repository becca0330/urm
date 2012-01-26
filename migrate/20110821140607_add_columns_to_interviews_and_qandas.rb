class AddColumnsToInterviewsAndQandas < ActiveRecord::Migration
  def self.up
    add_column :interviews, :report_id, :integer
    add_column :qandas, :interview_id, :integer
  end

  def self.down
  end
end
