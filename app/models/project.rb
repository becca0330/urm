# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.

class Project < ActiveRecord::Base
  validates_presence_of :title 
  has_many :reports, :dependent => :destroy

 	def summary
      self.title.to_s[0,15]+": "+self.description.to_s[0,25]+"..."
  end

end
