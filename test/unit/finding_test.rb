# == Schema Information
#
# Table name: findings
#
#  id          :integer(4)      not null, primary key
#  report_id   :integer(4)
#  findingtype :string(255)
#  priority    :integer(4)
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class FindingTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

