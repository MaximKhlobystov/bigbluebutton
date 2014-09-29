# # Global configurations file

config = {}

# Default global variables
config.appName = 'BigBlueButton HTML5 Client'
config.maxUsernameLength = 30
config.maxChatLength = 140

## Application configurations
config.app = {}

# Generate a new secret with:
# $ npm install crypto
# $ coffee
# coffee> crypto = require 'crypto'
# coffee> crypto.randomBytes(32).toString('base64')
config.app.sessionSecret = "J7XSu96KC/B/UPyeGub3J6w6QFXWoUNABVgi9Q1LskE="

# Configs for redis
config.redis = {}
config.redis.host = "127.0.0.1"
config.redis.post = "6379"
config.redis.timeout = 5000
config.redis.channels = {}
config.redis.channels.fromBBBApps = "bigbluebutton:from-bbb-apps:*"
config.redis.channels.toBBBApps = {}
config.redis.channels.toBBBApps.pattern = "bigbluebutton:to-bbb-apps:*"
config.redis.channels.toBBBApps.chat = "bigbluebutton:to-bbb-apps:chat"
config.redis.channels.toBBBApps.meeting = "bigbluebutton:to-bbb-apps:meeting"
config.redis.channels.toBBBApps.users = "bigbluebutton:to-bbb-apps:users"
config.redis.channels.toBBBApps.voice = "bigbluebutton:to-bbb-apps:voice"
config.redis.channels.toBBBApps.whiteboard = "bigbluebutton:to-bbb-apps:whiteboard"
config.redis.channels.toBBBApps.presentation = "bigbluebutton:to-bbb-apps:presentation"

# Logging
config.log = {}

config.log.path = if process?.env?.NODE_ENV is "production"
  "/var/log/bigbluebutton/bbbnode.log"
else
  "./log/development.log"

# Global instance of Modules, created by `app.coffee`
config.modules = null


Meteor.config = config
