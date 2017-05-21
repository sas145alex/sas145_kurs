# cocoonCallback = (e, insertedItem) ->
  # console.log('вход в  cocoonCallback')


fillFields = ->
  $('select[id$=author_id]').on 'change', (e) ->
    # console.log('выведем this')
    # console.log( $(this).find('option:selected').val() )
    selectedAuthor = $(this).find('option:selected').val()
    name = $(this).attr('name').match(/attributes]\[(\d+)\]/)
    timestamp = name[name.length - 1]
    console.log("попытка послать ajax")
    $.ajax
      url: '/fill_author_form'
      type: 'POST'
      dataType: 'script'
      data: { author_id: selectedAuthor, timestamp: timestamp }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("AJAX OK!")


ru_ready = ->
  fillFields()
  $('#wrapper_for_authors').on 'cocoon:after-insert', ->
    $('select[id$=author_id]').off('change')
    # cocoonCallback()
    fillFields()


$(document).on 'turbolinks:load', ru_ready
# $(document).ready ru_ready
