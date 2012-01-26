# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module InterviewHelper
  # summary information about ALL questions/answers of ONE interview
  def allqandas_summary(interview)
    qs=interview.qandas
    pluralize(qs.size,I18n.t(:'interviews.interview.qandas.qanda.qanda') ) + "."
  end
  
  
  # summary information about ALL the interviews
  def allinterviews_summary(report)
    return if report.nil?
    ivs=report.interviews.sort
    pluralize(ivs.size,I18n.t(:'interviews.interview.interview') ) + ": "+ivs.collect {|iv| "with "+(
        (iv.person.nil?) ? "" : iv.person.name
        ).to_s[0,15]+"..."}.join(", ")
  end
  
  
end