class PropertiesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  helper_method :property, :new_property_unit, :new_unit

  def index
    @properties = Property.all

    respond_with(@properties)
  end

  def new
    @property = Property.new
  end

  def edit
    property
  end

  def update
    property.update_attributes(params[:property])
  end

  def create
    @property = Property.create(params[:property])
  end

  def show

  end

  def units_from_property
    respond_with(property.units)
  end

  private

  def property
    @property ||= Property.find(params[:id])
  end

  def new_unit
    @unit ||= Unit.new
  end

  def new_property_unit
    @property_unit ||= property.property_units.build
  end
end