# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module ReportHelper

  # summary information about ALL reports (of a project)
  def allreports_summary(project)
    return if project.nil?
    reports=project.reports
    #pluralize(reports.size,I18n.t(:'reports.report.report'))+": "+reports.collect {|rpt| rpt.summary.to_s[0,15]+"..."}.join(",")
    # "(#{reports.size}) "+reports.collect {|rpt| rpt.summary.truncate(7)}.join(",")
    titles=reports.collect{|rpt| rpt.summary}
    titles.reject!{|el| el.nil? || el==""}
    "(#{reports.size}): "+titles.join(", ")
  end
end