class ProductsController < ApplicationController
  respond_to :json, :html

  def index
    @products = Product.all.limit(20)
    respond_with @products
  end

  def show
    @product = Product.find(params[:id])
    respond_with @product
  end
end
