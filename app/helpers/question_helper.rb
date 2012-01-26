# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module QuestionHelper

  # summary information about ALL questions (= questionnaire)
  def allquestions_summary(report)
    return if report.nil?
    qs=report.questions.sort
    pluralize(qs.size,I18n.t(:'questions.question.question') ) + ": "+qs.collect {|a| a.order.to_s+": "+a.description.to_s[0,25]+"..."}.join(", ")
  end
  
end