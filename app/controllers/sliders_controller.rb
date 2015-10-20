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
    # @slider = Slider.new(params[:slider])
    # if @slider.save
    #   if params[:pictures]
    #     #===== The magic is here ;)
    #     params[:pictures].each { |picture|
    #       @slider.pictures.create(picture: picture)
    #     }
    #   end
    # end
    respond_with(@slider)
    # respond_to do |format|
    #   if @slider.save
    #
    #     if params[:pictures]
    #       #===== The magic is here ;)
    #       params[:pictures].each { |picture|
    #         @slider.pictures.create(picture: picture)
    #       }
    #     end
    #
    #     format.html { redirect_to @slider, notice: 'Slider was successfully created.' }
    #     format.json { render json: @slider, status: :created, location: @slider }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @slider.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private
  def slider
    @slider ||= Slider.find(params[:id])
  end

  def sliders
    @sliders ||= Slider.scoped
  end
end