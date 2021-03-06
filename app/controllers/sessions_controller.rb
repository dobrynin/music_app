class SessionsController < ApplicationController
  before_action :check_login, :new

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login_user!(@user)
      redirect_to user_url
    else
      flash[:errors] = user.errors.full_messages
      render :new
    end
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end

  def check_login
    redirect_to user_url(current_user) if logged_in?
  end


end
