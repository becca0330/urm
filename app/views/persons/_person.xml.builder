pt=(person.persontype) ? person.persontype.name : "unknown" # user, heexpert, staff
xml.person(:persontype => pt, :id=>"person_"+person.id.to_s) do
			xml.name person.name      # required
			xml.alias person.alias    # required
			xml.gender person.gender  # required
			xml.age person.age        # OPTIONAL
			xml.timestamp person.timestamp  # required
			
			# TODO: output role(s?) (for staff only): interviewer, observer,...
			if (person.persontype_id==2) # persontype 1=testuser 2=staff 3=heexpert
			 xml.role person.role # moderator, (owners?), scribe 
		  end
		  
		  # include following attributes edu/occup/itexp/hasusabtestex/customattribs
		  # for test users only (NOT: for heexperst or staff)
		  if (person.persontype_id==1) # persontype 1=testuser 2=staff 3=heexpert
				xml.education person.education # OPTIONAL. REQUIRED if role is available
				xml.occupation person.occupation # OPTIONAL
				xml.itexperience do       # OPTIONAL. REQUIRED only, if education is available
				  xml.level               person.itexperience_level # REQUIRED if itexperience available: beginner, intermediate, developer
				  xml.pcusageinyears      person.itexperience_pcusageinyears      # optional
				  xml.pcusageperweek      person.itexperience_pcusageperweek      # optional
				  xml.mainoperatingsystem person.itexperience_mainoperatingsystem # optional
				  xml.webusageperweek     person.itexperience_webusageperweek     # optional
				  xml.internetconnection person.itexperience_internetconnection   # optional
				  xml.mainwebbrowser      person.itexperience_mainwebbrowser      # optional
				  xml.description         person.itexperience_description         # optional: info about browser, internetconnection....
				end # of it-experience
			  xml.hasusabtestexperience person.hasusabtestexperience # OPTIONAL: YES, NO, UNKNOWN
			  
			  if person.attributes_of_persons.length>0 # OPTIONAL: custom attributes 
			    xml.customattributes do # one or several customattributes (see above for values)
			      xml << render(:partial => person.attributes_of_persons,
			                    :locals => {:person => person}).gsub(/^/, '       ')
		      end # of customattributes 
			  end # if custom attributes are available
		  end # of is test user (so ouput further attributes)
		  
		  xml.annotations person.annotation #OPTIONAL: annotations e.g.: wears glasses, color blind
		  
		  if person.videos.length > 0
		    xml << render(:partial => person.videos)
	    end # if videos exists for this person
		  
		  # TODO OPTIONAL: some documents
		  # person.docs.each |v| do # TODO description and a link/uri/ref to a document
		  #xml << render(:partial => 'xml_document', :locals => {:report => report})
		  #TODO
		  # xml.documents render(person.documents, :locals => {:report => report})
		  # end
		  
		  
end # of one person
