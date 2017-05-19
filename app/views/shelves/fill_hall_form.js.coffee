if ('<%= @hall.nil? %>' == 'true')
  $('#shelf_hall_attributes_id').val('')
  $('#shelf_hall_attributes_short_name').val('')
  $('#shelf_hall_attributes_full_name').val('')
else
  $('#shelf_hall_attributes_id').val('<%= @hall.try(:id) %>')
  $('#shelf_hall_attributes_short_name').val('<%= @hall.try(:short_name) %>')
  $('#shelf_hall_attributes_full_name').val('<%= @hall.try(:full_name) %>')
