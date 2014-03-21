fs = require('fs')
path = require('path')
findsRoot = require('find-root-package')

module.exports =
  initialize: (dir = process.cwd()) ->
    topDir = findsRoot.findTopPackageJson(dir)
    return unless isInstalledAsDependency(dir, topDir)
    ensureProtractorConfigFileExistsRelativeTo(topDir)
    ensureSpecFolderExistRelativeTo(topDir)


isInstalledAsDependency = (dir, topDir) ->
  topDir? && topDir != dir

ensureProtractorConfigFileExistsRelativeTo = (dir) ->
  protractorConfFile = path.join(dir, "config/protractorConf.js")
  return if fs.existsSync(protractorConfFile)
  protractorDefaultConf = fs.readFileSync "protractorConf.js"
  fs.writeFileSync protractorConfFile,  protractorDefaultConf

ensureSpecFolderExistRelativeTo = (dir) ->
  specDir = path.join(dir, "spec-e2e")
  return if fs.existsSync(specDir)
  fs.mkdir(specDir)