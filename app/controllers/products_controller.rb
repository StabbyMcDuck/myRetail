require 'product'

class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  # GET /product_prices/1
  def show
    if @product
      render json: @product
    else
      render status: 404,
             json: {id: params[:id].to_i}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end
end
