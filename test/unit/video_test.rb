# == Schema Information
#
# Table name: videos
#
#  id                      :integer(4)      not null, primary key
#  person_id               :integer(4)
#  doctype                 :string(255)
#  description             :text
#  source                  :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer(4)
#  attachment_updated_at   :datetime
#

require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

