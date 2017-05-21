ids = []
$('div.author-id input').each( ->
  val = $(this).val()
  if !!val
    ids.push(+val) )

id = "<%= @author.try(:id) %>"
uniqAuthorOnPage = !ids.includes(+id)
timestamp = "<%= @timestamp %>"

authorNil = ("<%= @author.nil? %>" == 'true')
# пришел запрос на уникального автора
if !authorNil && uniqAuthorOnPage
  fn = "<%= @author.try(:fn) %>"
  ln = "<%= @author.try(:ln) %>"
  sn = "<%= @author.try(:sn) %>"
  author_index = "<%= @author.try(:author_index) %>"

# пришел запрос на пустого автора или неуникального автора
else
  # пришел запрос на неуникального автора
  if ! uniqAuthorOnPage
    $("#book_author_books_attributes_" + timestamp + "_author_id").val( 0 );
  id = ""
  fn = ""
  ln = ""
  sn = ""
  author_index = ""

# меняем значение полей
$('#book_author_books_attributes_' + timestamp + '_author_attributes_id').val( id )
$('#book_author_books_attributes_' + timestamp + '_author_attributes_fn').val( fn )
$('#book_author_books_attributes_' + timestamp + '_author_attributes_ln').val( ln )
$('#book_author_books_attributes_' + timestamp + '_author_attributes_sn').val( sn )
$('#book_author_books_attributes_' + timestamp + '_author_attributes_author_index').val( author_index )

console.log("Удача! это сообщение - конечный приемник")
