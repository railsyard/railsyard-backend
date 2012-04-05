# Expand/collapse field groups in edit form

$.fn.groupsToggle = ->
  @each ->
    $h3 = $(this)
    $h3.addClass 'ui-accordion-header ui-helper-reset ui-state-default ui-state-focus'
    $h3.prepend $('<span>').addClass( 'ui-icon ui-icon-triangle-1-s' )

    visible = true
    group = $h3.next 'div'
    group.addClass 'ui-accordion-content'

    $h3.click ->
      if visible
        group.slideUp()
        $('span', this).toggleClass('ui-icon-triangle-1-e').toggleClass('ui-icon-triangle-1-s')
        visible = false
      else
        group.slideDown()
        $('span', this).toggleClass('ui-icon-triangle-1-e').toggleClass('ui-icon-triangle-1-s')
        visible = true
