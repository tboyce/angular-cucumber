World = require "../support/worlds"
module.exports = ->
    @world = World.get()

    @After (done)=>
        @world.visit('about:blank').then(done)

    @registerHandler 'AfterFeatures', (event, done)=>
        @world?.destroy().then(done)

    @Then /should see "([^"]*)" in the title/, (title)->
        @world.title()
        .then (text)->
                text.indexOf(title).should.be.greaterThan -1,
                    "'#{title}' expected in title (#{text})"