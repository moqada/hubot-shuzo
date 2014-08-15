# Description:
#   暑くなければ夏じゃない。熱くなければ人生じゃない！
#
# Configuration:
#   HUBOT_SHUZO_WORDS - 修造が反応する言葉の正規表現
#
# Commands:
#   <修造が反応する言葉> - 修造画像をランダムに返す
#
# Author:
#   moqada

images = require '../data/images.json'
pattern = process.env.HUBOT_SHUZO_WORDS or '(無理|むり|ムリ)|(でき|出来)(ない|ません|ん)'
regex = new RegExp pattern, 'i'

module.exports = (robot) ->
  robot.hear regex, (msg) ->
    msg.reply msg.random images
