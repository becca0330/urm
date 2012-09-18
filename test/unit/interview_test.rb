# == Schema Information
#
# Table name: interviews
#
#  id         :integer(4)      not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  report_id  :integer(4)
#  person_id  :integer(4)
#

require 'test_helper'

class InterviewTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


