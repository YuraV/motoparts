class PropertyUnitsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :property_unit, :property
  respond_to :html, :json

  def new
    @property_unit = property.property_unit.build
  end

  def create
    @property_unit = PropertyUnit.create(params[:property_unit])
    respond_with @property_unit do |format|
      if request.xhr?
        format.html { render partial: 'properties/add_new_property_unit', locals: { property: property } }
      end
    end
  end

  def destroy
    property_unit.destroy
    respond_with property
  end

  private

  def property_unit
    @property_unit ||= PropertyUnit.find(params[:id])
  end

  def property
    @property ||= property_unit.property
  end
end