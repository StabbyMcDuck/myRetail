require 'rails_helper'

RSpec.describe ProductPrice do
  context :create do
    context 'with valid attributes' do
      it 'can be created' do
        product_price = ProductPrice.create(product_id: 1, value: 13.49, currency_code: "USD")

        expect(product_price).to be_persisted
      end
    end

    context 'without valid attributes' do
      it 'cannot be created without product_id' do
        expect {
          ProductPrice.create(value: 13.49, currency_code: "USD")
        }.to raise_error(Cequel::Record::MissingKeyError)
      end

      it 'cannot be created without value' do
        product_price = ProductPrice.create(product_id: 1, currency_code: "USD")

        expect(product_price).to_not be_persisted
      end

      it 'cannot be created without currency_code' do
        product_price = ProductPrice.create(product_id: 1, value: 13.49)

        expect(product_price).to_not be_persisted
      end
    end
  end
end