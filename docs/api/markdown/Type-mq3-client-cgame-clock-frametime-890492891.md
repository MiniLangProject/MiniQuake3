# `mq3.client.cgame_clock.FrameTime`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-clock-ml-1618125963.md)

<a id="struct-struct-mq3-client-cgame-clock-frametime-struct-frametime-src-mq3-client-cgame-clock-ml-1856702089"></a>
## FrameTime

```ml
struct FrameTime
```

Stores client game clock frame time record, including `draw`, `serverTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_clock.ml#L18)

## Members

<a id="field-field-mq3-client-cgame-clock-frametime-draw-draw-src-mq3-client-cgame-clock-ml-862873167"></a>
### draw

```ml
draw
```

When constructing this record, `frame` supplies `draw` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_clock.ml#L20)

<a id="field-field-mq3-client-cgame-clock-frametime-servertime-servertime-src-mq3-client-cgame-clock-ml-626682711"></a>
### serverTime

```ml
serverTime
```

Synchronized server-domain presentation timestamp in milliseconds returned for the client-game frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_clock.ml#L23)
