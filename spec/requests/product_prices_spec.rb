require 'rails_helper'

RSpec.describe "ProductPrices", type: :request do
  describe "GET /product_prices" do
    it "works! (now write some real specs)" do
      get product_prices_path
      expect(response).to have_http_status(200)
    end
  end
end
