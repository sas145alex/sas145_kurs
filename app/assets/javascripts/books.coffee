cocoonCallback = (e, insertedItem) ->
  selectedAuthor = $('#book_authors option:selected').val()

  console.log(insertedItem)
  if selectedAuthor
    form_id = "author" + (selectedAuthor)
    insertedItem.attr('id', form_id)
    console.log("попытка послать ajax")
    $.ajax 'fill_author_form',
      type: 'GET'
      dataType: 'script'
      data: { author_id: selectedAuthor }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("AJAX OK!")

ru_ready = ->
  $('#wrapper_for_authors').on('cocoon:after-insert', cocoonCallback)

$(document).on 'turbolinks:load', ru_ready
# $(document).ready ru_ready
