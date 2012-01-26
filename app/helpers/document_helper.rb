# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module DocumentHelper

  # summary information about ALL tasks
  def alldocuments_summary(report)
    return if report.nil?
    docs=report.documents
    pluralize(docs.size, t( :'documents.document') )+": "+docs.collect { |d| d.summary }.join(", ")
  end
  
  def alldocuments_summary_for_finding(finding)
    return if finding.nil?
    docs=finding.documents
    pluralize(docs.size, t( :'documents.document.document') )+": "+docs.collect { |d| d.summary }.join(", ")
  end
  
  
end