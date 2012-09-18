# == Schema Information
#
# Table name: attributes_of_people
#
#  id                  :integer(4)      not null, primary key
#  custom_attribute_id :integer(4)
#  person_id           :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#  value               :string(255)
#

require 'test_helper'

class AttributesOfPersonTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

