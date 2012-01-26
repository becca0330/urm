class AddQrSummaryFieldToReports < ActiveRecord::Migration
  def self.up
    add_column :reports, :questionnaireresults_summary, :text
  end

  def self.down
    remove_column :reports, :questionnaireresults_summary
  end
end
