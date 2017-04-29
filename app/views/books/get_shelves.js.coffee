current_row = $("tr#book<%=@book.id%>")
next_row = current_row.next()
if next_row.attr('id') == 'book_shelves<%=@book.id%>'
  next_row.fadeToggle('fast', ->
    next_row.remove() )
else
  new_row = $( current_row.attr('data-content') )
  new_row.insertAfter( current_row ).hide()
  new_row.fadeToggle()
