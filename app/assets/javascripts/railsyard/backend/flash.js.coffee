$ ->
  $(".flash").each ->
    $this = $(this)
    if $this.is(".flash-notice")
      humane.success $this.html()
    else if $this.is(".flash-alert")
      humane.error $this.html()
