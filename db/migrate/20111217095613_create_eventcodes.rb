class CreateEventcodes < ActiveRecord::Migration
  def self.up
    create_table :eventcodes do |t|
      t.string :code
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :eventcodes
  end
end
