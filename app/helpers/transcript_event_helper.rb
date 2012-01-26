# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module TranscriptEventHelper

  # summary information about ALL transcripts
  def alltranscript_events_summary(report)
    return if report.nil?
    ts=report.transcript_events.sort
    #ts.size.to_s+" events: "+ts.collect { |t| t.summary }.join(", ")
    render( :partial => "/transcript_events/summary", 
              :locals => {:count      => ts.size,
                          :events      => ts,
                          :persons    => report.persons.sort
                          }
            )
  end
  
end