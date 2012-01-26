class CreateTranscriptEvents < ActiveRecord::Migration
  def self.up
    create_table :transcript_events do |t|
      t.integer :report_id
      t.integer :person_id
      t.datetime :timestamp
      t.integer :eventcode_id
      t.text :event
      t.integer :finding_id

      t.timestamps
    end
  end

  def self.down
    drop_table :transcript_events
  end
end
