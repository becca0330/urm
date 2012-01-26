# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module AuthorHelper

  # summary information about ALL authors
  def allauthors_summary(report)
    return if report.nil?
    as=report.authors
    pluralize(as.size,I18n.t(:'authors.author.author'))+": "+as.collect {|a| a.name.to_s[0,15]+"..."}.join(",")
  end
  
end