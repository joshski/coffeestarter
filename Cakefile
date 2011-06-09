CoffeeScript = require 'coffee-script'
{exec} = require 'child_process'
fs = require 'fs'

SOURCES  = [
  "app"
]

task 'compile', 'Compile src/*.coffee into public/app.js ', ->
  compile()

task 'spec', 'Run vows specs', ->
  execOut 'vows spec/*.coffee'

task 'server', 'Start a web server to host the static application', ->
  execOut 'coffee server.coffee'
  
task 'watch', 'Compile and run specs (for watchr)', ->
  invoke 'build'

task 'build', 'Compile, then run specs', ->
  invoke 'compile'
  invoke 'spec'

compile = =>
  compileApp (scripts) ->
    writeAppJavaScript scripts  

writeAppJavaScript = (scripts) ->
  fs.writeFile 'public/app.js', scripts.join('\n\n'), 'utf8', (err) ->
    throw err if err
  console.log "> compiled public/app.js"

compileApp = (withCompiledScripts) ->
  compiledCoffee = new Array
  for file, index in SOURCES then do (file, index) ->
    fs.readFile "src/#{file}.coffee", 'utf8', (err, coffee) ->
      throw err if err
      compiledCoffee.push CoffeeScript.compile(coffee)
      withCompiledScripts(compiledCoffee) if compiledCoffee.length == SOURCES.length

execOut = (commandLine) ->
  exec(commandLine, (err, stdout, stderr) ->
    console.log("> #{commandLine}")
    console.log(stdout)
    console.log(stderr)
  )
