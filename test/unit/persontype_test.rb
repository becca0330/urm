# == Schema Information
#
# Table name: persontypes
#
#  id          :integer(4)      not null, primary key
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string(255)
#

require 'test_helper'

class PersontypeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

