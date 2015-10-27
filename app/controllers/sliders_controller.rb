class SlidersController < ApplicationController
  respond_to :html
  helper_method :slider, :sliders

  def index

  end

  def new
    @slider = Slider.new
    respond_with(@slider)
  end

  def create
    @slider = SliderCreatorService.create!(params)
    respond_with(@slider)
  end

  private
  def slider
    @slider ||= Slider.find(params[:id])
  end

  def sliders
    @sliders ||= Slider.scoped
  end
end