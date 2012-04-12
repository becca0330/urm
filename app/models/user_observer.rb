class UserObserver < ActiveRecord::Observer
  observe :user

  def after_create(user)
    puts("we send the confirmation code to user #{user.email} (pending=#{user.pending?})")
    UserMailer.confirmation_code(user).deliver if user.pending?
  end
end