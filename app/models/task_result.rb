# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class TaskResult < ActiveRecord::Base
  belongs_to :person
	belongs_to :report
	belongs_to :task
	
	def summary
      #self.id.to_s+":"+self.start.to_s+"-"+self.end.to_s+"..."
      "#{ self.person ? self.person.name.to_s[0,10] : ''}: #{ self.task ? self.task.title.to_s[0,20] : ''} (#{self.completion}%)" 
  end
  
  
  
  # to set "session at" - timestamps (starttime endtime) for a task results:
  
 
  
end