class ShipmentsController < ApplicationController
  before_filter :authenticate_user!, except: :show
  respond_to :html, :json
  helper_method :shipment

  def show
    respond_with shipment
  end

  def edit
    respond_with shipment
  end

  def update
    shipment.update_attribute(:description, params[:content][:description][:value])
    respond_with shipment
  end


  def mercury_update
    binding.pry
    product.update_attribute(:description, params[:content][:description][:value])
    render json: { url: "#{category_folder_product_path(category, folder, product)}" }
  end

  private
  def shipment
    @shipment = Shipment.first_or_create(description: "Description")
  end
end
