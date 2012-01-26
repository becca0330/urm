# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module PersonHelper

  # summary information about ALL authors
  def allpersons_summary(report)
    ps=report.persons
    pluralize(ps.size,I18n.t(:'persons.person.person') ) + ": "+ps.collect {|p|  p.summary.to_s}.join(", ")
  end
  
  
  # summary information about ALL videos of a person
  def allvideos_of_person_summary(person)
    vds=person.videos
    pluralize(vds.size,I18n.t(:'videos.video.video') ) + ": "+vds.collect {|vdo|  vdo.summary.to_s}.join(", ")
  end
  
  
end