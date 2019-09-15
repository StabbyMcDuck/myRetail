require "rails_helper"

RSpec.describe ProductPricesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/product_prices").to route_to("product_prices#index")
    end

    it "routes to #show" do
      expect(:get => "/product_prices/1").to route_to("product_prices#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/product_prices").to route_to("product_prices#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/product_prices/1").to route_to("product_prices#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/product_prices/1").to route_to("product_prices#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/product_prices/1").to route_to("product_prices#destroy", :id => "1")
    end
  end
end
