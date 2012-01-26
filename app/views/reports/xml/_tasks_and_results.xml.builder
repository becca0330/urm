# tasks are optional
if report.tasks.length>0
  xml.tasks do
    xml.description report.task_description
    xml << render(report.tasks).gsub(/^/, '  ') # correct identation
  end
end

# loop over several taskresults. optional
if report.task_results.length>0
    xml << render(report.task_results).gsub(/^/, '  ') # correct identation
end