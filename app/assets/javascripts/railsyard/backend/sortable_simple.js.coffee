$ ->
  $("[data-sortable=simple]").each ->
    $this = $(this)
    $this.sortable
      placeholder: "placeholder"
      forcePlaceholderSize: true
      update: ->
        $this.sortable("disable")
        $.ajax
          url: $this.data("sort-path")
          type: "post"
          data: $this.sortable("serialize")
        .always ->
          $this.sortable("enable")


