Q = require 'q'
should = require "should"
pages = require('../../../lib/cafe').pages

module.exports = ->
    require('qcumber')(@)
    require('../../../lib/cafe').steps.call(@)
    homepage = new pages.homepage()

    @Given /at the cafe homepage/, ->
        url = process.env.CAFE_BASE_URL
        @world.visit(url)

    @When /login with username of "([^"]*)" and password of "([^"]*)"/, (username, password)->
        homepage.login username, password

    @Then /see my name as "([^"]*)"/, (name)->
        homepage.getUserName().then (text) ->
            text.should.be.equal name