# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class ProjectsController < ApplicationController
  
  # Note: this is set to "site home" (see routes.rb)
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml #{ render :xml => @projects }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    # TODO caching!!
    @Eventcodes = Eventcode.all
    @persontypes = Persontype.all
    @CustomAttribs = CustomAttribute.all
    
    @project = Project.new
    @project.title="Enter name"
    @project.save
    # should we create default entries with a project?? NO!!
    1.times do
    #  report = @project.reports.build
    #  1.times { report.authors.build }
    #  1.times { report.persons.build } 
    #  1.times { report.interviews.build } 
    #  interview = report.interviews.build
    #  1.times { interview.qandas.build }
    end
    respond_to do |format|
      format.html { render 'edit' }
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    # TODO caching!!
    @Eventcodes = Eventcode.all
    @persontypes = Persontype.all
    @CustomAttribs = CustomAttribute.all
    
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
   
    # TODO caching!!
    @Eventcodes = Eventcode.all
    @persontypes = Persontype.all
    @CustomAttribs = CustomAttribute.all

    @project = Project.new(params[:project])
    respond_to do |format|
      if @project.save
        format.html { render  :action => "edit",
                              :notice => 'Project was successfully created.' }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
       # format.js
      else
        format.html { render  :action => "new", 
                              :notice => 'Fill in all required field before saving the project.' }
        format.xml  { render  :xml => @project.errors, :status => :unprocessable_entity }
       # format.js
      end
    end
  end


  # DELETE /projects/1
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
    end
  end
  
  # todo: check what's that?
  def toggle_div 
     puts("is this code ever envoked??")    
     render(:update) { |page| page.toggle('toggle_div') }
  end


  # GET /projects/1.xml
  def show
    #TODO: cache!
    @Eventcodes = Eventcode.all 
    @project = Project.find(params[:id])

    # optionally we add the stylesheet instruction:
    # http://localhost:3000/projects/1.xml?includestyle=true
    @includestyle=params[:includestyle] || false

    respond_to do |format|
      format.xml  # use the custom show.xml.builder
    end
  end




  # AJAX-call
  def update
      @project = Project.find(params[:id])

      logger.debug("Ajax-save current project #{@project.summary }")
      @project.update_attributes(params[:project])
      flash[:notice] = "Updated project '"+@project.summary+"'"
      respond_to do | format |  
        format.js {
          render(:ajaxupdate, :locals=>{:project=>@project}) 
        }  
      end
  end


end
