require "rails_helper"

RSpec.describe ProductPricesController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(:get => "/product_prices/1").to route_to("product_prices#show", :id => "1")
    end
  end
end
