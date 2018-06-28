@flight
Feature: Orbitz Flight Search

  Background:
    Given user is on orbitz home page

  @smoke
#  Imperative style of Gherkin
  Scenario: verify the user is able to search for future flights
    When user selects flight icon
    And user choose round trip flight search
    And user search for the city columbus and select the departure airport Columbus, OH
    And user search for the city cleveland and select the arrival airport Cleveland
    And select the future date as departing date
    And select the future as arrival date
    And click on the search button
    Then user should see the results related to the Cleveland

#  Declarative style of Gherkin
  Scenario: verify the user is able to search for future flights using declarative fashion
    When user search for the future flights
    Then user should see the results flights related to the arrival airport

  @regression @cars
  Scenario Outline: verify the user is able to search for future flights for different airports
    When user selects flight icon
    And user choose round trip flight search
    And user search for the city <dep_city_name> and select the departure airport <dep_airport>
    And user search for the city <arr_city_name> and select the arrival airport <arr_airport>
    And select the future date as departing date
    And select the future as arrival date
    And click on the search button
    Then user should see the results related to the <arr_airport>

    Examples:
      | dep_city_name | dep_airport  | arr_city_name | arr_airport |
      | columbus      | Columbus, OH | cleveland     | Cleveland   |
      | cleveland     | Cleveland    | boston        | Boston      |

    @smoke
  Scenario: verify the users is warned when searching for past flights
    When user selects flight icon
    And user choose round trip flight search
    And user search for the city columbus and select the departure airport Columbus, OH
    And user search for the city cleveland and select the arrival airport Cleveland
    And select the past date as departing date
    And select the past as arrival date
    And click on the search button
    And user should see the following
      | error_messages                                |
      | Dates must be between 6/11/2018 and 5/7/2011. |

  Scenario: verify the available flights are displayed by sort order of price
    When user search for the future flights
    Then verify the available flights are displayed by sort order of price

    @smoke
  Scenario: testing the yml files
    Then user should have access to the data in yml files

  @wip
  Scenario: still working
    When jfklaslkjfl
    Then fafsfdf

  @manual
  Scenario: still working manually
    When jfklaslkjfl
    Then fafsfdf