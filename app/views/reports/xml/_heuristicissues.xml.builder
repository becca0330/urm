# for HE only

xml.heuristicissues do
       xml.description report.heuristicissues_description
#       TODO: heuristicissues used for theHE

#       # optional some issues TODO loop
#       xml.heuristicissue(:heuristicid => "h1", :id => 4) do
#         xml.description "he1 descr" # TODO required
#         xml.notice "he1 descr" # TODO required
#         xml.direction "up" # TODO required
#         xml.reproduce "yes" # TODO required
#         xml.severity(:personid => "TP1-Pilot")do # TODO some existing user PID
#           xml.value 4 # optional
#         end # of severity 
#         xml.found(:personid => "TP1-Pilot")do # TODO some existing user PID
#          xml.value true # TODO required
#         end
#             # todo for several documents of the current heuristic issue
#             xml << render(:partial => 'xml_document', :locals => {:report => report})
#             # TODO: see above for details of how to create a codereference
#             # xml.codereference "TODO... ??? WHERE" # do NOT replicate code !!
#       end # of a single heuristic issue
end # of heuristicissues


