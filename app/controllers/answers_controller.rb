# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class AnswersController < ApplicationController

  # handle the AJAX-calls
  
  def new
    @report = Report.find(params[:report_id])
    
    logger.info("ajax-add a new answer for given report...")
    @answer = Answer.new
    
    # suggest same person as with last answer
    logger.info("pre-fill person '#{session[:last_person_id]}'")
    if session[:last_person_id]
      @answer.person_id = session[:last_person_id]
    end
    
    @report.answers.push(@answer)
     
    
    respond_to do | format |  
      format.js {
        render(:new, :locals=>{:answer=>@answer}) 
      }  
    end
  end
  
  
  def destroy
    @answer = Answer.find(params[:id])
    
    puts("LOG: ajax-remove current answer #{@answer.summary }")
    @answer.delete
    respond_to do | format |  
      format.js {
        render(:destroy, :locals=>{:answer=>@answer}) 
      }  
    end
    
  end

  def update
    @answer = Answer.find(params[:id])
    
    session[:last_person_id] = @answer.person_id
    logger.info("remember person '#{session[:last_person_id]}' of last modified anwser (to pre-fill a upcoming new answer)")
    

    logger.debug("ajax-update current answer #{@answer.summary }")
    @answer.update_attributes(params[:answer])
    
    render(:locals=>{:answer=>@answer}) 
  end


end