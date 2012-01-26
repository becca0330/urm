# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Eventcode < ActiveRecord::Base
  
  has_many :transcript_events, :dependent => :destroy
  	
  	
  def summary
     self.code.to_s + ": "+self.description.to_s[0,10]+"..."
   end	
  	
  def code_and_description
    return code + ": "+description
  end
end
