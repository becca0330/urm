class AddFieldAnnotationToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :annotation, :text
  end

  def self.down
    remove_column :people, :annotation
  end
end
