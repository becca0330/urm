class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.integer :project_id
      t.string :title
      t.datetime :timestamp
      t.text :description
      t.text :summary

      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
