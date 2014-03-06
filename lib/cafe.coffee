module.exports =
  steps: ->
    require('./steps/world').call(@)
  pages:
    homepage: require('./pages/homepage')
    employees: require('./pages/employees')

