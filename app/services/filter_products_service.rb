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
    folder.products
  end

  def apply
    return products unless brand || ( property && unit_id )
    scope = products
    ids = ProductProperty.select("product_id, count(product_id) as products").where(product_properties: { unit_id: unit_id }).group(:product_id).having("products = ?", property.try(:size)).pluck(:product_id)
    scope = scope.by_brand(brand) if brand
    scope = scope.find(ids) if ids.present?
    scope
  end

  def brand
    params[:brand].presence
  end

  def property
    params[:property].try(:uniq)
  end

  def unit_id
    params[:unit_id].try(:uniq)
  end

  def property_iterator(scope)
    relation = scope
    property.each do |property|
      relation = relation.by_property(property)
    end
    relation
  end
end