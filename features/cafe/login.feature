Feature: Login

  Scenario: Open Cafe page
    Given I am at the cafe homepage
    Then I should see "CafeTownsend" in the title

  Scenario: Logging in
    Given I am at the cafe homepage
    When I login with username of "tboyce@gmail.com" and password of "angular"
    Then I should see my name as "tboyce@gmail.com"

  Scenario: Logging out
    Given I am at the cafe homepage
    When I login with username of "tboyce@gmail.com" and password of "angular"
    And I logout
    Then I should not be logged in