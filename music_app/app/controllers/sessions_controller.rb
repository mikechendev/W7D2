class SessionsController < ApplicationController

    before_action :require_logged_out, only: [:new, :create]
    before_action :require_logged_in, only: [:destroy]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            session[:session_token] = @user.reset_session_token!
            redirect_to user_url(@user)
        else
            #flash[:errors] = @user.errors.full_messages
            redirect_to new_session_url
        end
    end

    def destroy
        log_out_user
        redirect_to new_session_url
    end
end
