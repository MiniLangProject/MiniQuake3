# `mq3.client.cgame_marks.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-marks-ml-1111050399.md)

<a id="struct-struct-mq3-client-cgame-marks-state-struct-state-src-mq3-client-cgame-marks-ml-1118776043"></a>
## State

```ml
struct State
```

Stores client game marks state, including `capacity`, `marks`, `free`, `active`, `time`, `addMarks` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L87)

## Members

<a id="field-field-mq3-client-cgame-marks-state-actions-actions-src-mq3-client-cgame-marks-ml-1913709870"></a>
### actions

```ml
actions
```

Host requests queued while projecting impact decals and submitting their fading polygons, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L110)

<a id="field-field-mq3-client-cgame-marks-state-active-active-src-mq3-client-cgame-marks-ml-521683874"></a>
### active

```ml
active
```

Indices of live mark polygons, ordered for rendering, expiration, and oldest-mark eviction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L97)

<a id="field-field-mq3-client-cgame-marks-state-addmarks-addmarks-src-mq3-client-cgame-marks-ml-1097514932"></a>
### addMarks

```ml
addMarks
```

When constructing this record, `create` supplies `true` for this member. Used by `impactMark` and `addMarks` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L102)

<a id="field-field-mq3-client-cgame-marks-state-allocated-allocated-src-mq3-client-cgame-marks-ml-1723171478"></a>
### allocated

```ml
allocated
```

When constructing this record, `create` supplies `0` for this member. Used by `initMarkPolys` and `allocMark` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L122)

<a id="field-field-mq3-client-cgame-marks-state-capacity-capacity-src-mq3-client-cgame-marks-ml-1047802254"></a>
### capacity

```ml
capacity
```

Maximum number of entries or allocation units supported by the bounded storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L89)

<a id="field-field-mq3-client-cgame-marks-state-energymarkshader-energymarkshader-src-mq3-client-cgame-marks-ml-1535982730"></a>
### energyMarkShader

```ml
energyMarkShader
```

Shader resource selected for energy mark rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L107)

<a id="field-field-mq3-client-cgame-marks-state-errors-errors-src-mq3-client-cgame-marks-ml-1343067960"></a>
### errors

```ml
errors
```

Diagnostic messages collected while parsing or processing the input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L130)

<a id="field-field-mq3-client-cgame-marks-state-evicted-evicted-src-mq3-client-cgame-marks-ml-421953842"></a>
### evicted

```ml
evicted
```

When constructing this record, `create` supplies `0` for this member. Used by `initMarkPolys` and `allocMark` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L128)

<a id="field-field-mq3-client-cgame-marks-state-free-free-src-mq3-client-cgame-marks-ml-641146602"></a>
### free

```ml
free
```

When constructing this record, `create` supplies an empty list for this member. Used by `initMarkPolys` and `freeMarkPoly` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L95)

<a id="field-field-mq3-client-cgame-marks-state-freed-freed-src-mq3-client-cgame-marks-ml-1816184130"></a>
### freed

```ml
freed
```

When constructing this record, `create` supplies `0` for this member. Used by `initMarkPolys` and `freeMarkPoly` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L125)

<a id="field-field-mq3-client-cgame-marks-state-marks-marks-src-mq3-client-cgame-marks-ml-1748540354"></a>
### marks

```ml
marks
```

When constructing this record, `create` supplies an empty list for this member. Used by `initMarkPolys` and `allocMark` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L92)

<a id="field-field-mq3-client-cgame-marks-state-projected-projected-src-mq3-client-cgame-marks-ml-961226298"></a>
### projected

```ml
projected
```

When constructing this record, `create` supplies `0` for this member. Used by `initMarkPolys` and `impactMark` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L113)

<a id="field-field-mq3-client-cgame-marks-state-rendered-rendered-src-mq3-client-cgame-marks-ml-79730036"></a>
### rendered

```ml
rendered
```

When constructing this record, `create` supplies `0` for this member. Used by `initMarkPolys` and `pushBoundary` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L116)

<a id="field-field-mq3-client-cgame-marks-state-retailactive-retailactive-src-mq3-client-cgame-marks-ml-894753148"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns surface-impact mark projection, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L105)

<a id="field-field-mq3-client-cgame-marks-state-suppressed-suppressed-src-mq3-client-cgame-marks-ml-1811456626"></a>
### suppressed

```ml
suppressed
```

Number of requests withheld from native dispatch while projecting impact decals and submitting their fading polygons because the retail QVM owns their effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L119)

<a id="field-field-mq3-client-cgame-marks-state-time-time-src-mq3-client-cgame-marks-ml-954579484"></a>
### time

```ml
time
```

Client-game timestamp in milliseconds used to create, age, and fade surface marks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L99)
