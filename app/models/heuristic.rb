# == Schema Information
#
# Table name: heuristics
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :text
#  report_id   :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class Heuristic < ActiveRecord::Base
  belongs_to :report
  
  def summary
    self.title ? self.title.truncate(30) : ""
  end
end

