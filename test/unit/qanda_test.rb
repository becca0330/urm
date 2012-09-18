# == Schema Information
#
# Table name: qandas
#
#  id           :integer(4)      not null, primary key
#  quest        :text
#  answ         :text
#  interview_id :integer(4)
#  qid          :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class QandaTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


