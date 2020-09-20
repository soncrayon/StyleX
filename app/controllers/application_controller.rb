class ApplicationController < ActionController::Base
    helper_method :current_user 

    def current_user
        user_id = session[:user_id]
        user_id && User.find(user_id)
    end

    def authorize!
        unless current_user
            flash[:notice] = "You must be logged in to do that."
            redirect_to login_path
        end 
    end

    def logged_in?
        if current_user
            flash[:notice] = "You are already logged in."
            @user = User.find(session[:user_id])
            redirect_to user_path(@user)
        end 
    end

    def welcome
    end

    def new_account
        @user = User.new 
    end

    def create_account
        @user.update(user_params)
    end

    def home
        current_user
    end

    def analytics
    end

    private

    def user_params
        params.require(:user).permit(:name, :age, :bio, :username, :password)
    end
end
