class BrandsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.create(params[:brand])
    respond_with(@brand)
  end
end