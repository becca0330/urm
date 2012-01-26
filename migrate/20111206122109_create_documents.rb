class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :type
      t.string :listat
      t.text :description
      t.text :source

      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
