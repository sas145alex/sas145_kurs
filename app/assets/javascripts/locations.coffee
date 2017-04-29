# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

add_form = ->
  current_link = $('#add_form')
  new_id = + new Date()
  regexp = new RegExp('new_location', 'g')
  new_form = $( current_link.attr('data-content').replace(regexp, new_id) )
  new_form.insertAfter( current_link.parent() ).hide()
  new_form.fadeToggle('slow')

locations_ready = ->
  $('#add_form').on('click', add_form)

$(document).ready(locations_ready)
$(document).on('turbolinks:load', locations_ready)
