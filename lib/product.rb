require 'red_sky'

module Product
  def self.find(id)
    json = RedSky.product(id)

    if json
      product_price = ProductPrice.find_by_product_id(id)

      if product_price
        json[:current_price] = { value: product_price.value, currency_code: product_price.currency_code }

        # if product price is listed then return the json obj - else don't return anything
        json
      end
    end


  end
end