MotoParts.ns('MotoParts.SideBar')

class MotoParts.SideBar
  constructor: (options)->
    @settings = $.extend {}, {
      sideBar:  $("#side-bar")
      contentCenter: $("#content-center")

    }, options

    { @sideBar, @contentCenter } = @settings

    @sideBar.height(@contentCenter.outerHeight())

    $(document).on "click", ".category", (e)->
      $this = $(this)
      e.preventDefault()
      $this.next(".folders:first").slideToggle()

    @sideBar.find($("a[href='#{$(location)[0].pathname.match(/(\/categories\/\d+)/)[0]}'")).next('ul').show() unless $(location)[0].pathname == '/'

#    $(document).on "click", "a", (e)->
#      $this = $(this)
#      e.preventDefault()
#      $.ajax($this.attr("href"), { type: "GET", dataType: "HTML" }).done (data)->
#        $("#content-inner").html(data)