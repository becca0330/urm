class UserObserver < ActiveRecord::Observer
  observe :user

  def after_create(user)
    UserMailer.deliver_confirmation_code(user) if user.pending?
  end
end