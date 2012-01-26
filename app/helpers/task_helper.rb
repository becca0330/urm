# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module TaskHelper

  # summary information about ALL tasks
  def alltasks_summary(report)
    return if report.nil?
    tsks=report.tasks
    pluralize(tsks.size, t(:'tasks.task.task') ) + ": "+tsks.collect { |t| t.summary }.join(",")
  end
  
end