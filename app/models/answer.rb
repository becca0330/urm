# == Schema Information
#
# Table name: answers
#
#  id          :integer(4)      not null, primary key
#  report_id   :integer(4)
#  question_id :integer(4)
#  person_id   :integer(4)
#  value       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


class Answer < ActiveRecord::Base
  	belongs_to :report
		belongs_to :person
		belongs_to :question


    # sort answers by name and then by question
    # TODO: check if too many sql-requests ? (performance??)
    def <=>(other)
        return 1 unless other.person
        return -1 unless self.person
        #puts("comparing answer #{self.id} with #{other.id}")
        if self.person.name == other.person.name
          return 1 unless other.question
          return -1 unless self.question
          #puts("comparing answer-questions #{self.question.order} with #{other.question.order}")
          return 1 unless other.question.order
          return -1 unless self.question.order
          self.question.order <=> other.question.order
        else
          #puts("comparing answer-names #{self.person.name} with #{other.person.name}")
          return 1 unless other.person.name
          return -1 unless self.person.name
          self.person.name <=> other.person.name
        end
    end


  	def summary
  	    # TODO: pretty print answer with person and question details
  	     msg=""
  	     if self.person
  	        msg += self.person.name[0,8]
  	     end
  	     msg+= " on "+I18n.t(:'questions.question.question')+" "+
  	            self.question.order.to_s+" '" +
  	            self.question.description.truncate(25) unless self.question.nil?
         msg+": "+self.value.to_s.truncate(10)
    end

    def Answer.allanswers_hash(allanswers)
      # we get all answers sorted by question
      h={}
      # we return a hash with keys = question_ids and values = list of answers for the question 
      allanswers.each do |a|
        h[a.question_id] ? h[a.question_id] << a : h[a.question_id] = [a]
      end
      h
    end
end

