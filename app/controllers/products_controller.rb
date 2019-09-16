require 'product'

class ProductsController < ApplicationController
  # GET /product/1
  def show
    product = Product.find(params[:id])

    if product
      render json: product
    else
      render status: 404,
             json: {id: params[:id].to_i}
    end
  end

  # PATCH/PUT /product_prices/1
  def update
    product = Product.update(product_params)

    if product.key?(:errors)
      render json: product, status: :unprocessable_entity
    else
      render json: product
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
