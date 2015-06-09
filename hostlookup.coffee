# Description:
#   Execute hostname lookup
#
# Dependencies:
#   None
#
# Configuration
#   None
#
# Commands:
#   hubot host lookup <hostname/url> (requires devop role)
#
# Author:
#   Rick Trotter
#   Rick@GingerCoder.com
#

module.exports = (robot) ->
  robot.respond /host lookup (.*)$/i, (msg) ->
    if robot.auth.hasRole(msg.envelope.user, "devop")
      hostname = msg.match[1]
      @exec = require('child_process').exec
      command = "host #{hostname}"

      msg.send "Looking up #{hostname}..."
      @exec command, (error, stdout, stderr) ->
        msg.send error
        msg.send stdout
        msg.send stderr
    else
      msg.send "Sorry, you are not a devop, you can't use that command"
