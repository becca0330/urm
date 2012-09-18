# == Schema Information
#
# Table name: documents
#
#  id                      :integer(4)      not null, primary key
#  listat                  :string(255)
#  description             :text
#  source                  :text
#  created_at              :datetime
#  updated_at              :datetime
#  doctype                 :string(255)
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer(4)
#  attachment_updated_at   :datetime
#

# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Document < ActiveRecord::Base

  # one or many documents belong to a report
  has_many :document_of_reports
	has_many :reports, :through => :document_of_reports
	
	# one or many documents belong to a finding
	has_many :documents_of_findings
	has_many :findings, :through => :documents_of_findings
	
	
	has_attached_file :attachment
	
	def summary
	  msg  = self.description ? self.description : ""
	  if self.doctype=="link" # for a link we want to show the url also: 
	    msg += ":" unless msg.empty? || self.source || self.source.size<1
	    msg += (self.source && self.source.size>0) ? "("+self.source+")" : ""
    end
    msg.truncate(30)
  end
	
	
end

