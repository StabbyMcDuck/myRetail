require 'rails_helper'

RSpec.describe "Products", type: :request do
  context "with id" do
    context "with price" do
      it "shows a product" do
        id = 13860428
        value = BigDecimal("13.49")
        currency_code = 'USD'

        ProductPrice.create(product_id: id, value: value, currency_code: currency_code)

        get "/products/#{id}"

        expect(response.body).to eq({id: id, name: 'The Big Lebowski (Blu-ray)', current_price: {value: value, currency_code: currency_code}}.to_json)
      end
    end

    context "without a price" do
      it 'returns 404 if there is no price' do
        id = 54136584
        get "/products/#{id}"

        expect(response.status).to eq(404)
        expect(response.body).to eq({id: id}.to_json)
      end
    end
  end

  context "without an id" do
    it 'returns 404' do
      id = 15117729
      get "/products/#{id}"

      expect(response.status).to eq(404)
      expect(response.body).to eq({id: id}.to_json)
    end
  end
end
