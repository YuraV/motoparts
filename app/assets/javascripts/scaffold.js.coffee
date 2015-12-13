$ ->
  # enable chosen js
  initChosen = ->
    $('.chosen-select').each (_, select) ->
      $select = $(select)
      $select.chosen
        allow_single_deselect: true
        no_results_text: 'No results matched'
        width: "#{$select.data('width')}" || "100%"

  initChosen()

  $(document).on "chosen:init", ->
    initChosen()