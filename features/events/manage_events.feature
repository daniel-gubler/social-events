Feature: Manage events

  Background:
    Given I am logged in

  Scenario: Create an event
    Given I am on the home page
    And I follow "Events"
    And I follow "New Event"
    And I fill in "Title" with "Chess Tourn"
    And I fill in "Start date" with "05/11/2015"
    And show me the page
    And I fill in "Street" with "200 S 400 E"
    And I fill in "City" with "St George"
    And I fill in "State" with "UT"
    And I fill in "Country" with "USA"
    And I fill in "Zip" with "84770"
    And I press "Save"
    Then I should see "Event was successfully created."