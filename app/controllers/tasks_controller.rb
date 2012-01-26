# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class TasksController < ApplicationController

  # handle the AJAX-calls
  
  def new
    @report = Report.find(params[:report_id])
    
    logger.info("ajax-add a new task for given report...")
    @task = Task.new
    @report.tasks.push(@task)
    
    respond_to do | format |  
      format.js {
        render(:new, :locals=>{:task=>@task}) 
      }  
    end
  end
  
  
  def destroy
    @task = Task.find(params[:id])
    
    puts("LOG: ajax-remove current task #{@task.summary }")
    @task.delete
    respond_to do | format |  
      format.js {
        render(:destroy, :locals=>{:task=>@task}) 
      }  
    end
    
  end

  def update
    @task = Task.find(params[:id])

    logger.debug("ajax-update current task #{@task.summary }")

    @task.update_attributes(params[:task])
    
    render(:locals=>{:task=>@task}) 
  end


end