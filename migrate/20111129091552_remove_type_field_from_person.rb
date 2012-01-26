class RemoveTypeFieldFromPerson < ActiveRecord::Migration
  def up
    remove_column :people, :type_id
  end

  def down
    add_column :people, :type_id, :string
  end
end
