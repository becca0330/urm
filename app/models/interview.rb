# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Interview < ActiveRecord::Base
  belongs_to :report
  belongs_to :person
  
  has_many :qandas, :dependent => :destroy  
  

  # sort interviews by person-name
   def <=>(other)
      return  1 unless other.person
      return -1 unless  self.person
      return  1 unless other.person.name # with ruby 1.8.x we have no:  nil.<=>
      return -1 unless  self.person.name
      self.person.name <=> other.person.name
   end

  def summary
      # show also the person (-name)
     p= (self.person) ? " "+ I18n.t(:'persons.person.with')+" "+ self.person.name.to_s : ""
     p.to_s.truncate(15)
  end
  
end

