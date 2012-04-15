# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class HeuristicsController < ApplicationController
  
  # handle the AJAX-calls

  def new
    @report = Report.find(params[:report_id])
  
    logger.info("ajax-add a new heuristic for given report...")
    @heuristic = Heuristic.new
    @report.heuristics.push(@heuristic)
  
    respond_to do | format |  
      format.js {
        render(:new, :locals=>{:heuristic=>@heuristic}) 
      }  
    end
  end


  def destroy
    @heuristic = Heuristic.find(params[:id])
  
    puts("LOG: ajax-remove current heuristic #{@heuristic.title }")
    @heuristic.delete
    respond_to do | format |  
      format.js {
        render(:destroy, :locals=>{:heuristic=>@heuristic}) 
      }  
    end
  
  end

  def update
    @heuristic = Heuristic.find(params[:id])

    logger.debug("ajax-update current heuristic #{@heuristic.title }")
  
    @heuristic.update_attributes(params[:heuristic])
  
    render(:locals=>{:heuristic=>@heuristic}) 
  end

end