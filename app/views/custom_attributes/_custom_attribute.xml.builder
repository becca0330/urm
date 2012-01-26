xml.personattribute(:id => "attrib_"+custom_attribute.id.to_s, :order =>  custom_attribute.order || 0) do 
  xml.attribute custom_attribute.title
  # xml.description custom_attribute.description 
end # of a single possible person attribute