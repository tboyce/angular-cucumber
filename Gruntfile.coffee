module.exports = (grunt)->
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    env:
      dev:
        CAFE_BASE_URL: 'http://thomasburleson.github.io/angularJS-CafeTownsend/'

    cucumberjs:
      cafe:
        files:
          src: ['features/cafe']
      options:
        format: 'pretty'

    shell:
      features:
        command: './node_modules/.bin/parallel-cucumber-js --workers 4 --profiles.firefox --profiles.chrome'

  grunt.registerTask 'test:parallel', ['env:dev', 'shell:features']
  grunt.registerTask 'test', ['env:dev', 'cucumberjs']
  grunt.registerTask 'default', ['test']
