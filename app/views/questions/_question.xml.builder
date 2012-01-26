# for several qustions
xml.question(:id => "question_"+question.id.to_s, :order => question.order || 0) do
      xml.description   question.description  # REQUIRED
      xml.rangefrom     question.rangefrom    # REQUIRED
      xml.rangeto       question.rangeto      # REQUIRED
      xml.rangescale    question.rangescale   # REQUIRED
      xml.notice        question.notice       # optional
end # of a single question
