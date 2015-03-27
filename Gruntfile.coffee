module.exports = (grunt) ->
    require('load-grunt-tasks')(grunt)

    # Project configuration.
    grunt.initConfig
        pkg: grunt.file.readJSON("package.json")

        coffee:
            compileJoined:
                options:
                    join: true
                files:
                    'js/angular-daterangepicker-plus.js': ['coffee/angular-daterangepicker-plus.coffee']

        watch:
            files: ['example.html', 'coffee/*.coffee']
            tasks: ['coffee']

        uglify:
            options:
                sourceMap: true
            target:
                files:
                    'js/angular-daterangepicker-plus.min.js': ['js/angular-daterangepicker-plus.js']
        wiredep:
            target:
                src: [
                    './example.html'
                ]

        ngAnnotate:
            options:
                singleQuotes: true

            daterangepicker:
                files:
                    'js/angular-daterangepicker-plus.js': ['js/angular-daterangepicker-plus.js']


    # Default task(s).
    grunt.registerTask "default", ["coffee"]
    grunt.registerTask "develop", ["coffee", "watch"]
    grunt.registerTask "dist", ["coffee", "ngAnnotate", "uglify"]
