# == Schema Information
#
# Table name: answers
#
#  id          :integer(4)      not null, primary key
#  report_id   :integer(4)
#  question_id :integer(4)
#  person_id   :integer(4)
#  value       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

