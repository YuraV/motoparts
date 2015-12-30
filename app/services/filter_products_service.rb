class FilterProductsService
  attr_reader :folder, :params

  def self.apply(*args)
    new(*args).apply
  end

  def initialize(folder, params)
    @folder = folder
    @params = params
  end

  def products
    @folder.products
  end

  def apply
    products.by_brand(brand) if brand
    property_iterator(products) if property
  end

  def brand
    params[:brand].presence
  end

  def property
    params[:property].presence
  end

  def property_iterator(scope)
    relation = scope
    property.each do |property|
      relation = relation.by_property(property)
    end
    relation
  end
end