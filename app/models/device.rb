# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Device < ActiveRecord::Base
  belongs_to :report
	belongs_to :person
	
	#sort by devicetype and title
  def <=>(other)
      return  1 unless other.devicetype
      return -1 unless  self.devicetype
      if self.devicetype == other.devicetype 
        return  1 unless other.title
        return -1 unless  self.title
        self.title <=> other.title
      else
        self.devicetype <=> other.devicetype
      end
  end
    
	def summary
    self.devicetype.to_s+": '"+self.title.to_s[0,10]+"...':("+self.description.to_s[0,10]+"...)"
  end
  
  
end
