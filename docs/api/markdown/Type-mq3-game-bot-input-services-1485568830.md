# `mq3.game.bot_input.Services`

[Home](README.md) · [Source file](File-src-mq3-game-bot-input-ml-1155152552.md)

<a id="struct-struct-mq3-game-bot-input-services-struct-services-src-mq3-game-bot-input-ml-363560283"></a>
## Services

```ml
struct Services
```

`Services` record for bot input, containing `challenge`, `characteristicFloatFn`, `viewFn`, `getInputFn` and `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L93)

## Members

<a id="field-field-mq3-game-bot-input-services-challenge-challenge-src-mq3-game-bot-input-ml-1695061873"></a>
### challenge

```ml
challenge
```

Connection challenge value associated with the client session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L95)

<a id="field-field-mq3-game-bot-input-services-characteristicfloatfn-characteristicfloatfn-src-mq3-game-bot-input-ml-100785"></a>
### characteristicFloatFn

```ml
characteristicFloatFn
```

Injected callback for characteristic float; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L97)

<a id="field-field-mq3-game-bot-input-services-context-context-src-mq3-game-bot-input-ml-1038124377"></a>
### context

```ml
context
```

Opaque caller-supplied context available to bot characteristic, view-angle, and elementary-input callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L104)

<a id="field-field-mq3-game-bot-input-services-getinputfn-getinputfn-src-mq3-game-bot-input-ml-1406539157"></a>
### getInputFn

```ml
getInputFn
```

Injected callback for get input; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L101)

<a id="field-field-mq3-game-bot-input-services-viewfn-viewfn-src-mq3-game-bot-input-ml-1204987055"></a>
### viewFn

```ml
viewFn
```

Injected callback for view; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_input.ml#L99)
