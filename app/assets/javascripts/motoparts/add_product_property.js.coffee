class MotoParts.AddProductProperty
  constructor: (options)->
    @options = $.extend {}, {
      addButton:  $(".add-record")
      property:   "#property_id"
      unit:       "#unit_id"
      ppContainer:$(".properties-container")
      value:      $("#product_property_value")
    }, options

    { @addButton, @property, @unit, @ppContainer, @value, @product } = @options

    $(document).on "click", ".add-record", (e) =>
      $.post('/product_properties',
        product_property: {
          property_id: @getValueOf(@property),
          unit_id: @getValueOf(@unit),
          product_id: @product,
        }
      ).done (data)=>
        @ppContainer.html(data).end()
        $(document).trigger("chosen:init")

    $(document).on "change", "#property_id", (e) =>
      $this = $(e.currentTarget)

      $.getJSON("/properties/#{@getValueOf(@property)}/units_from_property").done (data) =>
        $unitSelect = $(document).find("#unit_id")
        html = _.reduce data, (options, unit) =>
          options += "<option value ='#{unit.id}'>#{unit.name}</option>"
        , "<option value =''></option>"
        $unitSelect.html(html).trigger("chosen:updated")

  getValueOf: (id)->
    $(document).find(id).val()