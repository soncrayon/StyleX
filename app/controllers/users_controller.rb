class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :logged_in?, only: :new
    def show
    end
    
    def new
        @user = User.new 
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        flash[:notice] = "Welcome #{@user.first_name}! Your account was created successfully!"
        redirect_to user_path(@user)
    end

    def edit
        
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        # byebug
        session.delete(:user_id)
        @user.destroy
        redirect_to welcome_path 
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :bio, :age, :username, :password)
    end

    def set_user
        @user = User.find(session[:user_id])
    end
end
