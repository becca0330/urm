# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module ReportHelper

  # summary information about ALL reports (of a project)
  def allreports_summary(project)
    return if project.nil?
    reports=project.reports
    pluralize(reports.size,I18n.t(:'reports.report.report'))+": "+reports.collect {|rpt| rpt.summary.to_s[0,15]+"..."}.join(",")
  end
end