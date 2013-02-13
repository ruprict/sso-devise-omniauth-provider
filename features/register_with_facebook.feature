Feature: Register with Facebook
  In order to login with Facebook
  As a new user
  I would like to provide my facebook information
  and create a KYCK Auth account

  Scenario:
    Given I am on the new_account_registration page
    When I ask to register with facebook
    Then I should be logged in 
