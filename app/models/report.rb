# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Report < ActiveRecord::Base
  belongs_to  :project
  has_many    :persons,           :dependent => :destroy  
  has_many    :interviews,        :dependent => :destroy  
  has_many    :documents,         :dependent => :destroy  
  has_many    :authors,           :dependent => :destroy
  has_many    :tasks,             :dependent => :destroy
  has_many    :task_results,      :dependent => :destroy
  has_many    :devices
  has_many    :questions,         :dependent => :destroy
  has_many    :answers,           :dependent => :destroy
	has_many    :transcript_events, :dependent => :destroy
	has_many    :findings,          :dependent => :destroy
	
	
  
  # m:n 
  has_many :document_of_reports
	has_many :documents, :through => :document_of_reports
  
		
 
  after_initialize  :init
  validate :init_defaults

   def init
      self.timestamp ||= Time.new
   end

   	def summary
        self.title.to_s[0,15]+": "+self.description.to_s[0,35]+"..."
    end

    def date=(val)
      logger.debug("old-timestamp: #{self.timestamp}")
      if (self.timestamp)
        # date from a string "2012-01-10" starts at midnight
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
      if (self.timestamp.nil?)
        self.timestamp = Time.new
      end
      # time from string "07:12" 
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
    
    def answers_sorted
      self.answers.nil? ? nil : self.answers.sort
    end
    def questions_sorted
      self.questions ?  self.questions.sort : nil
    end
    def answers_sorted_by_questionid
      self.answers ? self.answers.order(:'question_id') : nil
    end 
    
    def positive_findings 
      self.findings.where("findingtype=?", 'positive')
    end
    def negative_findings # =recommendations
      self.findings.where("findingtype=?", 'recommendation')
    end
    
   private
     def init_defaults
       if new_record?
         self.timestamp ||= Time.new
       elsif self.timestamp.nil?
         errors.add(:timestamp, "can't be blank on update")
       end
     end


      
end
