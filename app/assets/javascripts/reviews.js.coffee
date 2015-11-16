# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$(document).on "page:change", ->

  $("span.created-at").each ->
    createdDate = $(this).text().trim()
    formatedCreatedDate = moment(createdDate).fromNow()
    $(this).text "(#{formatedCreatedDate})"

