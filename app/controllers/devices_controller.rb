# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class DevicesController < ApplicationController

  # handle the AJAX-calls
  
  def new
    @report = Report.find(params[:report_id])
    
    logger.info("ajax-add a new device for given report...")
    @device = Device.new
    @report.devices.push(@device)
    
    respond_to do | format |  
      format.js {
        render(:new, :locals=>{:device=>@device}) 
      }  
    end
  end
  
  
  def destroy
    @device = Device.find(params[:id])
    
    puts("LOG: ajax-remove current device #{@device.summary }")
    @device.delete
    respond_to do | format |  
      format.js {
        render(:destroy, :locals=>{:device=>@device}) 
      }  
    end
    
  end

  def update
    @device = Device.find(params[:id])

    logger.debug("ajax-update current device #{@device.summary }")
    @device.update_attributes(params[:device])
    
    render(:locals=>{:device=>@device}) 
  end


end