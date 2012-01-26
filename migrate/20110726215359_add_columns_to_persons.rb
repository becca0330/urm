class AddColumnsToPersons < ActiveRecord::Migration
  def self.up
    add_column :people, :education, :string
    add_column :people, :report_id, :integer
  end

  def self.down
  end
end
