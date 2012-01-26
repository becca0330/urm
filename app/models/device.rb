# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Device < ActiveRecord::Base
  belongs_to :report
	belongs_to :person
	
	#sort by devicetype and title
  def <=>(other)
      return 1 if other.devicetype.nil?
      return -1 if self.devicetype.nil?
      if self.devicetype == other.devicetype 
        return 1 if other.title.nil?
        return -1 if self.title.nil?
        self.title <=> other.title
      else
        self.devicetype <=> other.devicetype
      end
  end
    
	def summary
    self.devicetype.to_s+": '"+self.title.to_s[0,10]+"...':("+self.description.to_s[0,10]+"...)"
  end
  
  
end
