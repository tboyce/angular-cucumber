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

    getEmployeeIndex: (name) ->
        Q @element.all(By.repeater 'employee in employees.list')
            .map (item) ->
                item.getText()
            .then (names) ->
                names.indexOf name