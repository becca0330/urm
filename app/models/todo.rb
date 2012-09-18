# == Schema Information
#
# Table name: todos
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :text
#  user_id     :integer(4)
#  solved      :boolean(1)
#  priority    :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Todo < ActiveRecord::Base

  after_initialize  :init

    def init
       self.priority ||= 1
    end
    
    
  def summary
      self.title.to_s.truncate(12)+":"+self.description.to_s.truncate(25)+" ("+self.solved.to_s+")"
  end
  
  def pretty_date
    self.updated_at.strftime("%Y-%m-%d")
  end
  
end

