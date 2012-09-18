# == Schema Information
#
# Table name: people
#
#  id                               :integer(4)      not null, primary key
#  name                             :string(255)
#  alias                            :string(255)
#  gender                           :string(255)
#  age                              :integer(4)
#  occupation                       :string(255)
#  itexperience                     :text
#  created_at                       :datetime
#  updated_at                       :datetime
#  education                        :string(255)
#  report_id                        :integer(4)
#  persontype_id                    :integer(4)
#  itexperience_level               :string(255)
#  itexperience_pcusageinyears      :integer(4)
#  itexperience_pcusageperweek      :integer(4)
#  itexperience_mainoperatingsystem :string(255)
#  itexperience_webusageperweek     :integer(4)
#  itexperience_internetconnection  :string(255)
#  itexperience_mainwebbrowser      :string(255)
#  itexperience_description         :string(255)
#  hasusabtestexperience            :string(255)
#  timestamp                        :datetime
#  annotation                       :text
#  role                             :string(255)
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


