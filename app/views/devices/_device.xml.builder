# Note for HE the "device" will be assigned to a person via personid attribute
#  (not necessary with TA)
xml.device(:devicetype => device.devicetype) do # devicetype: cam/location/pc
    xml.title       device.title        # REQUIRED  settings... and so on
    xml.description device.description  # REQUIRED  settings... and so on
    if ("docgiven"== "true")# TODO: OPTIONAL if available
			  # devices.docs.each |v| do # TODO description and a link/uri/ref to a document
			    xml << render(:partial => 'xml_document', 
			                  :locals => {:report => report})
			  # end # of documents for devices
    end
end # of a single device
