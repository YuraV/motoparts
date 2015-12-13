class MotoParts.PropertyShow
  constructor: (options)->
    @options = $.extend {}, {
      propertyUnitSection: $(".property-unit-section")
      propertyUnitWrapper: $(".property_unit_unit_id")
      propertyId:          $("#property_unit_property_id")
    }, options

    { @propertyUnitSection, @propertyUnitWrapper, @propertyId, @folder} = @options

    $(document).on "submit", "#new_property_unit", (e)=>
      $this = $(e.currentTarget)

      $.post(
        '/property_units',
        $this.serialize()
      ).done (data)=>
        @propertyUnitSection.html(data)
        $(document).trigger("chosen:init")

      false

    .on "submit", "#new_unit", (e) =>
      e.preventDefault()
      $this = $(e.currentTarget)

      $.post(
        "/units",
        "#{$this.serialize()}&#{$.param(property_id: @getPropertyId())}"
      ).done (data) =>
        @propertyUnitSection.html(data)
        $(document).trigger("chosen:init")

      false

  getPropertyId: ->
    @propertyId.val()

