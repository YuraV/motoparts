MotoParts.ns('MotoParts.Main')

class MotoParts.Main
  constructor: (options)->
    @settings = $.extend {}, {
      category: ".category"

    }, options

    @category = $(@settings.category)

    $(document).on "click", ".category", (e)->
      $this = $(this)
      e.preventDefault()
      $this.next(".folders:first").slideToggle()


#    $(document).on "click", "a", (e)->
#      $this = $(this)
#      e.preventDefault()
#      $.ajax($this.attr("href"), { type: "GET", dataType: "HTML" }).done (data)->
#        $("#content-inner").html(data)