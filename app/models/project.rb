# == Schema Information
#
# Table name: projects
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.

class Project < ActiveRecord::Base
  validates_presence_of :title 
  has_many :reports, :dependent => :destroy
  belongs_to :users
  belongs_to :roles

 	def summary
      self.title.to_s.truncate(15)+": "+self.description.to_s.truncate(25)
  end

end

