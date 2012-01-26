# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Qanda < ActiveRecord::Base
  belongs_to :interview
  
  def summary
     self.quest.to_s[0,18]+"..."
   end
   
   # sort question-and-answer by question-id (id given by creation). TODO: order for qanda (necessary?)
   def <=>(other)
      self.id <=> other.id
   end
   
end