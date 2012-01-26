xml.document(:listat => "bibliography", :type => document.doctype) do 
  xml.description document.description
  if (document.doctype =="doc") # doc or url or reference
    xml.filename document.attachment.url
  elsif (document.doctype =="url") # doc or url or reference
    xml.uri document.source
  else # document.doctype == "link" doc or url or reference
    xml.reference document.source
  end
end
