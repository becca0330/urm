class RemoveTypeFromDocuments < ActiveRecord::Migration
  def self.up
    remove_column :documents, :type
  end

  def self.down
    add_column :documents, :type, :string
  end
end
