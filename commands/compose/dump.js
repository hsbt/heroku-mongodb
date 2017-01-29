'use strict'

let cli = require('heroku-cli-util')
let co  = require('co')
let mongoUri = require('mongo-uri')
const exec = require('child_process').execSync

function* dump (context, heroku) {
  let config = yield heroku.get(`/apps/${context.app}/config-vars`)
  let source = config.MONGOHQ_URL
  try {
    let uri = mongoUri.parse(source)
    let cmd = `mongodump -h ${uri.hosts[0]} --port ${uri.ports[0]} -u ${uri.username} -p${uri.password} -d ${uri.database} -o ${context.flags.output}`
    //cli.debug(cmd)
    exec(cmd, {stdio:[0,1,2]});
  } catch (err) {
    cli.error(err)
  }
}

module.exports = {
  topic: 'compose',
  command: 'dump',
  needsApp: true,
  needsAuth: true,
  description: 'mongodump for compose mongodb',
  flags: [
    {name: 'output', char: 'o', description: 'destination for output', hasValue: true, required: true}
  ],
  run: cli.command(co.wrap(dump))
}
