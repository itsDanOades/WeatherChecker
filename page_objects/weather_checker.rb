# frozen_string_literal: true

# Page Object model for Weather Checker page - instantiated by world.rb
module PageObjects
  # Page Object section for postcode search container
  class SearchForm < SitePrism::Section
    element :postcode_input, 'input[name="address"]'
    element :search_button, 'button'
  end

  # Page Object section for weather details table when displayed
  class WeatherDetails < SitePrism::Section
    element :header, '.tableHeader'

    sections :weather_properties, 'tr' do
      element :header, 'th'
      element :value, 'td'
    end

    # Check if weather properties table has a specific row or header
    # returns true if present
    def has_property?(property)
      !get_property(property).nil?
    end

    # Get the value of a weather property table cell based on header
    # returns a string if present or nil
    def get_property(property)
      rows = weather_properties.select do |row|
        row.header.text.downcase == property
      end

      return nil if rows.empty?

      rows.first.value.text
    end
  end

  # Page Object definition for Weather Checker page
  class WeatherChecker < SitePrism::Page
    set_url '/'
    section :search_form, PageObjects::SearchForm, '#searchLocation'
    section :weather_details, PageObjects::WeatherDetails, 'table'
    element :error_header, 'h1'

    def search_for_postcode(postcode)
      search_form.postcode_input.set(postcode)
      search_form.search_button.click
    end
  end
end
