# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Task < ActiveRecord::Base
  
  belongs_to :report

  has_many :task_results

  def summary
      self.title.to_s[0,35]+"..."
  end
end
