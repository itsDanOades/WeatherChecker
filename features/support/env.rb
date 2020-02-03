# frozen_string_literal: true

# env.rb - Entry point for Cucumber automation tests

require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'require_all'
require 'webdrivers'

# Import library and page objects to class path
project_root = File.expand_path('../../', __dir__)
require_all File.join(project_root, 'lib/*.rb')
require_all File.join(project_root, 'page_objects/*.rb')

# Register available Selenium Drivers
ENV['SELENIUM_GRID'] = 'false' if ENV['SELENIUM_GRID'].nil?
Drivers.register_selenium_drivers

# Configure Capybara automation framework with default browser and app urls from cucumber.yml config
Capybara.configure do |config|
  config.default_driver = ENV['BROWSER'].downcase.to_sym
  config.app_host = ENV['BASE_URL']
  config.default_max_wait_time = 10
end
