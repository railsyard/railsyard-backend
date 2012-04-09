# Expand/collapse field groups in edit form

$.fn.groupsToggle = ->
  @each ->
    $header = $(this)
    $header.addClass 'ui-accordion-header ui-helper-reset ui-state-default ui-state-focus'
    $header.prepend $('<span>').addClass( 'ui-icon ui-icon-triangle-1-s' )

    visible = true
    $group = $header.next 'div'
    $group.addClass 'ui-accordion-content'

    $header.click ->
      if visible
        $group.slideUp()
        $('span', this).toggleClass('ui-icon-triangle-1-e').toggleClass('ui-icon-triangle-1-s')
        visible = false

      else
        $group.slideDown()
        $('span', this).toggleClass('ui-icon-triangle-1-e').toggleClass('ui-icon-triangle-1-s')
        visible = true
