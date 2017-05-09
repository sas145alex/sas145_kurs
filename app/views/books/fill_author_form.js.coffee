ids = []
$('td.author-id input').each( ->
  val = $(this).val()
  if !!val
    ids.push(+val) )
id = "<%= @author.id %>"
# console.log("массив:" + ids)
# console.log("id:" + id)
# console.log("ids.includes(+id) ? :" + ids.includes(+id))
if ! ids.includes(+id)
# console.log(id)
  fn = "<%= @author.fn %>"
  ln = "<%= @author.ln %>"
  sn = "<%= @author.sn %>"
  author_index = "<%= @author.author_index %>"

  $('#author' + id + ' .author-id input').val( id )
  $('#author' + id + ' .author-fn input').val( fn )
  $('#author' + id + ' .author-ln input').val( ln )
  $('#author' + id + ' .author-sn input').val( sn )
  $('#author' + id + ' .author-author-index input').val( author_index )

console.log("Удача! это сообщение - конечный приемник")
