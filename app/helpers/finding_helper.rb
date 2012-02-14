# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module FindingHelper
  # summary information about ALL documents of this finding
  def alldocuments_summary(finding)
    docs=finding.documents
    docs.size.to_s+" doc: "+docs.collect {|doc|  doc.summary.to_s}.join(", ")
  end
  
  
  # summary information about ALL the positive findings
  def allfindings_summary(report)
    return if report.nil?
    fds=report.findings.where("findingtype=?", 'positive')
    pluralize(fds.size, t(:'findings.finding.finding') ) + ": "+fds.collect {|fdg| fdg.title.to_s[0,15]+"..."}.join(", ")
  end
  
  # summary information about ALL the recommendations (=negative findings)
  def allrecommendations_summary(report)
    return if report.nil?
    fds=report.findings.where("findingtype=?", 'recommendation')
    pluralize(fds.size, t(:'findings.recommendation.finding') ) + ": "+fds.collect {|fdg| fdg.title.to_s[0,15]+"..."}.join(", ")
  end
  
end