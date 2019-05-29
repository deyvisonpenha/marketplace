module HomeHelper

    #conn = Faraday.new(:url => 'http://localhost:3000/api/v1/') 

    def get(obj)
        conn = Faraday.new(:url => 'http://localhost:3000/api/v1/') 
        @response = conn.get obj
        JSON.parse @response.body
    end

end
