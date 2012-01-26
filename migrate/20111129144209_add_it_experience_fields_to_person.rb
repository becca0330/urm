class AddItExperienceFieldsToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :itexperience_level, :string
    add_column :people, :itexperience_pcusageinyears, :integer
    add_column :people, :itexperience_pcusageperweek, :integer
    add_column :people, :itexperience_mainoperatingsystem, :string
    add_column :people, :itexperience_webusageperweek, :integer
    add_column :people, :itexperience_internetconnection, :string
    add_column :people, :itexperience_mainwebbrowser, :string
    add_column :people, :itexperience_description, :string
  end

  def self.down
    remove_column :people, :itexperience_description
    remove_column :people, :itexperience_mainwebbrowser
    remove_column :people, :itexperience_internetconnection
    remove_column :people, :itexperience_webusageperweek
    remove_column :people, :itexperience_mainoperatingsystem
    remove_column :people, :itexperience_pcusageperweek
    remove_column :people, :itexperience_pcusageinyears
    remove_column :people, :itexperience_level
  end
end
