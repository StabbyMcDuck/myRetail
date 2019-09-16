class LandingController < ApplicationController
  def index
    render json: [{url: "/products/:id", description: "get product name and current price", method: "GET"},
                  {url: "/products/:id", description: "update product current price", method: "PUT"}]
  end
end