$ ->
  $("input:file").removeClass("form-control")

  $(document).on "click", '.li-clickable', (e)->
    window.location.href = $(this).data("href")

  $("a[rel='facebox']").facebox()

  $(document).on "click", ".close", (e)->
    $(this).parent("div").slideUp('slow')