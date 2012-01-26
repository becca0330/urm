# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class TaskResultsController < ApplicationController

  # handle the AJAX-calls
  
  def new
    @report = Report.find(params[:report_id])
    
    logger.info("ajax-add a new task result for given report...")
    @task_result = TaskResult.new
    
    logger.info("pre-fill person '#{session[:last_person_id]}'")
    if session[:last_person_id]
      @task_result.person_id = session[:last_person_id]
    end
    
    logger.info("pre-fill timestamp '#{session[:last_time]}' for task result")
    if session[:last_time]
      @task_result.start = session[:last_time]
      @task_result.end = session[:last_time]
    end
    
    @report.task_results.push(@task_result)
    
    respond_to do | format |  
      format.js {
        render(:new, :locals=>{:task_result=>@task_result}) 
      }  
    end
  end
  
  
  def destroy
    @task_result = TaskResult.find(params[:id])
    
    puts("LOG: ajax-remove current task_result #{@task_result.summary }")
    @task_result.delete
    respond_to do | format |  
      format.js {
        render(:destroy, :locals=>{:task_result=>@task_result}) 
      }  
    end
    
  end

  def update
    @task_result = TaskResult.find(params[:id])

    logger.debug("ajax-update current task_result #{@task_result.summary }")
    @task_result.update_attributes(params[:task_result])
    
    session[:last_person_id] = @task_result.person_id
    logger.info("remember person '#{session[:last_person_id]}' of last modified task_result (to pre-fill a upcoming new task result)")

    session[:last_time] = @task_result.end
    logger.info("remember end-time '#{session[:last_time]}' of last modified task result (to pre-fill a upcoming new task result)")
    
    
    render(:locals=>{:task_result=>@task_result}) 
  end


end