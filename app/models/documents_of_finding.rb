# == Schema Information
#
# Table name: documents_of_findings
#
#  id          :integer(4)      not null, primary key
#  document_id :integer(4)
#  finding_id  :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class DocumentsOfFinding < ActiveRecord::Base
  
  # a finding holds one or many documents (m:n)
  belongs_to :finding 	# foreign key - report_id
	belongs_to :document 	# foreign key - document_id
	
end

