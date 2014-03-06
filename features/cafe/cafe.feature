Feature: Cafe

    Scenario: Open Cafe page
        Given I am at the cafe homepage
        Then I should see "CafeTownsend" in the title

    @wip
    Scenario: Logging in
        Given I am at the cafe homepage
        When I login with username of "tboyce@gmail.com" and password of "angular"
        Then I should see my name as "tboyce@gmail.com"