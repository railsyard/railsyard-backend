$ ->
  $("[data-resize-width-based-on]").each ->
    $this = $(this)
    $el = $($this.data("resize-width-based-on"))
    percentage = $this.data("resize-percentage")

    resize = -> $this.css width: $el.width() * parseFloat(percentage)
    $(window).resize(resize)
    resize()


