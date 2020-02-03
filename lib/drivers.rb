# frozen_string_literal: true

# Defines and registers the Selenium Webdriver capabilities for given browsers
module Drivers
  module_function

  # Returns webdriver capabilities for chrome browser
  def chrome_capabilities
    Selenium::WebDriver::Remote::Capabilities.chrome(
      logging_prefs: {browser: 'ALL'},
      'chromeOptions' => {
        'args' => %w[--ignore-certificate-errors],
        'w3c' => false
      },
      'acceptSslCerts' => true,
      'acceptInsecureCerts' => true
    )
  end

  # Registers :chrome webdriver options in Capybara framework
  def register_chrome_driver
    Capybara.register_driver :chrome do |app|
      if ENV['SELENIUM_GRID'] == 'false'
        Capybara::Selenium::Driver.new(app,
                                       browser: :chrome,
                                       desired_capabilities: chrome_capabilities)
      else
        Capybara::Selenium::Driver.new(app, browser: :remote,
                                            url: hub_url,
                                            desired_capabilities: chrome_capabilities)
      end
    end
  end

  # Returns webdriver capabilities for firefox browser
  def firefox_capabilities
    Selenium::WebDriver::Remote::Capabilities.firefox(
      logging_prefs: {browser: 'ALL'},
      'acceptSslCerts' => true,
      'acceptInsecureCerts' => true,
      'native_events' => true,
      :firefox_profile => Selenium::WebDriver::Firefox::Profile.new
    )
  end

  # Registers :firefox webdriver options in Capybara framework
  def register_firefox_driver
    Capybara.register_driver :firefox do |app|
      if ENV['SELENIUM_GRID'] == 'false'
        options = Selenium::WebDriver::Firefox::Options.new
        options.profile = profile
        Capybara::Selenium::Driver.new(app, browser: :firefox, options: options, desired_capabilities: firefox_capabilities)
      else
        Capybara::Selenium::Driver.new(app, browser: :remote, url: hub_url, desired_capabilities: firefox_capabilities)
      end
    end
  end

  # Returns the default Selenium Grid URL
  def self.hub_url
    'http://selenium-hub:4444/wd/hub'
  end

  def register_selenium_drivers
    register_chrome_driver
    register_firefox_driver
  end
end
