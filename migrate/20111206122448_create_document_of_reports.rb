class CreateDocumentOfReports < ActiveRecord::Migration
  def self.up
    create_table :document_of_reports do |t|
      t.integer :document_id
      t.integer :report_id

      t.timestamps
    end
  end

  def self.down
    drop_table :document_of_reports
  end
end
