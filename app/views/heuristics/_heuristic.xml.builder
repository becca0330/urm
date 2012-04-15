# single heuristic 
# TODO: add order for output
xml.heuristic(:id => "heuristic_"+heuristic.id.to_s, :order => 0) do
    xml.title heuristic.title
    xml.description heuristic.description
end # of a single heuristic
