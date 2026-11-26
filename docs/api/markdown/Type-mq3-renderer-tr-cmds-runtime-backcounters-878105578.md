# `mq3.renderer.tr_cmds_runtime.BackCounters`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-cmds-runtime-ml-2143950218.md)

<a id="struct-struct-mq3-renderer-tr-cmds-runtime-backcounters-struct-backcounters-src-mq3-renderer-tr-cmds-runtime-ml-1790127523"></a>
## BackCounters

```ml
struct BackCounters
```

Data record for `mq3.renderer.tr_cmds_runtime.BackCounters`; groups `shaders`, `surfaces`, `vertexes`, `indexes`, `totalIndexes`, `overDraw`, and 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L55)

## Members

<a id="field-field-mq3-renderer-tr-cmds-runtime-backcounters-dlightindexes-dlightindexes-src-mq3-renderer-tr-cmds-runtime-ml-1498721015"></a>
### dlightIndexes

```ml
dlightIndexes
```

Number of indices submitted by dynamic-light passes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L71)

<a id="field-field-mq3-renderer-tr-cmds-runtime-backcounters-dlightvertexes-dlightvertexes-src-mq3-renderer-tr-cmds-runtime-ml-1010956355"></a>
### dlightVertexes

```ml
dlightVertexes
```

Number of vertices processed by dynamic-light passes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L69)

<a id="field-field-mq3-renderer-tr-cmds-runtime-backcounters-flareadds-flareadds-src-mq3-renderer-tr-cmds-runtime-ml-961120415"></a>
### flareAdds

```ml
flareAdds
```

Number of flare additions recorded for the frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L73)

<a id="field-field-mq3-renderer-tr-cmds-runtime-backcounters-flarerenders-flarerenders-src-mq3-renderer-tr-cmds-runtime-ml-445986505"></a>
### flareRenders

```ml
flareRenders
```

Number of flares drawn during the frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L77)

<a id="field-field-mq3-renderer-tr-cmds-runtime-backcounters-flaretests-flaretests-src-mq3-renderer-tr-cmds-runtime-ml-2087094509"></a>
### flareTests

```ml
flareTests
```

Number of flare visibility tests performed for the frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L75)

<a id="field-field-mq3-renderer-tr-cmds-runtime-backcounters-imagebytes-imagebytes-src-mq3-renderer-tr-cmds-runtime-ml-1258157459"></a>
### imageBytes

```ml
imageBytes
```

Number of bytes occupied by the image data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L81)

<a id="field-field-mq3-renderer-tr-cmds-runtime-backcounters-indexes-indexes-src-mq3-renderer-tr-cmds-runtime-ml-1385985547"></a>
### indexes

```ml
indexes
```

Number of indices processed by the backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L63)

<a id="field-field-mq3-renderer-tr-cmds-runtime-backcounters-msec-msec-src-mq3-renderer-tr-cmds-runtime-ml-1832249159"></a>
### msec

```ml
msec
```

Elapsed duration of the operation or frame, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L79)

<a id="field-field-mq3-renderer-tr-cmds-runtime-backcounters-overdraw-overdraw-src-mq3-renderer-tr-cmds-runtime-ml-724522619"></a>
### overDraw

```ml
overDraw
```

Accumulated overdraw measurement for the rendered frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L67)

<a id="field-field-mq3-renderer-tr-cmds-runtime-backcounters-shaders-shaders-src-mq3-renderer-tr-cmds-runtime-ml-301870499"></a>
### shaders

```ml
shaders
```

Number of shader batches processed by the backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L57)

<a id="field-field-mq3-renderer-tr-cmds-runtime-backcounters-surfaces-surfaces-src-mq3-renderer-tr-cmds-runtime-ml-494173667"></a>
### surfaces

```ml
surfaces
```

Number of surfaces processed by the backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L59)

<a id="field-field-mq3-renderer-tr-cmds-runtime-backcounters-totalindexes-totalindexes-src-mq3-renderer-tr-cmds-runtime-ml-1041266203"></a>
### totalIndexes

```ml
totalIndexes
```

Total number of indices processed across all material passes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L65)

<a id="field-field-mq3-renderer-tr-cmds-runtime-backcounters-vertexes-vertexes-src-mq3-renderer-tr-cmds-runtime-ml-863323259"></a>
### vertexes

```ml
vertexes
```

Number of vertices processed by the backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L61)
