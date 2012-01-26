# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class VideosController < ApplicationController
  respond_to :js
  
   def new
     @person = Person.find(params[:person_id])

     logger.info("ajax-add a new video for given person...")
     @video = Video.new
     @person.videos.push(@video)

     

     respond_to do | format |  
       format.js {
         render( 'new', :locals=>{:video=>@video}) 
       }  
     end
   end
  
  def update
    @video = Video.find(params[:id])

    logger.debug("Ajax-save current video #{@video.summary }")
    if params[:remotipart_submitted] # got attachment ?
      logger.debug("Auto-saved to filesystem at public/system/attachments...")
      logger.debug("updated with remotipart: params = '#{params[:video][:attachment].original_filename}'")
      # replace URL-unfriendly characters in the filename
      params[:video][:attachment].original_filename.gsub!( /\?/, '_')
    end

    @video.update_attributes(params[:video])
    flash[:notice] = "Updated video '"+@video.summary+"'"

    respond_to do | format |  
      format.js {
        render( "update", 
                :locals=>{:n => "video", :o=> @video}
                ) 
      }  
    end
  end
  
  def destroy
     @video = Video.find(params[:id])

     puts("LOG: ajax-remove current video #{@video.summary }")
     @video.delete
     respond_to do | format |  
       format.js {
         render(:destroy, :locals=>{:n=>'video', :o=>@video}) 
       }  
     end

   end
  
  
end