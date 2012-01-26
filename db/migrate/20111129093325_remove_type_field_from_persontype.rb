class RemoveTypeFieldFromPersontype < ActiveRecord::Migration
  def up
    remove_column :persontypes, :type
  end

  def down
    add_column :persontypes, :type, :string
  end
end
