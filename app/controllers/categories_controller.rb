class CategoriesController < ApplicationController
  respond_to :html, :json
  helper_method :category

  def index
    respond_with(categories, layout: !request.xhr? )
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

    respond_with(category, layout: !request.xhr? )
  end

  private
  def category
    @category = Category.find(params[:id])
  end
end