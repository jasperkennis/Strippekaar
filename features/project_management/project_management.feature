Feature: Project management
  In order to manage projects
  As an admin
  I want to be able to create and remove projects
  And I want to be able to add and remove people from projects

  Scenario: An admin views the projects overview
    Given I am logged in as "Admin" with "admin" rights
    And I am on the projects overview
    Then I should see all projects
    And I should have the option to add a new project
  
  Scenario: An admin creates a project
    Given I am logged in as "Admin" with "admin" rights
    And I am on the new project page
    When I complete the new project form
    Then I should see a confirmation message
    And I should redirect to the project page
  
  Scenario: An admin removes a project
    Given I am logged in as "Admin" with "admin" rights
    And I am on a project page
    When I remove the project
    Then I should see a confirmation message  
  
  Scenario: An admin views a project
    Given I am logged in as "Admin" with "admin" rights
    When I am on a project page
    Then I should have the option to add users
    And I should see users
    And I should have the option to remove the project
  
  Scenario: An admin adds a user to a project
  
    