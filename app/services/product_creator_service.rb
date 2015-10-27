class ProductCreatorService

  attr_accessor :pictures, :product, :galery

  def self.create!(options = {})
    new(options).create!
  end

  def initialize(options)
    @pictures = options[:pictures]
    @product  = folder.products.build(options[:product])
    @galery   = Galery.new
  end

  def create!
    if product.save
      product.galery = galery

    else

    end

  end
end