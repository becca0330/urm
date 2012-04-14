xml.transcripts do # output transscripts with many single transcipt_events
  xml.description report.transcripts_description
  
  if @Eventcodes.length > 0 
    xml.eventcodes do # for all possible event codes
      xml << render(@Eventcodes).gsub(/^/, '  ') # correct identation
    end # of EventCodes
  end # if some eventcodes are available
  
 
  for p in report.persons
    # has person p done a transcript?
    #  if so, transcript events exits
    if p.transcript_events.length>0 
      xml.transcript(:personid => "person_"+p.id.to_s) do #  Note: person id MUST EXIST !
         xml << render(p.transcript_events).gsub(/^/, '  ') # correct identation
      end # of single transscript 
    end # of person with transcript events
  
  end # of person-loop (who -might- have done a transcipt)

end # of transscripts
