module HomeHelper

    #conn = Faraday.new(:url => 'http://localhost:3000/api/v1/') 

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
            JSON.parse @response.body
        else
            @response = nil
        end
    end

    def conection
        Faraday.new(:url => 'http://localhost:3000/api/v1/')
    end

end
