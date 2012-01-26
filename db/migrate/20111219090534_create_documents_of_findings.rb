class CreateDocumentsOfFindings < ActiveRecord::Migration
  def self.up
    create_table :documents_of_findings do |t|
      t.integer :document_id
      t.integer :finding_id

      t.timestamps
    end
  end

  def self.down
    drop_table :documents_of_findings
  end
end
