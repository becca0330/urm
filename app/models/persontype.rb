# == Schema Information
#
# Table name: persontypes
#
#  id          :integer(4)      not null, primary key
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string(255)
#

# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Persontype < ActiveRecord::Base
  def name_with_description
      return name + " ("+description+")"
  end
end

