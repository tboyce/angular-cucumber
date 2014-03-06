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

    login: (username, password)->
        @element(By.model 'user.userName').clear()
        @element(By.model 'user.userName').sendKeys username
        @element(By.model 'user.password').sendKeys password
        @element(By.tagName 'button').click()

    getUserName: ->
        Q @element(By.className 'session-user').getText()