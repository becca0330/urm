# show finding_id ONLY, if finding is available!
# ternery operator in ONE line for ruby 1.8.7:  ? : 
attributes = transcript_event.finding ?  {   
          :eventcodeid  => "eventcode_"+transcript_event.eventcode_id.to_s, 
          :findingid   => "finding_"+transcript_event.finding_id.to_s
        }   : { 
          :eventcodeid  => "eventcode_"+transcript_event.eventcode_id.to_s
        } 
    
xml.logentry(attributes) do # eventcodeid (for event-code such as "S" = Start)
    xml.timestamp   transcript_event.timestamp
    xml.description transcript_event.event    # Test Person enters room
    
end # of a single event (of the transcript) of a person for a report