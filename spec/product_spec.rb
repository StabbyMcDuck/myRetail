require 'rails_helper'
require 'product'

RSpec.describe Product do
  context 'with id' do
    context 'with price' do
      it 'returns a combined name and price for a product id' do
        id = 13860428
        value = BigDecimal::new("13.49")
        currency_code = 'USD'

        ProductPrice.create(product_id: id, value: value, currency_code: currency_code)

        expect(Product.find(id)).to eq({id: id, name: 'The Big Lebowski (Blu-ray)', current_price: {value: value, currency_code: currency_code}})
      end
    end

    context 'without price' do
      it 'returns nil if there is no price' do
        id = 54136584

        expect(Product.find(id)).to eq(nil)
      end
    end
  end

  context 'without an id' do
    it 'does not return a name for a product id' do
      expect(Product.find(15117729)).to eq(nil)
      expect(Product.find(16483589)).to eq(nil)
    end
  end
end