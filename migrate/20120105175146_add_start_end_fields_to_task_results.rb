class AddStartEndFieldsToTaskResults < ActiveRecord::Migration
  def change
    add_column :task_results, :start, :time
    add_column :task_results, :end, :time
  end
end
