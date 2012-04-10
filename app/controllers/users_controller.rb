class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    
    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if @user.save
      # 2012-03-22 change this for sending mail confimation:
      # flash[:notice] = "Your account has been created."
      # redirect_to signup_url
      flash[:notice] = "Thanks for signing up. We just send you a confimation email"
      redirect_back_or_default root_url
      
    else
      flash[:notice] = "There was a problem creating you."
      render :action => :new
    end
    
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  
  
  def confirm
    @user = User.pending.find_using_perishable_token(params[:confirmation_code])
    
    unless @user
        flash[:error] = "Sorry, your activation code is invalid!"
    else
      @user.confirm!
      @user.reset_perishable_token!
      flash[:notice] = "Your registration as been confirmed successfully!"
    end
    redirect_back_or_default root_url
  end
  
end