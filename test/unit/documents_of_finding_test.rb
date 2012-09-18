# == Schema Information
#
# Table name: documents_of_findings
#
#  id          :integer(4)      not null, primary key
#  document_id :integer(4)
#  finding_id  :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class DocumentsOfFindingTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

