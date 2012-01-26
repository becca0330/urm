class AddMoreDescriptionfieldsToReport < ActiveRecord::Migration
  def self.up
    add_column :reports, :person_description, :text
    add_column :reports, :environment_description, :text
    add_column :reports, :task_description, :text
    add_column :reports, :heuristicissues_description, :text
    add_column :reports, :questionnaire_description, :text
    add_column :reports, :questionnaireresults_description, :text
    add_column :reports, :interviews_description, :text
    add_column :reports, :transcripts_description, :text
    add_column :reports, :analysis_description, :text
    add_column :reports, :appendix_description, :text
  end

  def self.down
    remove_column :reports, :appendix_description
    remove_column :reports, :analysis_description
    remove_column :reports, :transcripts_description
    remove_column :reports, :interviews_description
    remove_column :reports, :questionnaireresults_description
    remove_column :reports, :questionnaire_description
    remove_column :reports, :heuristicissues_description
    remove_column :reports, :task_description
    remove_column :reports, :environment_description
    remove_column :reports, :person_description
  end
end
