# == Schema Information
#
# Table name: document_of_reports
#
#  id          :integer(4)      not null, primary key
#  document_id :integer(4)
#  report_id   :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class DocumentOfReport < ActiveRecord::Base
  
    # a report might hold several documents
  	belongs_to :report 		# foreign key - report_id
		belongs_to :document 	# foreign key - document_id
		
end

