# TA: Coding scheme for test protocol. E.g. code "S" for event "Start of task."
xml.eventcode(:id =>"eventcode_"+eventcode.id.to_s) do # a single eventcode
  xml.code        eventcode.code         # e.g.: "S"
  xml.description eventcode.description  # e.g.: "Start of Task"
end # of single eventcode