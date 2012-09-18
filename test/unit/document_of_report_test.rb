# == Schema Information
#
# Table name: document_of_reports
#
#  id          :integer(4)      not null, primary key
#  document_id :integer(4)
#  report_id   :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class DocumentOfReportTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

