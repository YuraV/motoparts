class ProductsController < ApplicationController
  helper_method :folder, :product, :category, :product_properties
  respond_to :html, :json
  before_filter :authenticate_user!, except: [:show, :filter]
  add_breadcrumb "MotoParts", :root_path


  def new
    @product = folder.products.build
    respond_with(@product)
  end

  def show
    add_breadcrumb category.name, category_path(category)
    add_breadcrumb folder.name, category_folder_path(category,folder)
    add_breadcrumb product.name, category_folder_product_path(category,folder,product)
    @product_properties = ProductProperty.new
    respond_with(product, layout: !request.xhr? )
  end

  def edit
    respond_with(product)
  end

  def create
    @product = ProductCreatorService.create!(params: params, folder: folder)
    respond_with(@product, location: category_folder_path(category, folder))
  end

  def update
    ProductUpdaterService.update(product: product, params: params)
    respond_with([category, folder, product])
  end

  def mercury_update
    product.update_attribute(:description, params[:content][:description][:value])
    render json: { url: "#{category_folder_product_path(category, folder, product)}" }
  end

  def filter
    @scope = FilterProductsService.apply(folder, params)
    respond_with(@scope) do |format|
      format.html { render @scope if request.xhr? }
    end
  end

  private

  def product_properties
    @product_properties = product.product_properties
  end

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