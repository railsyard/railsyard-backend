$ ->
  $("[data-sortable=simple]").each ->
    $this = $(this)
    $this.sortable
      update: ->
        serialized =
        $.ajax
          url: $this.data("sort-path")
          type: "post"
          data: $this.sortable("serialize")
        .success ->
          alert("Wee!")
        .error ->
          alert("Fail")


