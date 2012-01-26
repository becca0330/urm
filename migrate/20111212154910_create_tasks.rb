class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :order
      t.string :title
      t.text :description
      t.text :prerequisite
      t.text :possiblesolutionpath
      t.text :endingcriteria
      t.integer :durationscheduled

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
