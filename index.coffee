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
    
    options = 
        filename   : path
        version    : '1.1.2'
        normalizer : (filename) =>
          return syspath.relative(@basePath + '/app', filename)

    compiler.compile options, (error, out, compiled) ->
        if error
          callback error
        else
          callback null,  'module.exports = can.view.preloadStringRenderer("' + compiled.id + '",' + out + ');'


  # compile: (data, path, callback) ->
  #   console.log data, path
  #   try
  #     # source = "can.stache(#{handlebars.compile(data)})"
  #     # source = "can.stache(#{handlebars.compile(data)})"

  #     result = umd "can.mustache(unescape(\"" + escape(data) + "\"))"
  #   catch e
  #     error = e
    
  #   if error
  #     callback error
  #   else
  #     callback null, result

  # onCompile : (files) ->
  #   console.log @config
  #   basePath = path.resolve(@config.paths.root)
  #   fullPath = basePath + '/' + files[0].path

  #   files = []
  #   files = globsync.glob('app/tpls/*.mustache')

  #   compiler files,
  #     version: '2.1.0'
  #     normalizer: (filename) -> 
  #         return path.relative(basePath + '/app', filename)
  #   , (err, output, outfile) ->
  #     if err
  #       console.error('There was an error: ' + err.message)
  #     else
  #       fs.appendFile fullPath, '\n' + output
  #   , null












    