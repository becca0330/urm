# OPTIONAL: several videos belonging to a person
xml.video(:id => "video_"+video.id.to_s, :type => video.doctype ) do 
  xml.description video.description
  if (video.doctype == "link") # local video / or link to video
    xml.uri video.source
  else # doctype == "doc"
    xml.filename video.source 
  end
end # of a single video