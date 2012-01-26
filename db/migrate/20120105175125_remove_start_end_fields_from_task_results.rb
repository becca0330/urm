class RemoveStartEndFieldsFromTaskResults < ActiveRecord::Migration
  def up
    remove_column :task_results, :start
    remove_column :task_results, :end
  end

  def down
    add_column :task_results, :end, :datetime
    add_column :task_results, :start, :datetime
  end
end
