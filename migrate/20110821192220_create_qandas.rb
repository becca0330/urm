class CreateQandas < ActiveRecord::Migration
  def self.up
    create_table :qandas do |t|
      t.text :quest
      t.text :answ
      t.integer :interview_id
      t.integer :qid

      t.timestamps
    end
  end

  def self.down
    drop_table :qandas
  end
end
