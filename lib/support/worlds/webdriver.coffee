Q = require "q"
should = require "should"
webdriver = require "selenium-webdriver"
protractor = require 'protractor'

_destroyed = false
module.exports = class World
  constructor: (browser = "chrome") ->
    @driver = new webdriver.Builder().
    usingServer(process.env.SELENIUM_HUB).
    withCapabilities(webdriver.Capabilities[browser]()).build()

    @driver.manage().timeouts().setScriptTimeout(10000)
    @ptor = protractor.wrapDriver @driver

  visit: (url) ->
    Q @driver.get(url)

  title: ->
    Q @driver.getTitle()

  destroy: ->
    _destroyed = true
    @driver.quit()

  isDestroyed: -> _destroyed