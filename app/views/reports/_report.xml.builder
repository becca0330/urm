#@project.reports.each do |report| # 1..oo
		xml.report( :generated  => Time.now.strftime("%Y-%m-%dT%H:%m:%SZ"),
		            :testtype   => report.testtype, # ta, he,...
		            :id         => report.id,       # unique report id
		            :order      => report.order || 0# optional: could be used for sort-order
		          ) do

			xml.title report.title      

      xml.timestamp report.created_at.strftime("%Y-%m-%dT%H:%m:%SZ")

      if report.authors.length >0
        xml << render(report.authors
                      ).gsub(/^/, '    ') # correct identation
      else
        logger.warn("THE XML is INCOMPLETE, no authors available!")
      end
     

			xml.description   report.description    # required
			xml.summary       report.executive_summary        # required
			xml.introduction  report.introduction   # required
			xml.methodology   report.methodology    # required
			
			
			xml.persons do  # at least one test-user or staff or heuristic expert
        xml.description report.person_description # required

        #optional: the list of all (optional) personattributes
        customAttribs=CustomAttribute.all 
        xml.personattributes do 
            pa_xml = render(:partial => customAttribs)
            if pa_xml 
              xml << pa_xml.gsub(/^/, '      ') # correct identation
            end
        end
        p_xml = render( :partial    => 'persons/person', 
                        :collection => report.persons)
        if p_xml
				  xml << p_xml.gsub(/^/, '    ') # correct identation
				end # if persons available
      end # of persons (people)

			xml << render(:partial => 'reports/xml/environment', 
			              :locals => {:report => report}
			              ).gsub(/^/, '  ') # correct identation
				
				
			# optional
			xml.training report.training 
			
			
			# optional: tasks and task-results:
			xml << render(  :partial => 'reports/xml/tasks_and_results', 
				              :locals => {:report => report}
				              ).gsub(/^/, '  ') # correct identation
			
	    # for HE ONLY:
    	#xml << render(:partial => 'reports/xml/heuristicissues', 
			#              :locals => {:report => report})
			
			
			# optional: questionnaire and questionnaire-results:
			xml << render(  :partial  => 'reports/xml/questionnaire_and_results', 
  				            :locals   => {:report => report}
  				          ).gsub(/^/, '  ') # correct identation
			
			# optional: interviews:
			if report.interviews.length>0
			  xml.interviews do
			    xml.description report.interviews_description
			    xml << render(report.interviews).gsub(/^/, '    ') # correct identation
		    end
		  end # if some interviews are available

			# optional: transcripts:
			xml << render(  :partial => 'reports/xml/transcripts', 
				              :locals => {:report => report}
				              ).gsub(/^/, '  ') # correct identation

			xml << render(  :partial  => 'reports/xml/analysis', 
				              :locals   => {:report => report}
				              ).gsub(/^/, '  ') # correct identation

			
			# optional appendix (if documents are available ONLY)
			if report.documents.length>0
        xml.appendix do 
          xml.description report.appendix_description         
          xml << render(report.documents).gsub(/^/, '  ') # correct identation
        end # of appendix
      end # export appendix, if report.documents only

      # Some general infos 
      #====================
      
      # for HE ONLY!!:
      # xml << render(:partial => 'reports/xml/heuristics', :locals => {:report => report})

    	
	  end # of one report
  	
#end # of each report