# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module TaskResultHelper

  # summary information about ALL tasks results (task completion)
  def alltask_results_summary(report)
    return if report.nil?
    results=report.task_results
    results.size.to_s+" tasks completions: "+results.collect { |r| 
      "#{ r.person ? r.person.name.to_s[0,10] : ''}: #{ r.task ? r.task.title.to_s[0,20] : ''} (#{r.completion}%)" 
    }.join(", ")
  end
  
end