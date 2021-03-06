# == Schema Information
#
# Table name: reports
#
#  id                               :integer(4)      not null, primary key
#  project_id                       :integer(4)
#  title                            :string(255)
#  timestamp                        :datetime
#  description                      :text
#  executive_summary                :text
#  created_at                       :datetime
#  updated_at                       :datetime
#  introduction                     :text
#  methodology                      :text
#  training                         :text
#  person_description               :text
#  environment_description          :text
#  task_description                 :text
#  heuristicissues_description      :text
#  questionnaire_description        :text
#  questionnaireresults_description :text
#  interviews_description           :text
#  transcripts_description          :text
#  analysis_description             :text
#  appendix_description             :text
#  order                            :integer(4)
#  testtype                         :string(255)
#  questionnaireresults_summary     :text
#

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
	has_many    :heuristics,        :dependent => :destroy
	
  
  # m:n 
  has_many :document_of_reports
	has_many :documents, :through => :document_of_reports
  
		
 
  after_initialize  :init
  validate :init_defaults

   def init
      self.timestamp ||= Time.new
   end

   	def summary
        title=self.title ? self.title.truncate(31) : ""
        self.description.blank? ? title : title+": "+self.description.truncate(15)
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
    
    # testusers (=person with persontype_id ==1 .name="user") 
    def testusers
      self.persons.where("persontype_id=?",1)
    end
    # staff (=person with persontype_id ==2 .name="staff") 
    def staff
      self.persons.where("persontype_id=?",2)
    end
    
    # reviewers (= heexperts =person with persontype_id ==3 .name="heexpert") 
    def reviewers
      self.persons.where("persontype_id=?",3)
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

