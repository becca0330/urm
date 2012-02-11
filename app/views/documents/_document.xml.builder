# Note: document.doctype "type" might be 
#   "image" or "link" or "doc" or "bibentry"
# Note: list at "listat" might be 
#   "bibliography" or "transcripts" or "testusermaterial" or "evaluationteammaterial"
# see schema "usabml-ta.xsd" for details 
# a document might have ONE or SEVERAL of following entries
#   filename    for a local document
#   uri         for a remote document
#  (REMOVED: reference   for a bib-tex description of the source, 
#            we store it now direct in the contents of description)
xml.document(:listat => "bibliography", :type => document.doctype) do 
  xml.description document.description
  if (document.doctype =="doc") # a 'local' doc 
    xml.filename document.attachment.url
  elsif (document.doctype =="link") # doc remote link (=url)
    xml.uri document.source
  else # document.doctype == "bibentry" (= reference with info direct in "description")
    # xml.reference document.source
  end
end
