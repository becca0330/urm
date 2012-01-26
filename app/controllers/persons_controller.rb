# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class PersonsController < ApplicationController

  # handle the AJAX-calls

   def new
     @report = Report.find(params[:report_id])

     logger.info("ajax-add a new person for given report...")
     @person = Person.new
     @report.persons.push(@person)

     # create all available custom attributes by default
     CustomAttribute.all.each { |ca|
       @person.custom_attributes.push(ca)
     }

     respond_to do | format |  
       format.js {
         render(:new, :locals=>{:person=>@person}) 
       }  
     end
   end


   def destroy
     @person = Person.find(params[:id])

     puts("LOG: ajax-remove current person #{@person.name }")
     @person.delete
     respond_to do | format |  
       format.js {
         render(:destroy, :locals=>{:person=>@person}) 
       }  
     end

   end

   def update
     @person = Person.find(params[:id])

     logger.debug("ajax-update current person #{@person.name }")

     #params[:person]=remove_timestamp_set_date_and_time(params[:person])
     @person.update_attributes(params[:person])

     render(:locals=>{:person=>@person}) 
   end
  
end
