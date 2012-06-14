$ ->
  $("[data-sortable=tree]").each ->
    $this = $(this)
    $this.nestedSortable
      handle: ".resource"
      listType: "ul"
      items: "li"
      placeholder: "placeholder"
      update: ->
        $this.sortable("disable")
        $.ajax
          url: $this.data("sort-path")
          type: "post"
          data: $this.sortable("serialize")
        .always ->
          $this.sortable("enable")



