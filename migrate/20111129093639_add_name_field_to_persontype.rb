class AddNameFieldToPersontype < ActiveRecord::Migration
  def change
    add_column :persontypes, :name, :string
  end
end
