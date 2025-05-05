class SessionsController < ApplicationController
  def new
    # @user = User.new
  end

  # def create
  #   @user = User.find_by(email: params[:session][:email].downcase)
  #   if @user && @user.authenticate(params[:session][:password])
  #     session[:user_id] = @user.id
  #     flash[:success] = "Welcome back, #{@user.name}!"
  #     redirect_to root_path
  #   else
  #     flash.now[:danger] = "Invalid email or password"
  #     render "new", status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   session[:user_id] = nil
  #   flash[:success] = "Logged out successfully"
  #   redirect_to login_path
  # end
end
