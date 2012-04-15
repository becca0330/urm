class CreateHeuristics < ActiveRecord::Migration
  def self.up
    create_table :heuristics do |t|
      t.string :title
      t.text :description
      t.integer :report_id

      t.timestamps
    end
  end

  def self.down
    drop_table :heuristics
  end
end
