# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module ApplicationHelper

  def toggler(div_name,obj) # e.g. author of class Author
    name = obj.class.name.underscore # author (for class = Author)
    # e.g. "$('#toggle_all_authors_of_report_#{report.id}').toggle(
		#              saveState('#toggle_all_authors_of_report_#{report.id}')  )"
    "$('#{div_name}#{name}_#{obj.id}').toggle(saveState('#{div_name}#{name}_#{obj.id}'))"
  end
end
