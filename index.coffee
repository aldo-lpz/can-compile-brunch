fs      = require 'fs'
can     = require 'can-compile'
syspath = require 'path'

module.exports = class CanCompile
  brunchPlugin : yes
  type         : 'template'
  extension    : 'mustache'
  pattern      : /\.(?:mustache|stache)$/
  options      : {}

  constructor: (@config) ->
    @options =
      version  : @config.plugins.canCompile.version or '2.1.3'
      basePath : syspath.resolve @config.paths.root

    @options.preloadType = if @options.version.indexOf('2.1') is 0 then 'preloadStringRenderer' else 'preload'

  compile : (data, path, callback) ->
    
    config = 
        filename   : path
        version    : @options.version
        normalizer : (filename) =>
          return syspath.relative @options.basePath + '/app', filename

    can.compile config, (error, out, compiled) =>
        if error
          callback error
        else
          callback null, "module.exports = can.view.#{@options.preloadType}(#{compiled.id}, #{out});"



    