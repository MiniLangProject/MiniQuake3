# `mq3.renderer.tr_sky.StageResult`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-sky-ml-1241105341.md)

<a id="struct-struct-mq3-renderer-tr-sky-stageresult-struct-stageresult-src-mq3-renderer-tr-sky-ml-2058272099"></a>
## StageResult

```ml
struct StageResult
```

Data record for `mq3.renderer.tr_sky.StageResult`; groups `skybox`, `clouds`, `sun`, `skyRendered`, `depthMin`, `depthMax`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_sky.ml#L82)

## Members

<a id="field-field-mq3-renderer-tr-sky-stageresult-clouds-clouds-src-mq3-renderer-tr-sky-ml-1003183948"></a>
### clouds

```ml
clouds
```

Cloud-layer geometry prepared for the current view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_sky.ml#L86)

<a id="field-field-mq3-renderer-tr-sky-stageresult-depthmax-depthmax-src-mq3-renderer-tr-sky-ml-1030315290"></a>
### depthMax

```ml
depthMax
```

Upper bound of the depth range used by this rendering pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_sky.ml#L94)

<a id="field-field-mq3-renderer-tr-sky-stageresult-depthmin-depthmin-src-mq3-renderer-tr-sky-ml-308098414"></a>
### depthMin

```ml
depthMin
```

Lower bound of the depth range used by this rendering pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_sky.ml#L92)

<a id="field-field-mq3-renderer-tr-sky-stageresult-skybox-skybox-src-mq3-renderer-tr-sky-ml-1791152220"></a>
### skybox

```ml
skybox
```

Skybox geometry prepared for the current view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_sky.ml#L84)

<a id="field-field-mq3-renderer-tr-sky-stageresult-skyrendered-skyrendered-src-mq3-renderer-tr-sky-ml-1986158048"></a>
### skyRendered

```ml
skyRendered
```

Whether sky geometry was emitted for this shader stage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_sky.ml#L90)

<a id="field-field-mq3-renderer-tr-sky-stageresult-sun-sun-src-mq3-renderer-tr-sky-ml-580876372"></a>
### sun

```ml
sun
```

Sun geometry prepared for the current view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_sky.ml#L88)
