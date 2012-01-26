class AddFieldsToReport < ActiveRecord::Migration
  def self.up
    add_column :reports, :introduction, :text
    add_column :reports, :methodology, :text
    add_column :reports, :training, :text
  end

  def self.down
    remove_column :reports, :training
    remove_column :reports, :methodology
    remove_column :reports, :introduction
  end
end
