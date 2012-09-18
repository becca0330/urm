# == Schema Information
#
# Table name: videos
#
#  id                      :integer(4)      not null, primary key
#  person_id               :integer(4)
#  doctype                 :string(255)
#  description             :text
#  source                  :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer(4)
#  attachment_updated_at   :datetime
#

# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Video < ActiveRecord::Base
  # this works with gem paperclip!
  # used for attaching files
  # see: http://www.alfajango.com/blog/remotipart-rails-gem/
  has_attached_file :attachment

  belongs_to :person
  
  
  def summary
      self.description.to_s.truncate(15)
  end
    
end

