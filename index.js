'use strict'
exports.topics = [
  {name: 'compose', description: 'topic for oprate compose mongodb'},
]

exports.commands = [
  require('./commands/compose/dump.js')
]
