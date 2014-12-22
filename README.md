# hubot-shuzo

暑くなければ夏じゃない。熱くなければ人生じゃない！

## Installation

1. `moqada/hubot-shuzo` を package.json に追加
2. "hubot-shuzo" を external-scripts.json に追加
4. Reboot Hubot

## Configuration:

**HUBOT_SHUZO_WORDS**

修造が反応するワードの正規表現

**HUBOT_SHUZO_EXCLUDE_ROOMS**

修造が反応しないルームリスト。カンマ区切りで複数指定

**HUBOT_SHUZO_DISABLE_MINUTES**

`shuzo disable` で修造が反応しない時間

## Commands

```
<修造が反応するワード> - 修造画像をランダムに返す
hubot shuzo disable - 修造を一定時間黙らせる
```
