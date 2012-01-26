class AlertColumnTypeOfInterview < ActiveRecord::Migration
  def self.up
    change_column :interviews, :personid, :string
  end

  def self.down
  end
end
