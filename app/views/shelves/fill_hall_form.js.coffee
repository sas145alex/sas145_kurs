if ('<%= @hall.nil? %>' == 'true')
  $('#shelf_hall_attributes_id').val('')
  $('#shelf_hall_attributes_short_name').val('')
  $('#shelf_hall_attributes_full_name').val('')
else
  $('#shelf_hall_attributes_id').val('<%= @hall.id %>')
  $('#shelf_hall_attributes_short_name').val('<%= @hall.short_name %>')
  $('#shelf_hall_attributes_full_name').val('<%= @hall.full_name %>')
