# == Schema Information
#
# Table name: people
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  alias        :string(255)
#  gender       :string(255)
#  age          :integer
#  occupation   :string(255)
#  itexperience :text
#  created_at   :datetime
#  updated_at   :datetime
#  education    :string(255)
#  report_id    :integer
#  persontype   :string(255)
#  pid          :string(255)
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

