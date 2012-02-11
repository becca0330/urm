# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


# for a single answer
if not answer.value.nil? # we output only real answers!
  xml.answer(:personid => "person_"+answer.person_id.to_s)do
       xml.value answer.value
  end  # of single answer
end 