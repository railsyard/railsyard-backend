$ ->
  $("[data-sortable=simple]").each ->
    $this = $(this)
    $this.sortable
      placeholder: "placeholder"
      update: ->
        $this.sortable("disable")
        $.ajax
          url: $this.data("sort-path")
          type: "post"
          data: $this.sortable("serialize")
        .always ->
          $this.sortable("enable")


