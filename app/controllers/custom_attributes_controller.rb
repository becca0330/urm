# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class CustomAttributesController < ApplicationController
  respond_to :js

  # GET /projects
  # (to manage available attributes)
  def index
    @custom_attributes = CustomAttribute.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end


  # POST /custom_attribute
  # jquery-AJAX call add-new
  def create
   @custom_attribute = CustomAttribute.create!(params[:custom_attribute])
   respond_to do |format|
         format.js # (async) return create.js.erb, which holds some javascript
   end
  end
  
  # DELETE /custom_attribute/1
  # jquery-AJAX call "delete" 
   def destroy
     @custom_attribute = CustomAttribute.find(params[:id])
     # flash[:notice] = "Removed attribute '" +
     #                  @custom_attribute.title.to_s +
     #                  "' (" +
     #                  @custom_attribute.description.to_s +
     #                  ")"
     @custom_attribute.destroy
     respond_to do |format|
       format.js
     end
   end
  
  
   # PUT /custom_attribute/1
   # jquery-AJAX call "update" 
   def update
       @custom_attribute = CustomAttribute.find(params[:id])
       @custom_attribute.update_attributes(params[:custom_attribute]) # update all custom_attribute
       # flash[:notice] = "Updated attribute '"+
       #                  @custom_attribute.title.to_s +
       #                   "' (" +
       #                   @custom_attribute.description.to_s +
       #                   ")"
       respond_to do |format|
         format.js {  render( :partial => "update",
                              :locals=>{:custom_attribute=>@custom_attribute}) 
                }
       end
   end
  
  
end