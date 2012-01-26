# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class QuestionsController < ApplicationController

  # handle the AJAX-calls
  
  def new
    @report = Report.find(params[:report_id])
    
    logger.info("ajax-add a new question for given report...")
    @question = Question.new
    @report.questions.push(@question)
    
    respond_to do | format |  
      format.js {
        render(:new, :locals=>{:question=>@question}) 
      }  
    end
  end
  
  
  def destroy
    @question = Question.find(params[:id])
    
    puts("LOG: ajax-remove current question #{@question.summary }")
    @question.delete
    respond_to do | format |  
      format.js {
        render(:destroy, :locals=>{:question=>@question}) 
      }  
    end
    
  end

  def update
    @question = Question.find(params[:id])

    logger.debug("ajax-update current question #{@question.summary }")

    @question.update_attributes(params[:question])
    
    render(:locals=>{:question=>@question}) 
  end


end