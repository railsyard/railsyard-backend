$ ->
  error_humane = humane.create(timeout: 10000, type: 'error')
  $(".flash").each ->
    $this = $(this)
    if $this.is(".flash-notice")
      humane.success $this.html()
    else if $this.is(".flash-alert")
      error_humane $this.html(), timeout: 10000
