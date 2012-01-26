# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Persontype < ActiveRecord::Base
  def name_with_description
      return name + " ("+description+")"
  end
end
