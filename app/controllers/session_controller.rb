class SessionController < ApplicationController

    def new
    end

    def create
        @request = helpers.sign_in(params[:email],params[:password])
        if @request.nil?
            redirect_to login_form_path
        else
            cookies[:email]   = @request["user"]["email"]
            cookies[:name]   = @request["user"]["name"]
            cookies[:token] = @request["user"]["authentication_token"]
            cookies[:status] = "Logado"
            redirect_to root_url, status: :accepted
        end
    end

    def destroy 
        helpers.logout
        redirect_to root_url, status: :accepted
    end
end