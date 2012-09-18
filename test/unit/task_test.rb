# == Schema Information
#
# Table name: tasks
#
#  id                   :integer(4)      not null, primary key
#  order                :integer(4)
#  title                :string(255)
#  description          :text
#  prerequisite         :text
#  possiblesolutionpath :text
#  endingcriteria       :text
#  durationscheduled    :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#  report_id            :integer(4)
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

