class BrandsController < ApplicationController

  respond_to :html, :json

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.create(params[:brand])
    respond_with(@brand)
  end
end