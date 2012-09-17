# Expand/collapse field groups in edit form

$.fn.domToggle = ->
  @each ->
    $header = $(this)
    $header.prepend $('<span>').addClass('open')

    visible = true

    $group = $($header.attr("href"))
    if $header.data("toggle-closed")
      $('span', this).removeClass('open').addClass('closed')
      $group.hide()
      visible = false

    $header.click ->
      if visible
        $group.slideUp()
        $('span', this).removeClass('open').addClass('closed')
        visible = false
      else
        $group.slideDown()
        $('span', this).removeClass('closed').addClass('open')
        visible = true

      false

$ -> $("[data-behaviour=dom-toggle]").domToggle()
