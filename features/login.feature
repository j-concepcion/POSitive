Feature: System requires login
  In order to use the application's features
  As an authorized user
  I want to log into the system
  
  Scenario: Authorized user logs in
    Given I am an authorized user
    And I visit the application
    When I login
    Then I should see my dashboard
    
  Scenario: Unauthorized user logs in
    Given I am not authorized
    And I visit the application
    When I login
    Then I should see a failure message
    