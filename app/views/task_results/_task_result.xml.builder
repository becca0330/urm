xml.taskresult( :taskid => "task_"+task_result.task_id.to_s, 
                :personid => "person_"+task_result.person_id.to_s ) do
  if task_result.start
    xml.start         task_result.start         #  optional: Time.now.strftime("%Y-%m-%dT%H:%m:%SZ")
  end
  if task_result.end
    xml.end           task_result.end           #  optional
  end
  xml.durationactual  task_result.durationactual# e.g. 5 secs optional
  xml.completion      task_result.completion    # z.B. "60%" REQUIRED
  xml.withassistance  task_result.withassistance# optional
  xml.notice          task_result.notice        # optional
end # of a single taskresult