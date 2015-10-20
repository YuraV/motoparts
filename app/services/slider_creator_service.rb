class SliderCreatorService
  attr_reader :slider, :pictures

  def self.create!(options = {})
    new(options).create!
  end

  def initialize(options)
    @pictures = options[:pictures]
    @slider   = Slider.new(options[:slider])
  end

  def create!
    slider.save ? create_pictures : slider
  end

  def create_pictures
    pictures.each do |picture|
      slider.pictures.create(picture: picture)
    end
    slider
  end
end