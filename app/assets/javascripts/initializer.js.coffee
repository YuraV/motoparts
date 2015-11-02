$ ->
  $("input:file").removeClass("form-control")
  $(document).on "click", '.li-clickable', (e)->
    window.location.href = $(this).data("href")