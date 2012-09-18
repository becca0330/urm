# == Schema Information
#
# Table name: devices
#
#  id          :integer(4)      not null, primary key
#  report_id   :integer(4)
#  person_id   :integer(4)
#  devicetype  :string(255)
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

