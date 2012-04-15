# heuristics for 
if report.heuristics.length>0
  xml.heuristics do # TODO sort by 'order'
    xml << render(report.heuristics).gsub(/^/, '  ') # correct identation
  end
end
