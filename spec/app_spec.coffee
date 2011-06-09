vows = require('vows')
assert = require('assert')
sinon = require('sinon')
App = require('../public/app.js')

vows.describe('App').addBatch(
  'in some context' :
    topic: App

    'does something' : ->
      assert.fail("replace this!")
      
).export module