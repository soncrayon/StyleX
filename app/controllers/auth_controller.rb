class AuthController < ApplicationController
  before_action :logged_in?, only: :new 
  
  def new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          # cookies[user_id]
          session[:user_id] = @user.id
          redirect_to home_path
        else
          flash[:notice] = "Incorrect username or password."
          render :new
        end
    end

    def destroy
        session.delete(:user_id)
        flash[:notice] = "You are logged out."
        redirect_to welcome_path
    end
end
