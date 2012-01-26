xml.customattribute(:personattributeid => "attrib_"+attributes_of_person.id.to_s ) do
    xml.value attributes_of_person.value 
end # end of customattribute