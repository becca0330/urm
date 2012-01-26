# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class AttributesOfPeopleController < ApplicationController

  # handle the AJAX-calls
    
       def new
         @person = Person.find(params[:person_id])
    
         logger.info("ajax-add a new attribute to the person...")
         #@attributes_of_person = AttributesOfPerson.new
         #@person.attributes_of_persons.push(@attributes_of_person)
    
         # TODO
         # find out which attributes are not assigned and 
         # fill in some dropdown for those attributes
         #CustomAttribute.all.each { |ca|
         #   ...
         #}
         ca=CustomAttribute.first
         
         @person.custom_attributes.push(ca)
         @attributes_of_person = @person.attributes_of_persons.where(:custom_attribute_id=>ca.id)
         respond_to do | format |  
           format.js {
             render(:new, :locals=>{
               :attributes_of_person  => @attributes_of_person,
               :person                => @person}) 
           }  
         end
       end
    
    
      def destroy
         @attribute_of_people = AttributesOfPerson.find(params[:id])
         ca= (@attribute_of_people.custom_attribute) ?
              @attribute_of_people.custom_attribute.title 
              : @attribute_of_people.id
         logger.debug("LOG: ajax-remove custom attribute '#{ca}' of given person.")
         @attribute_of_people.delete
         respond_to do | format |  
           format.js {
             render(:destroy, :locals=>{
                :attribute_of_people=>@attribute_of_people,
                :person => @attribute_of_people.person
                }) 
           }  
         end
    
       end
  
       def update
         @attribute_of_people = AttributesOfPerson.find(params[:id])
    
         ca= (@attribute_of_people.custom_attribute) ?
               @attribute_of_people.custom_attribute.title 
               : @attribute_of_people.id
         logger.debug("ajax-update '#{ca}' of given person")
    
         #params[:person]=remove_timestamp_set_date_and_time(params[:person])
         @attribute_of_people.update_attributes(params[:attribute_of_people])
    
         render(:locals=>{:attribute_of_people=>@attribute_of_people,
                          :person => @attribute_of_people.person}) 
       end
      
end
