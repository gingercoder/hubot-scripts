# Description:
#   Nmap a specific host,ip or url
#
# Dependencies:
#   None
#
# Configuration
#   None
#
# Commands:
#   hubot nmap <hostname/ip/url> (requires devop role)
#
# Author:
#   Rick Trotter
#   Rick@GingerCoder.com
#

module.exports = (robot) ->
  robot.respond /nmap (.*)$/i, (msg) ->
    if robot.auth.hasRole(msg.envelope.user, "devop")
      hostname = msg.match[1]
      @exec = require('child_process').exec
      command = "nmap #{hostname}"

      @exec command, (error, stdout, stderr) ->
        msg.send error
        msg.send stdout
        msg.send stderr
    else
      msg.send "Sorry, you are not a devop, you can't use that command"
