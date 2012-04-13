$(document).ready ->
  $(".button, button, input[type=submit]").button()

  $("[data-table]").dataTable
    bJQueryUI: true
    bPaginate: true
    sPaginationType: "full_numbers"

  $("h3[data-behaviour=groups-toggle]").groupsToggle()
