# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module AuthorHelper

  # summary information about ALL authors
  def allauthors_summary(report)
    return "" if report.nil?
    allauthors=report.authors
    #pluralize(as.size,I18n.t(:'authors.author.author'))+": "+as.collect {|a| a.name.to_s[0,15]+"..."}.join(",")
    titles=allauthors.collect{|author| author.summary}
    titles.reject!{ |author| author.blank? }
    "(#{allauthors.size}): "+titles.join(", ")
  end
  
end