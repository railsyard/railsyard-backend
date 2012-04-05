#= require jquery
#= require jquery-ui
#= require jquery_ujs
#= require jquery.dataTables.min.js
#= require_tree .

$(document).ready ->
  $("button, input[type=submit]").button()

  $("[data-table]").dataTable
    bJQueryUI: true
    bPaginate: true
    sPaginationType: "full_numbers"
