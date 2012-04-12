class UserMailer < ActionMailer::Base
  default :from => "john@feiner.at"
  
  include ActionController::UrlWriter
  
  def confirmation_code(user)
      @user = user
      mail( :to       => user.email ,
            :bcc      => ["john@feiner.at"],
            :subject  => "URM: Please confirm your registration")
  end
  
end
