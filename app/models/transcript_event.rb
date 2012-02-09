# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class TranscriptEvent < ActiveRecord::Base

  	belongs_to :report
		belongs_to :person
		belongs_to :eventcode
		belongs_to :finding
	
	
	 # sort by person and timestamp
   def <=>(other)
     return 1 if other.nil? || other.person.nil?
     return 0 if  self.nil? ||  self.person.nil?
      self.person.name <=> other.person.name
   end
		
	def summary
	  msg  = self.person ? self.person.name+": " : ""
	  #msg += self.timestamp # TODO add the time of the timestamp!
	  if self.timestamp
	    msg +=  self.timestamp.strftime("%H:%M ")
	  end
    msg += self.eventcode ? "("+self.eventcode.code+") " : ""
    msg+self.event.to_s+"..."
  end
  
  
  # to set "event" (of transcript) timestamp for a user:
  
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
    if (val.nil? || val=="")
      self.timestamp=nil;
    else
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

  end
  def time
    if self.timestamp
      self.timestamp.strftime("%H:%M")
     end
  end
  
  
end
