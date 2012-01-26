# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class EventcodesController < ApplicationController
  respond_to :js


  # GET /eventcodes
   # (to manage available attributes)
   def index
     @eventcodes = Eventcode.all

     respond_to do |format|
       format.html # index.html.erb
     end
   end


  # GET /eventcodes/1/edit
  def edit
    @eventcode = Eventcode.find(params[:id])
  end


  # PUT /eventcodes/1
  # PUT /eventcodes/1.xml
  def update
      @eventcode = Eventcode.find(params[:id])
      @eventcode.update_attributes(params[:eventcode]) # update all eventcode attributes
      flash[:notice] = "Updated code '"+@eventcode.code.to_s+"'"
      puts( "Updated code: "+@eventcode.code+"("+@eventcode.description+")" )
      respond_to do |format|
        format.js { render( 
                      "update",
                      :locals => {:eventcode => @eventcode}
                      )}
      end
  end

  # POST /eventcodes
  # POST /eventcodes.xml
  def create
   @eventcode = Eventcode.create!(params[:eventcode])
   flash[:notice] = "Added new code  '"+@eventcode.code.to_s+"'"
   
   #render :json => @eventcode
   respond_to do |format|
         format.js # (async) return create.js.erb, which holds some javascript
   end
  end

  # DELETE /eventcodes/1
  # DELETE /eventcodes/1.xml
  def destroy
    @eventcode = Eventcode.find(params[:id])
    flash[:notice] = "Removed code  '"+@eventcode.code.to_s+"' '"+@eventcode.description.to_s+"'"
    @eventcode.destroy
    respond_to do |format|
      format.html { redirect_to eventcode_path }
      format.js
    end
  end


  # GET /eventcodes/new
  # GET /eventcodes/new.xml
  def new
     flash[:notice] = "Prepare an new empty code."
    @eventcode = Eventcode.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @eventcode }
      format.js   { render :json => @eventcode }
    end
  end

end