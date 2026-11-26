# `mq3.client.cinematic_runtime.Clip`

[Home](README.md) · [Source file](File-src-mq3-client-cinematic-runtime-ml-1539162371.md)

<a id="struct-struct-mq3-client-cinematic-runtime-clip-struct-clip-src-mq3-client-cinematic-runtime-ml-676590007"></a>
## Clip

```ml
struct Clip
```

Stores cinematic runtime clip record, including `handle`, `path`, `movie`, `decoder`, `chunkIndex`, `status` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L93)

## Members

<a id="field-field-mq3-client-cinematic-runtime-clip-audioqueue-audioqueue-src-mq3-client-cinematic-runtime-ml-1546616493"></a>
### audioQueue

```ml
audioQueue
```

When constructing this record, `play` supplies `lists.List.withCapacity(16)` for this member. Used by `resetClip` and `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L134)

<a id="field-field-mq3-client-cinematic-runtime-clip-chunkindex-chunkindex-src-mq3-client-cinematic-runtime-ml-715657673"></a>
### chunkIndex

```ml
chunkIndex
```

When constructing this record, `play` supplies `0` for this member. Used by `resetClip` and `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L106)

<a id="field-field-mq3-client-cinematic-runtime-clip-decoder-decoder-src-mq3-client-cinematic-runtime-ml-1604954815"></a>
### decoder

```ml
decoder
```

When constructing this record, `play` supplies `video.create()` for this member. Used by `resetClip` and `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L103)

<a id="field-field-mq3-client-cinematic-runtime-clip-dirty-dirty-src-mq3-client-cinematic-runtime-ml-737273847"></a>
### dirty

```ml
dirty
```

When constructing this record, `play` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L131)

<a id="field-field-mq3-client-cinematic-runtime-clip-extents-extents-src-mq3-client-cinematic-runtime-ml-317978883"></a>
### extents

```ml
extents
```

When constructing this record, `play` supplies `Extents(x,y,width,height)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L117)

<a id="field-field-mq3-client-cinematic-runtime-clip-handle-handle-src-mq3-client-cinematic-runtime-ml-1278583579"></a>
### handle

```ml
handle
```

When constructing this record, `play` supplies `handle` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L95)

<a id="field-field-mq3-client-cinematic-runtime-clip-hold-hold-src-mq3-client-cinematic-runtime-ml-1569570993"></a>
### hold

```ml
hold
```

When constructing this record, `play` supplies `(bits&CIN_HOLD)!=0` for this member. Used by `finishClip` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L123)

<a id="field-field-mq3-client-cinematic-runtime-clip-lasttime-lasttime-src-mq3-client-cinematic-runtime-ml-1681728133"></a>
### lastTime

```ml
lastTime
```

When constructing this record, `play` supplies `now` for this member. Used by `resetClip` and `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L115)

<a id="field-field-mq3-client-cinematic-runtime-clip-looping-looping-src-mq3-client-cinematic-runtime-ml-924210395"></a>
### looping

```ml
looping
```

When constructing this record, `play` supplies `(bits&CIN_LOOP)!=0` for this member. Used by `finishClip` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L120)

<a id="field-field-mq3-client-cinematic-runtime-clip-movie-movie-src-mq3-client-cinematic-runtime-ml-30217787"></a>
### movie

```ml
movie
```

When constructing this record, `play` supplies `movie` for this member. Used by `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L100)

<a id="field-field-mq3-client-cinematic-runtime-clip-path-path-src-mq3-client-cinematic-runtime-ml-1690040101"></a>
### path

```ml
path
```

When constructing this record, `play` supplies `path` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L97)

<a id="field-field-mq3-client-cinematic-runtime-clip-shader-shader-src-mq3-client-cinematic-runtime-ml-897020073"></a>
### shader

```ml
shader
```

True when CIN_SHADER was enabled for this clip, selecting texture playback and its intermittent-update timing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L129)

<a id="field-field-mq3-client-cinematic-runtime-clip-silent-silent-src-mq3-client-cinematic-runtime-ml-1103219661"></a>
### silent

```ml
silent
```

When constructing this record, `play` supplies `(bits&CIN_SILENT)!=0` for this member. Used by `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L126)

<a id="field-field-mq3-client-cinematic-runtime-clip-starttime-starttime-src-mq3-client-cinematic-runtime-ml-1670345823"></a>
### startTime

```ml
startTime
```

When constructing this record, `play` supplies `now` for this member. Used by `resetClip` and `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L112)

<a id="field-field-mq3-client-cinematic-runtime-clip-status-status-src-mq3-client-cinematic-runtime-ml-204477263"></a>
### status

```ml
status
```

When constructing this record, `play` supplies `FMV_PLAY` for this member. Used by `resetClip` and `finishClip` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cinematic_runtime.ml#L109)
