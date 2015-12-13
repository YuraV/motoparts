module PropertyUnitsHelper
  def units_for_property_select_tag(property)
    select_tag :unit_id, options_from_collection_for_select(Unit.not_in_property(property.units.pluck(:id)), :id, :name), include_blank: true, class: 'chosen-select'
  end
end