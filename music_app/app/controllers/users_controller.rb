class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_url(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_url
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :session_token)
    end
end
