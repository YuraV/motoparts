module ProductHelper

  def brands
    Brand.scoped
  end

  def properties_select_tag
    select_tag :property_id, options_from_collection_for_select(Property.scoped, :id, :name), include_blank: true, class: 'chosen-select', data: { width: "150px" }
  end

  def units_select_tag
    select_tag :unit_id, options_from_collection_for_select(Unit.scoped, :id, :name), include_blank: true, class: 'chosen-select'
  end
end