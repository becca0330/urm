# == Schema Information
#
# Table name: task_results
#
#  id             :integer(4)      not null, primary key
#  report_id      :integer(4)
#  person_id      :integer(4)
#  durationactual :integer(4)
#  completion     :integer(4)
#  withassistance :boolean(1)
#  notice         :text
#  created_at     :datetime
#  updated_at     :datetime
#  task_id        :integer(4)
#  start          :time
#  end            :time
#

require 'test_helper'

class TaskResultTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

