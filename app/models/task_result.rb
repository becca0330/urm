# == Schema Information
#
# Table name: task_results
#
#  id             :integer(4)      not null, primary key
#  report_id      :integer(4)
#  person_id      :integer(4)
#  durationactual :integer(4)
#  completion     :integer(4)
#  withassistance :boolean(1)
#  notice         :text
#  created_at     :datetime
#  updated_at     :datetime
#  task_id        :integer(4)
#  start          :time
#  end            :time
#

# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class TaskResult < ActiveRecord::Base
  belongs_to :person
	belongs_to :report
	belongs_to :task
	
	def summary
      #self.id.to_s+":"+self.start.to_s+"-"+self.end.to_s+"..."
      "#{ self.person ? self.person.name.to_s.truncate(10) : ''}: #{ self.task ? self.task.title.truncate(20) : ''} (#{self.completion}%)" 
  end
  
  # to set "session at" - timestamps (starttime endtime) for a task results:
  
end
