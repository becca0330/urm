class CreateDevices < ActiveRecord::Migration
  def self.up
    create_table :devices do |t|
      t.integer :report_id
      t.integer :person_id
      t.string :devicetype
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :devices
  end
end
