class AddFieldsToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :attachment_file_name, :string
    add_column :videos, :attachment_content_type, :string
    add_column :videos, :attachment_file_size, :integer
    add_column :videos, :attachment_updated_at, :datetime
  end
end
