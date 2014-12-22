# Description:
#   暑くなければ夏じゃない。熱くなければ人生じゃない！
#
# Configuration:
#   HUBOT_SHUZO_WORDS - 修造が反応する言葉の正規表現
#   HUBOT_SHUZO_EXCLUDE_ROOMS- 修造が反応しないルームリスト
#
# Commands:
#   <修造が反応する言葉> - 修造画像をランダムに返す
#
# Author:
#   moqada

images = require '../data/images.json'
pattern = process.env.HUBOT_SHUZO_WORDS or '(無理|むり|ムリ)|(でき|出来)(ない|ません|ん)'
excludeRooms = (process.env.HUBOT_SHUZO_EXCLUDE_ROOMS or '').split(',')
regex = new RegExp pattern, 'i'

module.exports = (robot) ->
  robot.hear regex, (msg) ->
    if msg.message.room in excludeRooms
      return
    msg.reply msg.random images
