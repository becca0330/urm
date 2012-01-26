# questionnaire are optional
if report.questions.length>0
  xml.questionnaire do
    xml.description report.questionnaire_description
    xml << render(report.questions).gsub(/^/, '  ') # correct identation
  end # for each question
end # if questions available


# questionnaireresults optional
if report.answers.length>0
  xml.questionnaireresults do
    xml.description report.questionnaireresults_description
    xml << render(report.answers).gsub(/^/, '  ') # correct identation
    xml.summary report.questionnaireresults_summary
  end # for each result (for each answer)  
end # if answers available

