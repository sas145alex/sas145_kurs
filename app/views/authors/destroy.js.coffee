# этот скрипт отрабатывает из редактирования книг
id = '<%= @author.id %>'
$('.existing-author' + id).remove()
console.log("Автор" + id + " удален!" )
