module.exports = (grunt)->
    require('load-grunt-tasks')(grunt);

    grunt.initConfig
        cucumberjs:
            cafe:
                files:
                    src: ['features/cafe/*.feature']
                options:
                    tags: '@wip'
            options:
                format: 'pretty'

    grunt.registerTask 'test', ['selenium-launch', 'cucumberjs:cafe']
    grunt.registerTask 'default', ['test']