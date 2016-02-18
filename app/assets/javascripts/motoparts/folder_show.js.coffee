class MotoParts.FolderShow
  constructor: (options)->
    @options = $.extend {

    }, options

    @folder   = @options.folder
    @category = @options.category

    $(document).on "applay:filter", (e) =>
      params = @populateData()
      $.get("/categories/#{@category}/folders/#{@folder}/products/filter", params).done (data)=>
        $(".products").html(data).find("[rel=facebox]").facebox()

    $(document).trigger("applay:filter")
    $(".list-group :checkbox").on "change", => $(document).trigger("applay:filter")

  populateData: ->
    data = { brand: [], property: [], unit_id: [] }
    $(".list-group :checkbox:checked").each (index, checkbox)=>
      $checkbox = $(checkbox)
      $ul = $checkbox.parents("ul")
      if $ul.data("type") == "property"
        data.unit_id.push($checkbox.val())
        data.property.push($ul.data("id"))
      else
        data.brand.push($checkbox.val())
    data