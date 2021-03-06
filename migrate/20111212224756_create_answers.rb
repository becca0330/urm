class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :report_id
      t.integer :question_id
      t.integer :person_id
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
