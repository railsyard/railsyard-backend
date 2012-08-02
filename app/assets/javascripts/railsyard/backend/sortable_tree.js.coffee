# add depth level to css class
depthFinder = (node) ->
  $('li.resource > ul, li.placeholder > ul', node).each ->
    depth = $(this).parents('li.resource, li.placeholder').length
    $(this).removeClass().addClass('level-' + depth)

$ ->
  $("[data-sortable=tree]").each ->
    $this = $(this)
    depthFinder($this)
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
        depthFinder($this)
        $.ajax
          url: $this.data("sort-path")
          type: "post"
          data: $this.sortable("serialize")
        .always ->
          $this.nestedSortable("enable")



