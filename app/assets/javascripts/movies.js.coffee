# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  $("a[data-movie]").click (e) ->
    e.preventDefault()
    movie = ".fans#" +  $(this).data("movie")
    $(movie).slideToggle()
