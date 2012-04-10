# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.

require 'date'
require 'fileutils'

class ReportsController < ApplicationController
  
  # 2011-12-22:
  # AJAX-call
  # get url=/reports/ajax_add => rails-path="ajax_add_reports" 
  def ajax_add
    @project = Project.find(params[:project_id])
    testtype = params[:testtype] || 'ta'
    logger.info("ajax-add a new report for given project...")
    @report = Report.new
    @report.testtype = testtype
    
    # create some default fields/sections to be available 
    # the MUST-HAVE sections: at least one author and at least one....
    @report.authors.build
    
    @project.reports.push(@report)
    
    respond_to do | format |  
      format.js {
        render(:ajaxaddnew, :locals=>{:report=>@report}) 
      }  
    end
    
  end
  
  # AJAX-call
  def ajax_remove
    @report = Report.find(params[:id])
    
    puts("LOG: ajax-remove current report #{@report.summary }")
    @report.delete
    respond_to do | format |  
      format.js {
        render(:ajaxremove, :locals=>{:report=>@report}) 
      }  
    end
    
  end
  
  # AJAX-call
   def update
     @report = Report.find(params[:id])

     logger.debug("ajax-save current report #{@report.summary }")
     
     params[:report]=remove_timestamp_set_date_and_time(params[:report])
     @report.update_attributes(params[:report])
     flash[:notice] = "Updated report '"+@report.summary+"'"
     
     respond_to do | format |  
       format.js {
         render(:ajaxupdate, :locals=>{:report=>@report}) 
       }  
     end

   end
  
  def remove_timestamp_set_date_and_time(hash)
    newhash=hash
    newhash.delete(:timestamp)
    logger.debug(hash)
    newhash
  end
  
  
  # GET /reports/1/edit
  def edit
    # TODO caching!!
    @Eventcodes = Eventcode.all
    @persontypes = Persontype.all
    @CustomAttribs = CustomAttribute.all

    @report=Report.find(params[:id])
    @project = @report.project
    render( :locals => {:report => @report})
  end
  
  # GET /projects/1.xml
  def show
    @Eventcodes = Eventcode.all #TODO: cache!
    @report = Report.find(params[:id])
    @project = @report.project

    # optionally we add the stylesheet instruction:
    # http://localhost:3000/reports/1.xml?includestyle=true
    @includestyle=params[:includestyle] || false
    
    puts "DEBUG: zip? '#{params[:zip]}'"

    respond_to do |format|
      if ! params[:zip]
        format.xml  # use the custom show.xml.builder
      else
      # TODO: allow sending zipped content:
        format.xml {send_as_zip(@report)}
      end
    end
  end
  
  private
  
  def send_as_zip(rep)
    curr_timestamp = Time.new.strftime("%y-%m-%d_%H-%M-%S")
    base_dir="tmp"
  
    zip_name="urm_report_#{curr_timestamp}" 
    # mkdir urm_report_dir in "tmp/"
    dir_name=[base_dir, zip_name].join("/") 
    Dir::mkdir dir_name unless File::exists? dir_name
    
    # copy/create some files in/to tmp/urm_report_12-04-10_16-43-42/ dir:
    create_a_little_info_file(dir_name)
    copy_the_stylesheets(dir_name)
    render_and_save_the_report_xml(dir_name)
    
    # compress directory structure to "urm_report_12-04-10_16-43-42.zip"
    # zip directory and then clean up (remove directory)
    zipcmd="cd #{base_dir}; zip -r #{zip_name}.zip #{zip_name}; rm -rf #{zip_name}"
    puts "executing now '#{zipcmd}'"
    system zipcmd
    # send file to browser and clean up (remove zip file)
    send_file "#{dir_name}.zip"   
    File::delete "#{dir_name}.zip"
  end
  
  def create_a_little_info_file(dir_name)
    # create a small readme info file "readme.html"
    Dir::mkdir dir_name unless File::exists? dir_name
    File.open([dir_name, "readme.html"].join("/"), "w+") do |f|
      the_html_info = render_to_string("zip_info.html.erb", 
                      :locals => {:report => @report})
      f.write  the_html_info 
      f.close
    end
    
  end

  def copy_the_stylesheets(dir_name)
    styles_dir_name=dir_name+"/stylesheets"
    Dir::mkdir styles_dir_name unless File::exists? styles_dir_name
    filestocopy=[ "#{Rails.public_path}/stylesheets/usabml-to-html5.css", 
                  "#{Rails.public_path}/stylesheets/usabml-to-html5.xsl"  ]
    filestocopy.each{|f|
      puts "now we copy #{f}"
      FileUtils.cp(f,styles_dir_name) if File::exists? f
    }
  end
  
  def render_and_save_the_report_xml(dir_name)
    # create the report in subdir report
    report_dir_name=dir_name+"/report"
    Dir::mkdir report_dir_name unless File::exists? report_dir_name
    File.open([report_dir_name, "report.xml"].join("/"), "w+") do |f|
      the_xml =  render("reports/show",:layout   => false)
      f.write  the_xml 
      f.close
    end
  end
  
end