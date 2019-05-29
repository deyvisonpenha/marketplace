class UserController < ApplicationController
    
    def new
    end

    def create
        @respost = helpers.newUser(params[:email],params[:password],params[:password_confirmation])
        if @respost != nil
            redirect_to root_url, alert: "criado com sucesso"
        else
            flash.now[:alert] = "Email or password is invalid"
        end
    end
end