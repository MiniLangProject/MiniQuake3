# `mq3.client.cgame_draw.TraceResult`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-draw-ml-658265827.md)

<a id="struct-struct-mq3-client-cgame-draw-traceresult-struct-traceresult-src-mq3-client-cgame-draw-ml-499688373"></a>
## TraceResult

```ml
struct TraceResult
```

Stores client game draw trace result record, including `entityNum`, `fog`, `invisible`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L155)

## Members

<a id="field-field-mq3-client-cgame-draw-traceresult-entitynum-entitynum-src-mq3-client-cgame-draw-ml-1374261841"></a>
### entityNum

```ml
entityNum
```

Entity identifier hit by the crosshair trace, used to select a player-name display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L157)

<a id="field-field-mq3-client-cgame-draw-traceresult-fog-fog-src-mq3-client-cgame-draw-ml-578115721"></a>
### fog

```ml
fog
```

True when fog obscures the crosshair trace and player-name identification should be suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L159)

<a id="field-field-mq3-client-cgame-draw-traceresult-invisible-invisible-src-mq3-client-cgame-draw-ml-409244557"></a>
### invisible

```ml
invisible
```

True when the traced entity is invisible and should not reveal its player name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_draw.ml#L161)
