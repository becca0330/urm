class AddFieldPersonIdToInterview < ActiveRecord::Migration
  def self.up
    add_column :interviews, :person_id, :integer
  end

  def self.down
    remove_column :interviews, :person_id
  end
end
