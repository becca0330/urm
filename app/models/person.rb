# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Person < ActiveRecord::Base
  belongs_to :report
  belongs_to :persontype
  
	has_many :attributes_of_persons,  :dependent => :destroy
  has_many :interviews,             :dependent => :destroy  
  has_many :videos,                 :dependent => :destroy  
  has_many :devices,                :dependent => :destroy  
  has_many :task_results,           :dependent => :destroy
  has_many :answers,                :dependent => :destroy
  has_many :transcript_events,      :dependent => :destroy

	has_many :custom_attributes,      :through => :attributes_of_persons
  	
 
  
  validate :init_defaults
    
  def summary
     self.alias.to_s+": "+self.name.to_s[0,15]+"..."
   end  
    
   def <=>(other)
      return 1 if other.nil? || other.name.nil?
      return 0 if self.nil? || self.name.nil?
      self.name <=> other.name # method <=> not defined for nil in ruby 1.8.7
    end  
    
  
    
  # to set "session at" - timestamp for a user:
  
  def date=(val)
    logger.debug("old-timestamp: #{self.timestamp}")
    # date from a string "2012-01-10" starts at midnight
    if (self.timestamp)
      self.timestamp=val.to_time.plus_with_duration(self.timestamp.seconds_since_midnight)
    end
    logger.debug("new-timestamp: #{self.timestamp}")
  end
  def date
    if self.timestamp.nil?
      self.timestamp=Time.new
    end
    self.timestamp.strftime("%Y-%m-%d")
  end  
  def time=(val)
    logger.debug("old-timestamp: #{self.timestamp}")
    # time from string "07:12" 
    if (self.timestamp.nil?)
      self.timestamp = Time.new
    end
    time_in_secs=Time.parse(val).seconds_since_midnight + 60*60 # one hour offset
    # add to original timestamp (from midnight with 'to_date' )
    self.timestamp=self.timestamp.to_date.to_time.plus_with_duration(time_in_secs)
    logger.debug("new-timestamp: #{self.timestamp}")
  end
  def time
    if self.timestamp
      self.timestamp.strftime("%H:%M")
     end
  end  



  private
    def init_defaults
      
      #if new_record?
        self.itexperience_level ||= "beginner"    # beginner, intermediate, developer
        self.hasusabtestexperience ||= "UNKNOWN"  # yes, no, unknown
      #elsif self.itexperience_level.nil?
      #  errors.add(:itexperience_level, "can't be blank on update")
      #elsif self.hasusabtestexperience.nil?
      #  errors.add(:hasusabtestexperience, "can't be blank on update")
      #end
    end
  
    
  def initialize(attributes={})
      # per default the person pcusageinyears is 0
      attr_with_defaults = {
          :itexperience_pcusageinyears => 0,
          :itexperience_webusageperweek => 0
          }.merge(attributes)
      super(attr_with_defaults)
  end


end

