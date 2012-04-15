# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module HeuristicHelper

  # summary information about ALL heuristics
  def allheuristics_summary(report)
    return "" if report.nil?
    allheuristics=report.heuristics
    #pluralize(as.size,I18n.t(:'authors.author.author'))+": "+as.collect {|a| a.name.to_s[0,15]+"..."}.join(",")
    titles=allheuristics.collect{|heuristic| heuristic.summary}
    titles.reject!{ |heuristic| heuristic.blank? }
    "(#{allheuristics.size}): "+titles.join(", ")
  end
  
end