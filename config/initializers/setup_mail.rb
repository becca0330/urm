#ActionMailer::Base.delivery_method = :sendmail 

# NOT:
#ActionMailer::Base.delivery_method = smtp # be sure to choose SMTP delivery
#ActionMailer::Base.smtp_settings={
#  :address              => "mail.gmx.net",
#  :port                 => 587,
#  :domail               => "gmx.net",
#  :user_name            => "myusername@gmx.net",
#  :password             => "mypwd",
#  :enable_starttls_auto => true
#}