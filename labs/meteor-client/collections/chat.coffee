Meteor.methods
  addChatToCollection: (meetingId, messageObject) ->
    # manually convert time from 1.408645053653E12 to 1408645053653 if necessary (this is the time_from that the Flash client outputs)
    messageObject.from_time = (messageObject.from_time).toString().split('.').join("").split("E")[0]
    entry =
      meetingId: meetingId
      message:
        chat_type: messageObject.chat_type
        message: messageObject.message
        to_username: messageObject.to_username
        from_tz_offset: messageObject.from_tz_offset
        from_color: messageObject.from_color
        to_userid: messageObject.to_userid
        from_userid: messageObject.from_userid
        from_time: messageObject.from_time
        from_username: messageObject.from_username
        from_lang: messageObject.from_lang

    id = Meteor.Chat.insert(entry)
    console.log "added chat id=[#{id}]:#{messageObject.message}. Chat.size is now
     #{Meteor.Chat.find({meetingId: meetingId}).count()}"

  sendChatMessagetoServer: (meetingId, messageObject) ->
    Meteor.call "publishChatMessage", meetingId, messageObject
