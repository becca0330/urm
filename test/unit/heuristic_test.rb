# == Schema Information
#
# Table name: heuristics
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :text
#  report_id   :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class HeuristicTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

