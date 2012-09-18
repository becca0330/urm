# == Schema Information
#
# Table name: custom_attributes
#
#  id          :integer(4)      not null, primary key
#  order       :integer(4)
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class CustomAttributeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

