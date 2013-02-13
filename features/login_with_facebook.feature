Feature: user logs in with Facebook
        In order to gain access to KYCK Auth 
        As an existing account that has authenticated with Facebook
        I want to login to the app

  Scenario: User logins with Facebook

    Given an account that has authenticated with Facebook
    When I visit the app
    And login with facebook
    Then I should be logged in
