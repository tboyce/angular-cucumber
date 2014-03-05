Q = require 'q'
should = require "should"

module.exports = ->
    require('qcumber')(@)
    require('../../../lib/cafe').steps.call(@)

    @Given /at the cafe homepage/, ->
        url = 'http://thomasburleson.github.io/angularJS-CafeTownsend/'
        @world.visit(url)

    @Then /should see "([^"]*)" in the title/, (what) ->
        @world.title()
        .then (text)->
            text.indexOf(what).should.be.greaterThan -1,
                "'#{what}' expected in title (#{text})"