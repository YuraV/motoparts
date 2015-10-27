class ProductsController < ApplicationController
  helper_method :folder, :product, :category
  respond_to :html, :json
  before_filter :authenticate_user!, except: [:show]
  add_breadcrumb "MotoParts", :root_path


  def new
    @product = folder.products.build
    respond_with(@product)
  end

  def show
    add_breadcrumb category.name, category_path(category)
    add_breadcrumb folder.name, category_folder_path(category,folder)
    add_breadcrumb product.name, category_folder_product_path(category,folder,product)
    respond_with(product, layout: !request.xhr? )
  end

  def edit
    respond_with(product)
  end

  def create
    @product = folder.products.build(params[:product])
    @product.save
    @product.galery= Galery.create(name: "#{product.name}_galery")
    respond_with(@product, location: category_folders_path)
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

  def products
    @product ||= folder.products
  end

  def galery
    @galery = product.galery
  end
end