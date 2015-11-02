class ProductCreatorService

  attr_accessor :params, :product, :folder, :pictures, :gallery

  def self.create!(options = {})
    new(options).create!
  end

  def initialize(options)
    @params   = options[:params]
    @pictures = params[:gallery_pictures]
    @folder   = options[:folder]
    @product = folder.products.build(params[:product])
  end

  def create!
    if product.save
      create_gallery
      populate_gallery
    end
    product
  end

  def create_gallery
    @gallery = product.build_gallery(name: "#{@product.id}_gallery")
    @gallery.save
  end

  def populate_gallery
    pictures.each { |picture| gallery.pictures.create(picture: picture) }
  end
end