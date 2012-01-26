class AddPersonTypeFieldToPerson < ActiveRecord::Migration
  def change
    add_column :people, :persontype_id, :integer
  end
end
