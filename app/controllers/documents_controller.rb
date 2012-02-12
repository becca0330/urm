# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class DocumentsController < ApplicationController
  respond_to :js
  
   def new
     # is it a document for a finding or for the report??
     # TODO think about: should we create one document for report and assign it to the finding also??
     
     # add document to finding
     if params[:finding_id]
        @finding = Finding.find(params[:finding_id])
        logger.info("ajax-add a new document for given finding...")
        @document = Document.new
        @finding.documents.push(@document)

        respond_to do | format |  
           format.js {
             render( 'new_for_finding', :locals=>{:document=>@document, :finding=>@finding}) 
           }  
        end
     end
     
     # add document to report
     if params[:report_id]
        @report = Report.find(params[:report_id])
        logger.info("ajax-add a new document for given report...")
        @document = Document.new
        @report.documents.push(@document)

        respond_to do | format |  
           format.js {
             render( 'new_for_report', :locals=>{:document=>@document, :report=>@report}) 
           }  
        end
     end
 
   end
  
  # AJAX JavaScript update => update_for_xxx.js.erb
  def update
    @document = Document.find(params[:id])
    r_id=params[:document][:report_id]; params[:document].delete(:report_id)
    f_id=params[:document][:finding_id]; params[:document].delete(:finding_id)
    logger.debug("params[:document] = "+params[:document].to_s)
   
    if params[:remotipart_submitted] # got attachment ?
      logger.debug("Auto-saved to filesystem at public/system/attachments...")
      logger.debug("updated with remotipart: params = '#{params[:document][:attachment].original_filename}'")
      # replace URL-unfriendly characters in the filename
      params[:document][:attachment].original_filename.gsub!( /\?/, '_')
    end
    
     @document.update_attributes(params[:document] )
    
    # update document to report
    if r_id
      logger.debug("params[:report_id] = "+r_id.to_s)
      @report = @document.document_of_reports.first.report
      return render( 'update_for_report', 
                        :locals=>{:n => "document", 
                             :o=> @document,
                             :report => @report
                             }) 
    end
    
    # update document to finding
    if f_id
     logger.debug("params[:finding_id] = "+f_id.to_s)
     @f = Finding.find( f_id )
     return render('update_for_finding', 
                      :locals=>{:n => "document", 
                            :o=> @document,
                            :finding => @f
                    }) 
    end
  end
  
  def destroy
     @document = Document.find(params[:id])
     r_id=params[:report_id] 
     f_id=params[:finding_id]
     
     puts("LOG: ajax-remove current document #{@document.summary }")
     @document.delete
     
     # destroy document to report
     if r_id
       @report = Report.find(r_id)
       return render( 'destroy_for_report', 
                         :locals=>{:n => "document", 
                              :o=> @document,
                              :report => @report
                              }) 
     end

     # destroy document to finding
     if f_id
      @f = Finding.find( f_id )
      logger.debug("Finding_id="+@f.to_s)
      return render('destroy_for_finding', 
                       :locals=>{:n => "document", 
                             :o=> @document,
                             :finding => @f
                     }) 
     end
  
  
   end
  
  
end