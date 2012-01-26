class CreateTaskResults < ActiveRecord::Migration
  def self.up
    create_table :task_results do |t|
      t.integer :report_id
      t.integer :person_id
      t.datetime :start
      t.datetime :end
      t.integer :durationactual
      t.integer :completion
      t.boolean :withassistance
      t.text :notice

      t.timestamps
    end
  end

  def self.down
    drop_table :task_results
  end
end
