# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class FindingsController < ApplicationController

  # handle the AJAX-calls
  
  def new
    @report = Report.find(params[:report_id])
    findingtype = params[:findingtype] || 'positive' # positive finding or recommendation
    
    logger.info("ajax-add a new finding (type=#{findingtype}) for given report...")
    @finding = Finding.new
    @finding.findingtype=findingtype
    @report.findings.push(@finding)
    
    page = (findingtype=='positive') ? :new : :new_recommendation
    
    respond_to do | format |  
      format.js {
        render(page, :locals=>{:finding=>@finding}) 
      }  
    end
  end
  
  
  def destroy
    @finding = Finding.find(params[:id])
    
    puts("LOG: ajax-remove current finding #{@finding.summary }")
    @finding.delete
    respond_to do | format |  
      format.js {
        render(:destroy, :locals=>{:finding=>@finding}) 
      }  
    end
    
  end

  def update
    @finding = Finding.find(params[:id])

    logger.debug("ajax-update current finding #{@finding.summary }")

    @finding.update_attributes(params[:finding])
    
    render(:locals=>{:finding=>@finding}) 
  end


end