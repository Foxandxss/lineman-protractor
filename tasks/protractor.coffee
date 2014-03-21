###
Task: protractor
Description: run protractor (in a ci-like mode)
Dependencies: grunt
Contributor: @searls, @foxandxss
###
module.exports = (grunt) ->
  path = require("path")
  spawn = require("child_process").spawn

  grunt.registerTask "protractor", "run protractor specs in ci mode", (target) ->
    require('coffee-script')
    process.argv = ["doesnt", "matter", "#{process.cwd()}/config/protractorConf.js"]
    done = @async()
    require("#{process.cwd()}/node_modules/protractor/lib/cli")