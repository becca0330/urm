# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module PersonHelper

  # summary information about ALL persons  testusers (=person with persontype_id ==1 .name="user")
  def alltestusers_summary(report)
    ps=report.persons.where("persontype_id=?",1)
    pluralize(ps.size,I18n.t(:'persons.testuser.person') ) + ": "+ps.collect {|p|  p.summary.to_s}.join(", ")
  end

  
  def allstaff_summary(report)
    ps=report.persons.where("persontype_id=?",2)
    pluralize(ps.size,I18n.t(:'persons.staff.person') ) + ": "+ps.collect {|p|  p.summary.to_s}.join(", ")
  end
  
  
  # summary information about ALL videos of a person
  def allvideos_of_person_summary(person)
    vds=person.videos
    pluralize(vds.size,I18n.t(:'videos.video.video') ) + ": "+vds.collect {|vdo|  vdo.summary.to_s}.join(", ")
  end
  
  
end