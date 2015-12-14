backend = require '../common/backend'

errorHandler = (messageResponse) ->
  (err, errCode) -> messageResponse.reply("Error #{errCode}")

module.exports.addMood = (robot, messageResponse, mood, description) ->
  data = {
    userName: messageResponse.message.user.name,
    userId: messageResponse.message.user.id,
    mood: mood,
    description: description?.trim(),
  }

  successHandler = (successBody) ->
    jsonBody = JSON.parse(successBody)
    messageResponse.reply("Trzymaj się @#{messageResponse.message.user.name}, do jutra.")

  backend.post("/rest/mood", data, robot, successHandler, errorHandler(messageResponse))
