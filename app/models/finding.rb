# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Finding < ActiveRecord::Base
  belongs_to 	:report
  has_many  :transcript_events
  
  # a finding holds one or many documents (m:n)
	has_many :documents_of_findings
	has_many :documents, :through => :documents_of_findings

  accepts_nested_attributes_for :documents_of_findings

	def summary
	  t=self.title.to_s.truncate(35) || ""
	  d= self.description.to_s.empty? ? "" : ": "+self.description.to_s.truncate(25)
	  t+d
  end

end
