# == Schema Information
#
# Table name: interviews
#
#  id         :integer         not null, primary key
#  personid   :integer
#  created_at :datetime
#  updated_at :datetime
#  report_id  :integer
#

require 'test_helper'

class InterviewTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

