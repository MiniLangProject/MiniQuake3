# `mq3.botlib.be_ai_move.MoverInfo`

[Home](README.md) · [Source file](File-src-mq3-botlib-be-ai-move-ml-1287990866.md)

<a id="struct-struct-mq3-botlib-be-ai-move-moverinfo-struct-moverinfo-src-mq3-botlib-be-ai-move-ml-1534535233"></a>
## MoverInfo

```ml
struct MoverInfo
```

`MoverInfo` record for be ai move, containing `mins`, `maxs`, `origin` and `currentOrigin`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L41)

## Members

<a id="field-field-mq3-botlib-be-ai-move-moverinfo-currentorigin-currentorigin-src-mq3-botlib-be-ai-move-ml-1831226514"></a>
### currentOrigin

```ml
currentOrigin
```

Current world-space position used for collision and mover queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L49)

<a id="field-field-mq3-botlib-be-ai-move-moverinfo-maxs-maxs-src-mq3-botlib-be-ai-move-ml-905612512"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of the moving brush model in its local coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L45)

<a id="field-field-mq3-botlib-be-ai-move-moverinfo-mins-mins-src-mq3-botlib-be-ai-move-ml-231092548"></a>
### mins

```ml
mins
```

Minimum XYZ corner of the moving brush model in its local coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L43)

<a id="field-field-mq3-botlib-be-ai-move-moverinfo-origin-origin-src-mq3-botlib-be-ai-move-ml-279750006"></a>
### origin

```ml
origin
```

Reference origin supplied with the moving brush model geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L47)
