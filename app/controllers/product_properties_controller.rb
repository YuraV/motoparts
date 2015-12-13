class ProductPropertiesController < ApplicationController

  respond_to :html, :json

  helper_method :product, :product_property
  def new
    @product_properties = ProductProperty.new
  end

  def create
    @product_property = ProductProperty.create(params[:product_property])
    respond_with @product_property do |format|
      if request.xhr?
        format.html { render partial: 'products/properties_table', product: product }
      else
        format.html { redirect_to category_folder_product_path(product.category, product.folder, product) }
      end
    end
  end

  def destroy
    pp = product_property
    pp.destroy
    respond_with pp, location: category_folder_product_path(pp.product.category, pp.product.folder, pp.product)
  end

  private
  def product_property
    @product_property ||= ProductProperty.find(params[:id])
  end

    def product
    @product ||= product_property.product
  end
end