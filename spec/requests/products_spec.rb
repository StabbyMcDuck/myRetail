require 'rails_helper'

RSpec.describe "Products", type: :request do
  context "with id" do
    context "with price" do
      let(:id) {
        13860428
      }

      let(:currency_code) {
        'USD'
      }

      let(:value) {
        BigDecimal("13.49")
      }

      before(:each) do
        ProductPrice.create(product_id: id, value: value, currency_code: currency_code)
      end

      it "shows a product" do
        get "/products/#{id}"

        expect(response.body).to eq({id: id, name: 'The Big Lebowski (Blu-ray)', current_price: {value: value, currency_code: currency_code}}.to_json)
      end

      it "can update the price" do
        get "/products/#{id}"

        before_update = JSON.parse(response.body)

        new_value = BigDecimal("19.99")
        new_currency_code = 'USD'

        put "/products/#{id}", params: {current_price: {value: new_value, currency_code: new_currency_code}}

        after_update = JSON.parse(response.body)

        expect(before_update["current_price"]["value"]).not_to eq(after_update["current_price"]["value"])
        expect(after_update["current_price"]["value"]).to eq(new_value.as_json)
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
