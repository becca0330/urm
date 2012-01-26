class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :order
      t.integer :report_id
      t.text :description
      t.text :notice
      t.string :rangefrom
      t.string :rangeto
      t.string :rangescale

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
