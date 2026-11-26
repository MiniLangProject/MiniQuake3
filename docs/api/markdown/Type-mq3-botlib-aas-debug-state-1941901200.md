# `mq3.botlib.aas_debug.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-debug-ml-718446593.md)

<a id="struct-struct-mq3-botlib-aas-debug-state-struct-state-src-mq3-botlib-aas-debug-ml-2063410595"></a>
## State

```ml
struct State
```

`State` record for aas debug, containing `lines`, `visible`, `polygons`, `numDebugLines` and `nextLine` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L178)

## Members

<a id="field-field-mq3-botlib-aas-debug-state-actions-actions-src-mq3-botlib-aas-debug-ml-841251946"></a>
### actions

```ml
actions
```

Recorded debug drawing requests, including line and polygon handles and geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L200)

<a id="field-field-mq3-botlib-aas-debug-state-lastareanum-lastareanum-src-mq3-botlib-aas-debug-ml-1420867102"></a>
### lastAreaNum

```ml
lastAreaNum
```

Last area the bot was in.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L194)

<a id="field-field-mq3-botlib-aas-debug-state-lasttime-lasttime-src-mq3-botlib-aas-debug-ml-1849320712"></a>
### lastTime

```ml
lastTime
```

Timestamp retained for pacing debug reachability display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L196)

<a id="field-field-mq3-botlib-aas-debug-state-lines-lines-src-mq3-botlib-aas-debug-ml-2004032450"></a>
### lines

```ml
lines
```

Allocated navigation debug-line records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L180)

<a id="field-field-mq3-botlib-aas-debug-state-nextline-nextline-src-mq3-botlib-aas-debug-ml-1136709420"></a>
### nextLine

```ml
nextLine
```

Identifier assigned to the next debug line.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L188)

<a id="field-field-mq3-botlib-aas-debug-state-nextpolygon-nextpolygon-src-mq3-botlib-aas-debug-ml-1792643466"></a>
### nextPolygon

```ml
nextPolygon
```

Identifier assigned to the next debug polygon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L190)

<a id="field-field-mq3-botlib-aas-debug-state-numdebuglines-numdebuglines-src-mq3-botlib-aas-debug-ml-634310982"></a>
### numDebugLines

```ml
numDebugLines
```

Number of debug lines represented by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L186)

<a id="field-field-mq3-botlib-aas-debug-state-polygons-polygons-src-mq3-botlib-aas-debug-ml-2133337136"></a>
### polygons

```ml
polygons
```

Allocated navigation debug-polygon records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L184)

<a id="field-field-mq3-botlib-aas-debug-state-reach-reach-src-mq3-botlib-aas-debug-ml-1231984718"></a>
### reach

```ml
reach
```

Reachability currently selected for debug drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L198)

<a id="field-field-mq3-botlib-aas-debug-state-reachindex-reachindex-src-mq3-botlib-aas-debug-ml-1173576628"></a>
### reachIndex

```ml
reachIndex
```

Current reachability position used by interactive debug iteration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L192)

<a id="field-field-mq3-botlib-aas-debug-state-retailactive-retailactive-src-mq3-botlib-aas-debug-ml-2118936124"></a>
### retailActive

```ml
retailActive
```

Indicates whether the host-backed retail-compatible runtime path is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L202)

<a id="field-field-mq3-botlib-aas-debug-state-visible-visible-src-mq3-botlib-aas-debug-ml-547954134"></a>
### visible

```ml
visible
```

Visibility state of the managed debug primitives.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L182)
