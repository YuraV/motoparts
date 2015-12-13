class MotoParts.FolderShow
  constructor: (options)->
    @options = $.extend {

    }, options

    @folder   = @options.folder
    @category = @options.category


    $(document).on "change", ".list-group :checkbox", (e) =>
      data = { brand: [], property: [] }
      $(".list-group :checkbox:checked").each (index, checkbox)=>
        $checkbox = $(checkbox)
        data[$checkbox.parents("ul").attr("id")].push($checkbox.val())

      $.get("/categories/#{@category}/folders/#{@folder}/products/filter", data).done (data)=>
        $(".products").html(data)
