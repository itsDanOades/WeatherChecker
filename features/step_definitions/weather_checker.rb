# frozen_string_literal: true

Given 'the weather checker page is loaded' do
  weather_checker.load
  expect(weather_checker).to be_displayed
end

Given 'I search for postcode {string}' do |postcode|
  weather_checker.search_for_postcode(postcode)
end

Then 'weather details for the given postcode are displayed' do
  expect(weather_checker.weather_details).to be_visible
end

Then '{string} error is displayed' do |error|
  expect(weather_checker.error_header.text).to include(error)
end

Then 'weather details display the required mandatory properties' do
  required_properties = %w[time: temperature: humidity:]
  required_properties.each do |property|
    expect(weather_checker.weather_details).to have_property(property),
                                               "Expected weather table to contain header '#{property}'"
  end
end

Then 'the current time is displayed in the correct format' do
  time = weather_checker.weather_details.get_property('time:')
  date_format_regex = %r(\d{2}\/\d{2}\/\d{4} \d{2}:\d{2}:\d{2})
  expect(time).to match date_format_regex
end

Then '{string} row is blank' do |property|
  expect(weather_checker.weather_details.get_property(property.downcase)).to be_empty
end
