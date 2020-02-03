# frozen_string_literal: true

# Defines the page objects to be instantiated for the test
module TestWorld
  def weather_checker
    @weather_checker || PageObjects::WeatherChecker.new
  end
end

# Expose TestWorld to Cucumber namespace to allow step_definitions to reference page objects
World(TestWorld)
