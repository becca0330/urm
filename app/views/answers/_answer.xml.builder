# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


# for several answers
xml.answerforquestion(:questionid => "question_"+answer.question_id.to_s)do
   xml.answer(:personid => "person_"+answer.person_id.to_s)do
     xml.value answer.value
   end # of single answer
end # of single answer for a question
