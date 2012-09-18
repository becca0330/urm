# == Schema Information
#
# Table name: tasks
#
#  id                   :integer(4)      not null, primary key
#  order                :integer(4)
#  title                :string(255)
#  description          :text
#  prerequisite         :text
#  possiblesolutionpath :text
#  endingcriteria       :text
#  durationscheduled    :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#  report_id            :integer(4)
#

# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Task < ActiveRecord::Base
  
  belongs_to :report

  has_many :task_results

  def summary
      self.title.to_s.truncate(35)
  end
end

