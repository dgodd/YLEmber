class CategoriesController < ApplicationController
  respond_to :json, :html

  def index
    @categories = Category.all.limit(20)
    respond_with @categories
  end

  def show
    @category = Category.find(params[:id])
    respond_with @category
  end
end
