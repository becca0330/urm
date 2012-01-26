xml.interview(:personid => "person_"+interview.person_id.to_s) do  
  if interview.qandas.length > 0 
    xml << render(interview.qandas).gsub(/^/, '  ') # correct identation
  end # if question and answers available
end
