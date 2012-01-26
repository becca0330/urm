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
      self.description.to_s[0,15]+"..."
  end
    
end
