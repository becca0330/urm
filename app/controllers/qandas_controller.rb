# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class QandasController < ApplicationController

  # handle the AJAX-calls
  
  def new
    @interview = Interview.find(params[:interview_id])
    
    logger.info("ajax-add a new question/answer for given interview...")
    @qanda = Qanda.new
    
    @interview.qandas.push(@qanda)
        
    respond_to do | format |  
      format.js {
        render(:new, :locals=>{:qanda=>@qanda}) 
      }  
    end
  end
  
  
  def destroy
    @qanda = Qanda.find(params[:id])
    
    puts("LOG: ajax-remove current qanda #{@qanda.summary }")
    @qanda.delete
    respond_to do | format |  
      format.js {
        render(:destroy, :locals=>{:qanda=>@qanda}) 
      }  
    end
    
  end

  def update
    @qanda = Qanda.find(params[:id])

    logger.debug("ajax-update current qanda #{@qanda.summary }")

    @qanda.update_attributes(params[:qanda])
    
    render(:locals=>{:qanda=>@qanda}) 
  end


end