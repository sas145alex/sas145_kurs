ready = ->
  $("#sidebar-toggle").on 'click', ->
    id=$(this).children('.sidebar-toggle').attr 'href'
    $(id).toggleClass 'toggled'
    false
togglef = ->
  # console.log('это togglef')
  $(".with-subitems").on 'click', ->
    # console.log('это клик по .with-subitems')
    $(this).parent().children(".subitems").toggle(300)
    false
$(document).ready ready
$(document).on 'page:load', ready
$(document).ready togglef
$(document).on 'page:load', togglef
# $(document).on 'turbolinks:load', ready
# $(document).on 'turbolinks:load', togglef
