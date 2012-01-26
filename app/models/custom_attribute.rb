# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class CustomAttribute < ActiveRecord::Base

  has_many :attributes_of_persons
	has_many :persons, :through => :attributes_of_persons

end
