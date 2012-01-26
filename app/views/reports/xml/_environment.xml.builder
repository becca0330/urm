xml.environment do # REQUIRED environment
  xml.description report.environment_description
  
  if report.devices.length > 0 
      xml << render(report.devices).gsub(/^/, '  ') # correct identation
  end # if some devices (Note HE: devices belonging to a person) are available
  
end # of environment