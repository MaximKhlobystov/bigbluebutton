Template.footer.helpers
	getFooterString: ->
		# info = Meteor.call('getServerInfo')
		year = "YEAR" #info.getBuildYear()
		month = "MONTH" #info.getBuildMonth()
		day = "DAY" #info.getBuildDay()
		# version = "VERSION_XXXX" #info.getBuildVersion()
		version = getInSession "bbbServerVersion"
		copyrightYear = (new Date()).getFullYear()
		link = "<a href='http://bigbluebutton.org/' target='_blank'>http://bigbluebutton.org</a>"
		foot = "(c) #{copyrightYear} BigBlueButton Inc. [build #{version}-#{year}-#{month}-#{day}] - For more information visit #{link}"

Template.header.events
	"click .usersListIcon": (event) ->
		toggleUsersList()
	"click .chatBarIcon": (event) ->
		toggleChatbar()
	"click .videoFeedIcon": (event) ->
		toggleCam @ 
	"click .audioFeedIcon": (event) ->
		toggleVoiceCall @
	"click .muteIcon": (event) ->
		toggleMic @
	"click .signOutIcon": (event) ->
		userLogout getInSession("meetingId"), getInSession("userId"), true
	"click .hideNavbarIcon": (event) ->
		toggleNavbar()
	# "click .settingsIcon": (event) ->
	# 	alert "settings"
	"click .raiseHand": (event) ->
		Meteor.call('userRaiseHand', getInSession("meetingId"), getInSession("userId"))
	"click .lowerHand": (event) ->
		# loweredBy = @id # TODO! this must be the userid of the person lowering the hand - instructor/student
		loweredBy = getInSession("userId")
		Meteor.call('userLowerHand', getInSession("meetingId"), getInSession("userId"), loweredBy)
	"click .whiteboardIcon": (event) ->
		toggleWhiteBoard()
	"mouseover #navbarMinimizedButton": (event) ->
		$("#navbarMinimizedButton").removeClass("navbarMinimizedButtonSmall")
		$("#navbarMinimizedButton").addClass("navbarMinimizedButtonLarge")
	"mouseout #navbarMinimizedButton": (event) ->
		$("#navbarMinimizedButton").removeClass("navbarMinimizedButtonLarge")
		$("#navbarMinimizedButton").addClass("navbarMinimizedButtonSmall")

Template.recordingStatus.rendered = ->
	$('button[rel=tooltip]').tooltip()

Template.main.helpers
	setTitle: ->
		document.title = "BigBlueButton HTML5"

Template.makeButton.rendered = ->
	$('button[rel=tooltip]').tooltip()

# These settings can just be stored locally in session, created at start up
Meteor.startup ->
	@SessionAmplify = _.extend({}, Session,
	  keys: _.object(_.map(amplify.store(), (value, key) ->
	    [
	      key
	      JSON.stringify(value)
	    ]
	  ))
	  set: (key, value) ->
	    Session.set.apply this, arguments
	    amplify.store key, value
	    return
	)

	setInSession "display_usersList", true
	setInSession "display_navbar", true
	setInSession "display_chatbar", true
	setInSession "display_whiteboard", true
	setInSession "display_chatPane", true
	setInSession 'inChatWith', "PUBLIC_CHAT"
	setInSession "joinedAt", getTime()
	setInSession "isSharingAudio", false
	setInSession "inChatWith", 'PUBLIC_CHAT'
	setInSession "messageFontSize", 12
	setInSession "isMuted", false
