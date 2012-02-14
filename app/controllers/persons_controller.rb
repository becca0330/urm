# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class PersonsController < ApplicationController

  # handle the AJAX-calls

   def new
     @report = Report.find(params[:report_id])
     persontype_id = params[:persontype_id] || '1' # persontype_id: 1=user, 2=staff, 3=heexpert
  
     logger.info("ajax-add a new person (persontype_id: #{persontype_id}) for given report...")
     @person = Person.new
     @person.persontype_id = persontype_id
     @report.persons.push(@person)

     page = (persontype_id=='1') ? :new_testuser : :new_staff
     logger.info("so render page #{page}...")
     
     if (persontype_id==1) # for test users:
       # create all available custom attributes by default
       CustomAttribute.all.each { |ca|
         @person.custom_attributes.push(ca)
       }
     end

     respond_to do | format |  
       format.js {
         render(page, :locals=>{:person=>@person}) 
       }  
     end
   end


   def destroy
     @person = Person.find(params[:id])

     puts("LOG: ajax-remove current person (staff or testuser or heexpert or...) #{@person.name }")
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
