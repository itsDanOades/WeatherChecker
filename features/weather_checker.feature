Feature: Weather Checker
  As a user of the weather checker app
  I want to provide a postcode
  So that I can view location specific weather data

  Background: Page Load
    Given the weather checker page is loaded

  Scenario Outline: Weather details are displayed for a valid postcode
    When I search for postcode "<postcode>"
    Then weather details for the given postcode are displayed

    Examples:
      | postcode |
      | W6 0NW   |
      | W60NW    |

  Scenario: Required weather properties are displayed
    When I search for postcode "W6 0NW"
    Then weather details display the required mandatory properties

  Scenario: Time is displayed in DD/MM/YYYY HH:mm:ss format
    When I search for postcode "W6 0NW"
    Then the current time is displayed in the correct format

  # TODO: confirm if blank fields should be displayed or removed from the table
  Scenario: Empty field is displayed for missing weather property
    When I search for postcode "W6 0NW"
    Then "Precip Type:" row is blank

  # TODO: Actual error messages differ from spec, confirm if this is intentional
  Scenario Outline: Error is displayed for invalid postcode
    When I search for postcode "<postcode>"
    Then "<error>" error is displayed

    Examples:
      | postcode | error               |
      | B99 9AA  | Postcode not found! |
      | EC1A 1BB | Postcode not valid  |

