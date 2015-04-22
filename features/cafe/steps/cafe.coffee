Q = require 'q'
should = require "should"
pages = require('../../../lib/cafe').pages

module.exports = ->
  require('qcumber')(@)
  require('../../../lib/cafe').steps.call(@)
  homepage = new pages.homepage()
  employees = new pages.employees()

  ### GIVEN ###
  @Given /at the cafe homepage/, ->
    url = process.env.CAFE_BASE_URL or 'http://thomasburleson.github.io/angularJS-CafeTownsend/'
    @world.visit(url)

  ### WHEN ###
  @When /login with username of "([^"]*)" and password of "([^"]*)"/, (username, password)->
    homepage.login username, password

  @When /delete employee "([^"]*)"/, (name)->
    employees.selectEmployee(name).then =>
      employees.deleteEmployee()

  @When /add a new employee with first name "([^"]*)", last name "([^"]*)", email "([^"]*)"/, (firstName, lastName, email)->
    employees.addEmployee().then =>
      employees.setEmployeeDetails firstName, lastName, email

  @When /set first name "([^"]*)", last name "([^"]*)", email "([^"]*)"/, (firstName, lastName, email)->
    employees.setEmployeeDetails firstName, lastName, email

  @When /edit employee with name "([^"]*)"$/, (name)->
    employees.editEmployee name

  @When /save the( new)? employee/, ->
    employees.saveEmployee()

  @When /logout$/, ->
    homepage.logout()

  ### THEN ###
  @Then /should see my name as "([^"]*)"/, (expectedName)->
    homepage.getUserName().then (actualName)->
      actualName.should.equal expectedName

  @Then /should not be logged in$/, ->
    homepage.getUserName().then (actualName)->
      actualName.should.be.empty

  @Then /should (see|not see) "([^"]*)" in the employee list/, (see, name)->
    employees.isEmployeeInList(name).then (inList) ->
      if see == 'see'
        inList.should.equal true, "expected #{name} to be in the employee list"
      else
        inList.should.equal false, "expected #{name} not to be in the employee list"

  @Then /should see the following employees in the employee list:$/, (table)->
    for row in table.hashes()
      name = row['name']
      employees.isEmployeeInList(name).then (inList) ->
        inList.should.equal true, "expected #{name} to be in the employee list"