# `mq3.client.playable_fps_title.State`

[Home](README.md) · [Source file](File-src-mq3-client-playable-fps-title-ml-173965588.md)

<a id="struct-struct-mq3-client-playable-fps-title-state-struct-state-src-mq3-client-playable-fps-title-ml-1731316497"></a>
## State

```ml
struct State
```

Stores playable FPS title state, including `mapName`, `sampleStart`, `frameCount`, `smoothedFps`, `initialized`, `lastTime` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_fps_title.ml#L10)

## Members

<a id="field-field-mq3-client-playable-fps-title-state-currenttitle-currenttitle-src-mq3-client-playable-fps-title-ml-1799367644"></a>
### currentTitle

```ml
currentTitle
```

When constructing this record, `create` supplies `title(mapName,-1)` for this member. Used by `frame` and `initialTitle` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_fps_title.ml#L29)

<a id="field-field-mq3-client-playable-fps-title-state-framecount-framecount-src-mq3-client-playable-fps-title-ml-2115875738"></a>
### frameCount

```ml
frameCount
```

When constructing this record, `create` supplies `0` for this member. Used by `frame` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_fps_title.ml#L18)

<a id="field-field-mq3-client-playable-fps-title-state-initialized-initialized-src-mq3-client-playable-fps-title-ml-1606437378"></a>
### initialized

```ml
initialized
```

True after the first FPS measurement seeds the smoothed estimate shown in the window title.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_fps_title.ml#L23)

<a id="field-field-mq3-client-playable-fps-title-state-lasttime-lasttime-src-mq3-client-playable-fps-title-ml-2088226284"></a>
### lastTime

```ml
lastTime
```

When constructing this record, `create` supplies `now` for this member. Used by `frame` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_fps_title.ml#L26)

<a id="field-field-mq3-client-playable-fps-title-state-mapname-mapname-src-mq3-client-playable-fps-title-ml-1526099994"></a>
### mapName

```ml
mapName
```

Map identifier included in the playable window title beside the current FPS estimate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_fps_title.ml#L12)

<a id="field-field-mq3-client-playable-fps-title-state-samplestart-samplestart-src-mq3-client-playable-fps-title-ml-1550706482"></a>
### sampleStart

```ml
sampleStart
```

When constructing this record, `create` supplies `now` for this member. Used by `frame` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_fps_title.ml#L15)

<a id="field-field-mq3-client-playable-fps-title-state-smoothedfps-smoothedfps-src-mq3-client-playable-fps-title-ml-1578243714"></a>
### smoothedFps

```ml
smoothedFps
```

When constructing this record, `create` supplies `0` for this member. Used by `frame` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_fps_title.ml#L21)
