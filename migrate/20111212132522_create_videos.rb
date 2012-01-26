class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.integer :person_id
      t.string :doctype
      t.text :description
      t.string :source

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
