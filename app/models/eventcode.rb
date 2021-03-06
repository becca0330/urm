# == Schema Information
#
# Table name: eventcodes
#
#  id          :integer(4)      not null, primary key
#  code        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Eventcode < ActiveRecord::Base
  
  has_many :transcript_events, :dependent => :destroy
  	
  	
  def summary
     self.code.to_s + ": "+self.description.to_s.truncate(10)
   end	
  	
  def code_and_description
    return code + ": "+description
  end
end

