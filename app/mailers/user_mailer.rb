class UserMailer < ActionMailer::Base
  default :from => "urm@feiner.at"
  
  include ActionController::UrlWriter
  
  def confirmation_code(user)
      #from "URM-Admin <urm@feiner.at>"
      #recipients user.email
      #subject 'Please confirm your registration'
      #body :user => user
      #sent_on Time.nowA
      @user=user
      mail( :to       => "johannes.feiner@fh-joanneum.at #{user.email}", 
            :subject  => "Please confirm your registration")
  end
  
end
