class AddFieldsToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :attachment_file_name, :string
    add_column :documents, :attachment_content_type, :string
    add_column :documents, :attachment_file_size, :integer
    add_column :documents, :attachment_updated_at, :datetime
  end
end
