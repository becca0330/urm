class UserObserver < ActiveRecord::Observer
  observe :user

  def after_create(user)
    puts("we send the confirmation code to user #{user.email} (pending=#{user.pending?})")
    UserMailer.deliver_confirmation_code(user) if user.pending?
  end
end