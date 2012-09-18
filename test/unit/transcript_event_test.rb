# == Schema Information
#
# Table name: transcript_events
#
#  id           :integer(4)      not null, primary key
#  report_id    :integer(4)
#  person_id    :integer(4)
#  timestamp    :datetime
#  eventcode_id :integer(4)
#  event        :text
#  finding_id   :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class TranscriptEventTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

