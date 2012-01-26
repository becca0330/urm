# TODO: findingtypes: positive, recommendation, discussion (with numeric priority)
xml.finding(:id => "finding_"+finding.id.to_s,
            :findingtype => finding.findingtype, 
            :priority => finding.priority) do 
    xml.title       finding.title       # e.g. "Interface"
    xml.description finding.description # e.g. "The website's interface is well-structured and ..."
    # optional lists of videoclips
    # ...each. for list of TODO
      # Note: video must be assigned to a person before! (see videoid)
      xml.videoclip(:videoid => "video_1" , :personid =>"person_1") do
        xml.description "TODO video-clip_A002"
        xml.starttime "23:00"
        xml.endtime "24:04"
      end # of single video
    # end listo of videoclipse
    
    # for several documents of the report analysis (=report discussion)
    if finding.documents.length > 0
      xml << render(finding.documents)
    end
    
    # optional 0..several codefererences
    # list of codereferences
      xml.codereference(  :projectid  => "p1",
                          :versionid  => "v1",
                          :packageid  => "p1",
                          :classid    => "c1",
                          :methodid   => "m1",
                          :lineno     =>  "l1") do
        xml.notice "todo: this finding is connected to this line of code, because,..."
      end # of a single codereference
    # end list of codereferences
  
end # of finding