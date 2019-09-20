require 'red_sky'

module Product
  def self.find(formatted_id)
    # make sure the id stays formatted as an int rather than a string
    id = formatted_id.to_i

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

  def self.update(params)
    id = params[:id].to_i
    current_price = params[:current_price]
    json = RedSky.product(id)

    # don't create a product if you don't have a redsky response
    if json
      product_price = ProductPrice.create(product_id: id ,value: current_price[:value], currency_code: current_price[:currency_code])

      if product_price.valid?
        json[:current_price] = { value: product_price.value, currency_code: product_price.currency_code }
        json[:code] = 200 # 200 OK

        json
      else
        json = {errors: [], code: 422, id: id} # 422 unprocessabile entity

        product_price.errors.each do |key, value|
          json[:errors] << {pointer: "/current_price/#{key}", message: value }
        end

        json
      end
    else # if redsky doesn't have a product
      {code: 404, id: id} # 404 not found
    end
  end
end