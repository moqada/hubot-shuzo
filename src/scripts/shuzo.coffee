# Description:
#   暑くなければ夏じゃない。熱くなければ人生じゃない！
#
# Configuration:
#   HUBOT_SHUZO_WORDS - 修造が反応する言葉の正規表現
#   HUBOT_SHUZO_EXCLUDE_ROOMS- 修造が反応しないルームリスト
#   HUBOT_SHUZO_DISABLE_MINUTES - shuzo disable で修造が反応しない時間
#
# Commands:
#   <修造が反応する言葉> - 修造画像をランダムに返す
#   hubot shuzo disable - 修造を一定時間黙らせる
#
# Author:
#   moqada

images = require '../data/images.json'
pattern = process.env.HUBOT_SHUZO_WORDS or '(無理|むり|ムリ)|(でき|出来)(ない|ません|ん)'
disableMinutes = parseInt(process.env.HUBOT_SHUZO_DISABLE_MINUTES or 15)
excludeRooms = (process.env.HUBOT_SHUZO_EXCLUDE_ROOMS or '').split(',')
regex = new RegExp pattern, 'i'

module.exports = (robot) ->
  timerID = null

  robot.hear regex, (msg) ->
    if timerID or msg.message.room in excludeRooms
      return
    msg.reply msg.random images

  robot.respond /shuzo disable/i, (msg) ->
    if timerID
      clearTimeout timerID
    timerID = setTimeout ->
      timerID = null
    , disableMinutes * 60 * 1000
    msg.send "#{disableMinutes}分、黙るぞ！"
