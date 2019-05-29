class SessionController < ApplicationController

    def new
    end

    def create
        @respost = helpers.sign_in(params[:email],params[:password])
        if @respost != nil
            redirect_to root_url, @respost
        else
            flash.now[:alert] = "Email or password is invalid"
        end
    end

    def destroy 
    end
end