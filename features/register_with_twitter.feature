Feature: Register with Twitter
  In order to login with Twitter
  As a new user
  I would like to provide my twitter information
  and create a KYCK Auth account

  Scenario:
    Given I am on the new_account_registration page
    When I ask to register with twitter
    Then I am redircted to the new registration page
    And it should show my name
    And it should not show the password
    And it should ask for my email

  Scenario:
    Given I have authenticated with Twitter and authorized the app
    When I provide my email 
    Then I should get an account
    And be redirected to the home page
