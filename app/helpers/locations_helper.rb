module LocationsHelper
  def get_location_form(form)
    new_obj = Location.new
    fields = form.fields_for(:location, new_obj,
    :child_index => 'new_location') do |builder|
      render 'single_location_form', form: builder
    end
  end
end
