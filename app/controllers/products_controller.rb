require 'product'

class ProductsController < ApplicationController
  # GET /product/1
  def show
    product = Product.find(params[:id])

    if product
      render json: product
    else
      render json: {code: 404, id: params[:id].to_i},
             status: :not_found
    end
  end

  # PATCH/PUT /product_prices/1
  def update
    json = Product.update(product_params)
    code = json[:code]

    case code
    when 200
      render json: json.except(:code)
    when 404
      render json: json,
             status: :not_found
    when 422
      render json: json,
             status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def product_params
    id_param, current_price_param = params.require([:id, :current_price])
    current_price_params = current_price_param.permit(:value, :currency_code)

    {id: id_param, current_price: current_price_params}
  end


end
