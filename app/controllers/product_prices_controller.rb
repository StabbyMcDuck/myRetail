class ProductPricesController < ApplicationController
  before_action :set_product_price, only: [:show]

  # GET /product_prices/1
  def show
    render json: @product_price
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_price
      @product_price = ProductPrice.find(params[:id])
    end
end
