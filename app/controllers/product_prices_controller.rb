class ProductPricesController < ApplicationController
  before_action :set_product_price, only: [:show, :update, :destroy]

  # GET /product_prices
  def index
    @product_prices = ProductPrice.all

    render json: @product_prices
  end

  # GET /product_prices/1
  def show
    render json: @product_price
  end

  # POST /product_prices
  def create
    @product_price = ProductPrice.new(product_price_params)

    if @product_price.save
      render json: @product_price, status: :created, location: @product_price
    else
      render json: @product_price.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_prices/1
  def update
    if @product_price.update(product_price_params)
      render json: @product_price
    else
      render json: @product_price.errors, status: :unprocessable_entity
    end
  end

  # DELETE /product_prices/1
  def destroy
    @product_price.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_price
      @product_price = ProductPrice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_price_params
      params.require(:product_price).permit(:value, :currency_code)
    end
end
