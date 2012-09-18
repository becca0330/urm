# == Schema Information
#
# Table name: questions
#
#  id          :integer(4)      not null, primary key
#  order       :integer(4)
#  report_id   :integer(4)
#  description :text
#  notice      :text
#  rangefrom   :string(255)
#  rangeto     :string(255)
#  rangescale  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

