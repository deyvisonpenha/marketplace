class HomeController < ApplicationController
    def index
       @products = helpers.get("products")
    end
end
