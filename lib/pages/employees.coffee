Q = require "q"
World = require "../support/worlds"
protractor = require 'protractor'
By = protractor.By

module.exports = class Homepage

  constructor: ->
    @world = World.get()
    @browser = @world.ptor
    @element = @browser.element
    @driver = @browser.driver

  getEmployees: ->
    @element.all(By.repeater 'employee in employees.list')

  getEmployeeIndex: (name) ->
    Q @getEmployees()
    .map (item) ->
      item.getText()
    .then (names) ->
      names.indexOf name

  isEmployeeInList: (name) ->
    @getEmployeeIndex(name).then (index) ->
      index > -1

  selectEmployee: (name) ->
    @getEmployeeIndex(name).then (index) =>
      @getEmployees().then (items) ->
        items[index].click()

  deleteEmployee: ->
    @element(By.id 'bDelete').click()

  addEmployee: ->
    @element(By.id 'bAdd').click()

  enterText: (el, val) ->
    el.clear().then ->
      el.sendKeys val

  setEmployeeDetails: (firstName, lastName, email) ->
    @enterText @element(By.model 'employee.firstName'), firstName
    @enterText @element(By.model 'employee.lastName'), lastName
    @enterText @element(By.model 'employee.email'), email
    @enterText @element(By.model 'employee.startDate'), '01/21/2014'

  saveEmployee: ->
    @element(By.partialButtonText 'Save').click()

  editEmployee: (name) ->
    @selectEmployee name
    @element(By.id 'bEdit').click()
