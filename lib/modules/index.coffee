# order is important if something needs to effect the config before moving onto the next
# i.e. compilers adding various extensions to config.extensions

compilers = require './compilers'
file =      require './file'
logger =    require 'mimosa-logger'
all = [file, compilers, logger]

pack =      require('../../package.json')

ignore = ['mimosa-logger']
builtIns = ['mimosa-server','mimosa-lint','mimosa-require','mimosa-minify']

meta = []

discoverModules = ->
  for dep, version of pack.dependencies when dep.indexOf('mimosa-') > -1
    continue if ignore.indexOf(dep) > -1
    modPack = require("../../node_modules/#{dep}/package.json")
    meta.push
      name:    dep
      version: modPack.version
      site:    modPack.homepage
      desc:    modPack.description
      default: builtIns.indexOf(dep) > -1
      dependencies: modPack.dependencies
    all.push(require dep)

discoverModules()

module.exports =
  all: all
  basic: [file, compilers]
  metadata: meta
