# REQUIRED:
xml.analysis do # "TODO analysis (also called 'discussion')"
  xml.description report.analysis_description

  if report.findings.length>0 # there should exist some findings, but who knows
    xml << render(report.findings).gsub(/^/, '  ') # correct identation
  end

end # of analysis (discussion)