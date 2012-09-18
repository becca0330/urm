# == Schema Information
#
# Table name: reports
#
#  id                               :integer(4)      not null, primary key
#  project_id                       :integer(4)
#  title                            :string(255)
#  timestamp                        :datetime
#  description                      :text
#  executive_summary                :text
#  created_at                       :datetime
#  updated_at                       :datetime
#  introduction                     :text
#  methodology                      :text
#  training                         :text
#  person_description               :text
#  environment_description          :text
#  task_description                 :text
#  heuristicissues_description      :text
#  questionnaire_description        :text
#  questionnaireresults_description :text
#  interviews_description           :text
#  transcripts_description          :text
#  analysis_description             :text
#  appendix_description             :text
#  order                            :integer(4)
#  testtype                         :string(255)
#  questionnaireresults_summary     :text
#

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


