# == Schema Information
#
# Table name: attributes_of_people
#
#  id                  :integer(4)      not null, primary key
#  custom_attribute_id :integer(4)
#  person_id           :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#  value               :string(255)
#

# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class AttributesOfPerson < ActiveRecord::Base

  	belongs_to :custom_attribute 	# foreign key - custom_attribute_id
		belongs_to :person 				# foreign key - person_id
		
end

