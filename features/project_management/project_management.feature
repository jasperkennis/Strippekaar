Feature: Client management
  In order to manage clients
  As an admin
  I want to be able to create and remove clients
  And I want to be able to add and remove people from clients

  Scenario: An admin views the clients overview
    Given I am logged in as "Admin" with "admin" rights
    And I am on the clients overview
    Then I should see all clients
    And I should have the option to add a new client
  
  Scenario: An admin creates a client
    Given I am logged in as "Admin" with "admin" rights
    And I am on the new client page
    When I complete the new client form
    Then I should see a confirmation message
    And I should redirect to the client page
  
  Scenario: An admin removes a client
    Given I am logged in as "Admin" with "admin" rights
    And I am on a client page
    When I remove the client
    Then I should see a confirmation message  
  
  Scenario: An admin views a client
    Given I am logged in as "Admin" with "admin" rights
    When I am on a client page
    Then I should have the option to add users
    And I should see users
    And I should have the option to remove the client
  
  Scenario: An admin adds a user to a client