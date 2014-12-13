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

  selectEmployee: (name)->
    @getEmployeeIndex(name).then (index) =>
      @getEmployees().then (items) =>
        items[index].click()

  deleteEmployee: ->
    @element(By.id 'bDelete').click()

  addEmployee: ->
    @element(By.id 'bAdd').click()

  setEmployeeDetails: (firstName, lastName, email) ->
    @element(By.model 'employee.firstName').clear().sendKeys firstName
    @element(By.model 'employee.lastName').clear().sendKeys lastName
    @element(By.model 'employee.email').clear().sendKeys email
    @element(By.model 'employee.startDate').clear().sendKeys '01/21/2014'

  saveEmployee: ->
    @element(By.partialButtonText 'Save').click()

  editEmployee: (name) ->
    @selectEmployee name
    @element(By.id 'bEdit').click()
