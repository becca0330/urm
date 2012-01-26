# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class AttributesOfPerson < ActiveRecord::Base

  	belongs_to :custom_attribute 	# foreign key - custom_attribute_id
		belongs_to :person 				# foreign key - person_id
		
end
