# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class TranscriptEventsController < ApplicationController

  # handle the AJAX-calls
  
  def new
    @report = Report.find(params[:report_id])
    
    logger.info("ajax-add a new transcript_event for given report...")
    @transcript_event = TranscriptEvent.new
    @report.transcript_events.push(@transcript_event)
    
    logger.info("pre-fill person '#{session[:last_person_id]}' for transcipt event")
    if session[:last_person_id]
      @transcript_event.person_id = session[:last_person_id]
    end
    logger.info("pre-fill timestamp '#{session[:last_time]}' for transcipt event")
    if session[:last_time]
      @transcript_event.time = session[:last_time].to_s
    end
    
    respond_to do | format |  
      format.js {
        render(:new, :locals=>{:transcript_event=>@transcript_event}) 
      }  
    end
  end
  
  
  def destroy
    @transcript_event = TranscriptEvent.find(params[:id])
    
    puts("LOG: ajax-remove current transcript_event #{@transcript_event.summary }")
    @transcript_event.delete
    respond_to do | format |  
      format.js {
        render(:destroy, :locals=>{:transcript_event=>@transcript_event}) 
      }  
    end
    
  end

  def update
    @transcript_event = TranscriptEvent.find(params[:id])




    logger.debug("ajax-update current transcript_event #{@transcript_event.summary }")
    @transcript_event.update_attributes(params[:transcript_event])

    session[:last_time] = @transcript_event.time
    logger.info("remember time '#{session[:last_time]}' of last modified transcript event (to pre-fill a upcoming new event)")
    session[:last_person_id] = @transcript_event.person_id
    logger.info("remember person '#{session[:last_person_id]}' of last modified transcript event (to pre-fill a upcoming new event)")


    
    render(:locals=>{:transcript_event=>@transcript_event}) 
  end


end