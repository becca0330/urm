# == Schema Information
#
# Table name: todos
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :text
#  user_id     :integer(4)
#  solved      :boolean(1)
#  priority    :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

