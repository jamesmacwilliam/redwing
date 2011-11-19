Feature: Homepage
  In order to ensure that the homepage works
  As an unauthenticated user
  I should not be able to access pages until I authenticate
  
  @selenium
  Scenario: Visit Homepage
    Given I am an unauthenticated user
    When I visit the homepage
    And I click the "Customers" link
    Then the page should error with "You need to sign in or sign up before continuing"
    
  @selenium
  Scenario: Authenticate
    Given I am an unauthenticated user
    When I visit the homepage
    And I click the "Sign up" button
    And I fill in "Email" with "jimmymac85@gmail.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I click the "Sign up" button
    Then the page should succeed with "Welcome! You have signed up successfully."
