Feature: Employee List


  Background: Logged In
    Given I am at the cafe homepage
    And I login with username of "tboyce@gmail.com" and password of "angular"


  Scenario: List current employees
    Then I should not see "Timothy Boyce" in the employee list
    And I should see the following employees in the employee list:
      | name            |
      | Thomas Burleson |
      | Misko Hevery    |
      | Igor Minar      |
      | Vojta Jina      |
      | Dan Doyan       |


  Scenario: Delete employee
    When I delete employee "Igor Minar"
    Then I should not see "Igor Minar" in the employee list


  Scenario: Add employee
    When I add a new employee with first name "Timothy", last name "Boyce", email "tboyce@gmail.com"
    And save the new employee
    Then I should see "Timothy Boyce" in the employee list


  Scenario: Edit employee
    When I edit employee with name "Thomas Burleson"
    And set first name "Timothy", last name "Boyce", email "tboyce@gmail.com"
    And save the employee
    Then I should see "Timothy Boyce" in the employee list
