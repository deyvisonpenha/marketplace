require 'faraday'
require 'json'


   #conn = Faraday.new(:url => 'http://localhost:3000/api/v1/')
    url = ENV["URL_API"]
    # conn = Faraday.new(:url => ) 

    #   @products = conn.get 'products'
p url
#p JSON.parse @products.body