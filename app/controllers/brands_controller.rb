class BrandsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def index
    @brands = Brand.all
    respond_with(@brands)
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    @brand.update_attributes(paramsp[:brand])
    respond_with(@brand, location: brands_path)
  end

  def new
    @brand = Brand.new
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    respond_with(@brand, location: brands_path)
  end

  def create
    @brand = Brand.create(params[:brand])
    respond_with(@brand, location: brands_path)
  end
end