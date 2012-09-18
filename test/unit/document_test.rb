# == Schema Information
#
# Table name: documents
#
#  id                      :integer(4)      not null, primary key
#  listat                  :string(255)
#  description             :text
#  source                  :text
#  created_at              :datetime
#  updated_at              :datetime
#  doctype                 :string(255)
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer(4)
#  attachment_updated_at   :datetime
#

require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

