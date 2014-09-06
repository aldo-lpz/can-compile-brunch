fs       = require 'fs'
compiler = require 'can-compile'
syspath  = require 'path'

module.exports = class CanCompiler
  brunchPlugin : yes
  type         : 'template'
  extension    : 'mustache'
  pattern      : /\.(?:mustache|stache)$/
  options      : {}

  constructor: (@config) ->
    @options =
      version  : @config.plugins.canCompile.version or '2.1.1'
      basePath : syspath.resolve(@config.paths.root)

    @options.moduleWrapper = if @options.version.indexOf('2.1') is 0 then 'preloadStringRenderer' else 'preload'

  compile : (data, path, callback) ->
    
    config = 
        filename   : path
        version    : @options.version
        normalizer : (filename) =>
          return syspath.relative(@options.basePath + '/app', filename)

    compiler.compile config, (error, out, compiled) ->
        if error
          callback error
        else
          result = 'module.exports = can.view.preloadStringRenderer("' + compiled.id + '",' + out + ');'
          callback null, result



    