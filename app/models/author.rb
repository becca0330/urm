# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Author < ActiveRecord::Base
  belongs_to :report
  
  def summary
    self.name.to_s[0,10]+"..."
  end
  

end
