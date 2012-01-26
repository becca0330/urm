require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: reports
#
#  id          :integer         not null, primary key
#  project_id  :integer
#  title       :string(255)
#  timestamp   :datetime
#  description :text
#  summary     :text
#  created_at  :datetime
#  updated_at  :datetime
#

