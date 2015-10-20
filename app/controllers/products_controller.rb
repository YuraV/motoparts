class ProductsController < ApplicationController
  respond_to :html, :json
  helper_method :folder, :product, :category

  def index

  end

  def new
    @product = folder.products.build
    respond_with(@product)
  end

  def edit
    respond_with(product)
  end

  def create
    @product = folder.products.build(params[:product])
    @product.save ? respond_with(@product, location: category_folders_path) : flash.now[:error]
  end

  def update
    ProductUpdaterService.update(product: product, params: params)
    respond_with([category, folder, product])
  end

  def mercury_update
    product.update_attribute(:description, params[:content][:description][:value])
    render json: { url: "#{category_folder_product_path(category, folder, product)}" }
  end

  private
  def folder
    @folder ||= Folder.find(params[:folder_id])
  end

  def product
    @product ||= Product.find(params[:id])
  end

  def category
    @category ||= Category.find(params[:category_id])
  end
end