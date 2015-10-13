class CategoriesController < ApplicationController
  respond_to :html, :json

  helper_method :categories, :category

  def index
    respond_with(categories)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def create
    @category = Category.new(params[:category])
    @category.save ? respond_with(@category, location: categories_path) : flash.now[:error]
  end

  def show

    respond_with(category)
  end

  private
  def categories
    @categories = Category.scoped
  end

  def category
    @category = Category.find(params[:id])
  end
end