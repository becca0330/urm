ActionMailer::Base.delivery_method = :smtp # be sure to choose SMTP delivery
ActionMailer::Base.smtp_settings={
  :address              => "mail.gmx.net",
  :port                 => 587,
  :domail               => "gmx.net",
  :user_name            => "internettechnik@gmx.at",
  :password             => "pwd",
  :enable_starttls_auto => true
}