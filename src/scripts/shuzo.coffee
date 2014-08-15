# Description:
#   暑くなければ夏じゃない。熱くなければ人生じゃない！
#
# Commands:
#   <無理|むり|ムリ> - 修造画像をランダムに返す
#
# Author:
#   moqada

images = require '../data/images.json'

module.exports = (robot) ->
  robot.hear /(無理|むり|ムリ)/i, (msg) ->
    msg.reply msg.random images
