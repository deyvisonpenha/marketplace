module HomeHelper
    
    def get(obj) 
        conn = conection
        @response = conn.get obj
        JSON.parse @response.body
    end

    def newUser(email,password,password_confirmation)
        conn = conection
        @response = conn.post 'users', { email: email, password: password , password_confirmation: password_confirmation}
        if @response.status == 200
            JSON.parse @response.body
        else
            @response = nil
        end
    end

    def sign_in(email,password)
        conn = conection
        @response = conn.post 'sessions', { email: email, password: password }
        if @response.reason_phrase != "Unauthorized"
            current_user(JSON.parse @response.body)
        else
            @response = nil
        end
    end

    def logout	
        conn = conection
        conn.delete do |req|
            req.url '/tasks'
            req.headers['X-User-Email'] = cookies[:email]
            req.headers['X-User-Email'] = cookies[:token]
        end
        cookies.delete :email
        cookies.delete :token
        cookies.delete :name
        cookies.delete :status
        # cookies[:email]   = @request["user"]["email"]
        #     cookies[:name]   = @request["user"]["name"]
        #     cookies[:token] = @request["user"]["authentication_token"]
        #     cookies[:status] = "Logado"

    end

    private

    def conection
        conn = Faraday.new(:url => 'http://localhost:3000/api/v1/')
    end

end
