ajax_post_fill_hall = (e) ->
  selectedHall = $(this).val()
  $.ajax
    url: '/fill_hall_form',
    type: 'POST',
    dataType: 'script',
    data: {
      hall_id: +$(this).val()
    },
    error: (jqXHR, textStatus, errorThrown) ->
      console.log("AJAX Error: #{textStatus}")
    success: (data, textStatus, jqXHR) ->
      console.log("Ajax завершен!")

$(document).on 'turbolinks:load', ->
  $('#select_existing_hall').on 'change', ajax_post_fill_hall
