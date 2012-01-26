# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class InterviewsController < ApplicationController

  # handle the AJAX-calls
  
  def new
    @report = Report.find(params[:report_id])
    
    logger.info("ajax-add a new interview for given report...")
    @interview = Interview.new
    @report.interviews.push(@interview)
    
    respond_to do | format |  
      format.js {
        render(:new, :locals=>{:interview=>@interview}) 
      }  
    end
  end
  
  
  def destroy
    @interview = Interview.find(params[:id])
    
    puts("LOG: ajax-remove current interview #{@interview.summary }")
    @interview.delete
    respond_to do | format |  
      format.js {
        render(:destroy, :locals=>{:interview=>@interview}) 
      }  
    end
    
  end

  def update
    @interview = Interview.find(params[:id])

    logger.debug("ajax-update current interview #{@interview.summary }")

    @interview.update_attributes(params[:interview])
    
    render(:locals=>{:interview=>@interview}) 
  end


end