Feature: user logs in with Twitter
        In order to gain access to KYCK Auth 
        As an existing account that has authenticated with Twitter
        I want to login to the app

  Scenario: User logins with Twitter 

    Given an account that has authenticated with Twitter
    When I visit the app
    And login with twitter
    Then I should be logged in
