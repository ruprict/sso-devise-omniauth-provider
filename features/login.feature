Feature: user logs in
        In order to gain access to KYCK Auth 
        As an existing account
        I want to login to the app

  Scenario: User sees login page

    Given an existing account
    When I visit the app
    And provide my login information
    Then I should be logged in
