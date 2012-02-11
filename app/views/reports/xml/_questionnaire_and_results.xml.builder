# questionnaire are optional
if report.questions.length>0
  xml.questionnaire do
    xml.description report.questionnaire_description
    xml << render(report.questions).gsub(/^/, '  ') # correct identation
  end # for each question
end # if questions available


# questionnaireresults optional (=answerforquestion)
if report.answers.length>0
  xml.questionnaireresults do
    xml.description report.questionnaireresults_description
    # combine all answers for one question into a block
    allanswers=report.answers_sorted_by_questionid
    # hash with key=question-ID qid and value = list-of-answers loa
    h = Answer.allanswers_hash(allanswers)
    h.each do |qid, loa|
      xml.answerforquestion(:questionid => "question_"+qid.to_s) do
        loa.each do |a|
          xml << render(a).gsub(/^/, '  ') # correct identation
        end
      end
    end
    xml.summary report.questionnaireresults_summary
  end # for each result (for each answer)  
end # if answers available

