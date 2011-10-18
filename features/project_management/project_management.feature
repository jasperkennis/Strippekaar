Feature: Project management
  In order to manage projects
  As an admin
  I want to be able to create and delete projects
  And I want to be able to add and remove people from projects

  Scenario: An admin creates a project
  
  Scenario: An admin deletes a project
  
  Scenario: An admin views a project
    Given I am logged in as "Admin" with "admin" rights
    When I am on a project page
    Then I should see a link with the text: "Add a user"
    And I should see users
  
  Scenario: An admin adds a user to a project
    