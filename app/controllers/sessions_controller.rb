class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]
  before_action :require_user, only: [:destroy]

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to chatroom_path
    else
      flash.now[:error] = "Invalid username or password"
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    flash[:success] = "Logged out successfully"
    redirect_to login_path
    session[:user_id] = nil
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to chatroom_path
    end
  end
end
