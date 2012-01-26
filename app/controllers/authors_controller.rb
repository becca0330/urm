# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class AuthorsController < ApplicationController

  # handle the AJAX-calls
  
  def new
    @report = Report.find(params[:report_id])
    
    logger.info("ajax-add a new author for given report...")
    @author = Author.new
    @report.authors.push(@author)
    
    respond_to do | format |  
      format.js {
        render(:new, :locals=>{:author=>@author}) 
      }  
    end
  end
  
  
  def destroy
    @author = Author.find(params[:id])
    
    puts("LOG: ajax-remove current author #{@author.name }")
    @author.delete
    respond_to do | format |  
      format.js {
        render(:destroy, :locals=>{:author=>@author}) 
      }  
    end
    
  end

  def update
    @author = Author.find(params[:id])

    logger.debug("ajax-update current author #{@author.name }")
    
    #params[:report]=remove_timestamp_set_date_and_time(params[:report])
    @author.update_attributes(params[:author])
    
    render(:locals=>{:author=>@author}) 
  end


end