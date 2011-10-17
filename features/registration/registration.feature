Feature: Registration
  In order to keep track data related to me
  As a user
  I want to be able to log in

  Scenario: Creating a User
    Given I am logged in as Admin
    When I am on the users page
    Then I should see a link with the text: "Create a user"