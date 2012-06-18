$ ->
  $("[data-sortable=tree]").each ->
    $this = $(this)
    $this.nestedSortable
      forcePlaceholderSize: true,
      handle: 'article'
      listType: 'ul'
      items: 'li'
      opacity: .6
      placeholder: 'placeholder'
      update: ->
        $this.nestedSortable("serialize")
        $this.nestedSortable("disable")
        $.ajax
          url: $this.data("sort-path")
          type: "post"
          data: $this.sortable("serialize")
        .always ->
          $this.nestedSortable("enable")



