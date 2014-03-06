module.exports = (grunt)->
    require('load-grunt-tasks')(grunt);

    grunt.initConfig
        env:
            dev:
                CAFE_BASE_URL: 'http://thomasburleson.github.io/angularJS-CafeTownsend/'

        cucumberjs:
            cafe:
                files:
                    src: ['features/cafe/*.feature']
                options:
                    tags: '@wip'
            options:
                format: 'pretty'

    grunt.registerTask 'test', ['env:dev', 'selenium-launch', 'cucumberjs:cafe']
    grunt.registerTask 'default', ['test']