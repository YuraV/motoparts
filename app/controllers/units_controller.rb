class UnitsController < ApplicationController
  helper_method :property
  respond_to :html, :json

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.create(params[:unit])
    @property_unit = PropertyUnit.create(property_id: params[:property_id], unit_id: @unit.id)

    respond_with @unit do |format|
      format.html { render partial: 'properties/add_new_property_unit', locals: { property: property } if request.xhr? }
    end
  end

  def destroy
    @unit = Unit.find(params[:unit_id])
    respond_with(@unit, location: property_path(property))
  end
  private

  def property
    @property ||= Property.find(params[:property_id])
  end
end