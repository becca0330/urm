# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class TodosController < ApplicationController

  # GET /todos
	   # (to manage TODOs)
	   def index
       params[:sort] || params[:sort] = "updated_at"
       
       if session["sortimg_#{params[:sort]}"] == "sort_descending.png";
           logger.info("sort todos ascending by #{params[:sort]}")
            @todos = Todo.find(:all, :order => params[:sort])
            session["sortimg_#{params[:sort]}"]="sort_ascending.png";
       else
            @todos = Todo.find(:all, :order => "#{params[:sort]} DESC")
            logger.info("sort todos descending by #{params[:sort]}")
            session["sortimg_#{params[:sort]}"]="sort_descending.png";
       end if
       logger.info("todos: #{@todos}")

       
	     respond_to do |format|
	       format.html # index.html.erb
	     end
	   end


     def update
        @todo = Todo.find(params[:id])

        res=@todo.update_attributes(params[:todo]) 
        
        flash[:notice] = "Updated todo '"+@todo.summary.to_s+"'"
        respond_to do |format|
          format.js { render( 
                        "update",
                        :locals => {:todo => @todo}
                        )}
        end
    end
         
     def create
       @todo = Todo.create!(params[:todo])
       flash[:notice] = "Added new todo  '"+@todo.summary.to_s+"'"
       respond_to do |format|
          format.js # (async) return create.js.erb, which holds some javascript
      end
     end

     def destroy
       @todo = Todo.find(params[:id])
       logger.info("INFO: removing '#{@todo}'...")
       @todo.destroy
       respond_to do |format|
         format.js
       end
     end

end
