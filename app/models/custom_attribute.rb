# == Schema Information
#
# Table name: custom_attributes
#
#  id          :integer(4)      not null, primary key
#  order       :integer(4)
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class CustomAttribute < ActiveRecord::Base

  has_many :attributes_of_persons
	has_many :persons, :through => :attributes_of_persons

end

