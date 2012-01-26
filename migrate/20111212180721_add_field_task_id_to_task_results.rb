class AddFieldTaskIdToTaskResults < ActiveRecord::Migration
  def self.up
    add_column :task_results, :task_id, :integer
  end

  def self.down
    remove_column :task_results, :task_id
  end
end
