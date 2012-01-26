# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class ReportsController < ApplicationController

  # 2011-12-22:
  # AJAX-call
  # get url=/reports/ajax_add => rails-path="ajax_add_reports" 
  def ajax_add
    @project = Project.find(params[:project_id])
    
    logger.info("ajax-add a new report for given project...")
    @report = Report.new
    
    # create some default fields/sections to be available 
    # the MUST-HAVE sections: at least one author and at least one....
    @report.authors.build
    
    @project.reports.push(@report)
    
    respond_to do | format |  
      format.js {
        render(:ajaxaddnew, :locals=>{:report=>@report}) 
      }  
    end
    
  end
  
  # AJAX-call
  def ajax_remove
    @report = Report.find(params[:id])
    
    puts("LOG: ajax-remove current report #{@report.summary }")
    @report.delete
    respond_to do | format |  
      format.js {
        render(:ajaxremove, :locals=>{:report=>@report}) 
      }  
    end
    
  end
  
  # AJAX-call
   def update
     @report = Report.find(params[:id])

     logger.debug("ajax-save current report #{@report.summary }")
     
     params[:report]=remove_timestamp_set_date_and_time(params[:report])
     @report.update_attributes(params[:report])
     flash[:notice] = "Updated report '"+@report.summary+"'"
     
     respond_to do | format |  
       format.js {
         render(:ajaxupdate, :locals=>{:report=>@report}) 
       }  
     end

   end
  
  def remove_timestamp_set_date_and_time(hash)
    newhash=hash
    newhash.delete(:timestamp)
    logger.debug(hash)
    newhash
  end
  
end