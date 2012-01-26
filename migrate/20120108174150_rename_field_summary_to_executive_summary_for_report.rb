class RenameFieldSummaryToExecutiveSummaryForReport < ActiveRecord::Migration
  def up
    rename_column :reports, :summary, :executive_summary
  end

  def down
    rename_column :reports, :executive_summary, :summary
  end
end
