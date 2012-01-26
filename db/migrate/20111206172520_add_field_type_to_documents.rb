class AddFieldTypeToDocuments < ActiveRecord::Migration
  def self.up
    add_column :documents, :doctype, :string
  end

  def self.down
    remove_column :documents, :doctype
  end
end
