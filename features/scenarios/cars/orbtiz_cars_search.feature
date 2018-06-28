@cars
Feature: Orbitz car Search

  Background:
    Given user is on orbitz home page

  @smoke
#  Imperative style of Gherkin
  Scenario: verify the user is able to search for future flights
    When user selects flight iconf
    das
    f

    And user choose round trip flight search
    And user search for the city columbus and select the departure airport Columbus, OH
    And user search for the city cleveland and select the arrival airport Cleveland
    And select the future date as departing dfdsa
Feature:
  In order to
  As a
  I want
sdf

  ate
    And select the future as arrival date
    And click on the search button
    Then user should see the results related to the Cleveland