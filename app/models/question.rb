# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Question < ActiveRecord::Base
  	belongs_to :report
  	
  	has_many :answers, :dependent => :destroy
  	
  	def summary
  	   msg=self.order.to_s+". "
  	   if self.rangescale && self.rangescale.length>0 
         msg+=self.description.to_s[0,30]+" ("+self.rangescale.to_s+")..."
       else
         msg+=self.description.to_s[0,35]+"..."
       end
       msg
     end
   
   
  # sort questions by 'order' attribute
  def <=>(other)
    return  1 unless other && other.order
    return -1 unless  self && self.order
    self.order <=> other.order
  end 
  	
end
