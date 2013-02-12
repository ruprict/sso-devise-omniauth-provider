Feature: Register with Email
  As a new user
  I would like to provide my email and password
  so that I can create a Kyck Auth Account

  Scenario:
    Given I am on the sign up page
    When I provide my registration information
    Then I should have a new account
    And I should see "Account Created"
