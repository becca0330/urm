# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.

require 'set'

module AnswerHelper

  # summary information about ALL answers
  def allanswers_summary(report)
    
    answs=report.answers
    
    # output the questions ordered by the number given in attribute "order"
    questions = report.questions.sort # set order in model (no need for _by{|q| q.order})
    
    # remove empty answers
    answs.delete_if{ |a| a.question_id.nil? }
    
    stat={} # empty hash for statistics
    
    # unique question-ids
    q_ids=Set.new answs.collect{ |a| a.question_id} 
    
    # prepare for every question a list of answer-values
    q_ids.each{|qid| stat[qid] = [] } 
    
    # fill in the answer- values
    answs.each {|a| stat[a.question_id] << a.value.to_i} 
    
    render( :partial => "/answers/summary_with_statistics", 
            :locals => {:count      => answs.size,
                        :questions  => questions,
                        :statistic  => stat 
                        }
          )
  end
  
end