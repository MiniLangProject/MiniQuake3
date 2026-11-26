# `mq3.client.cgame_marks.Boundary`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-marks-ml-1111050399.md)

<a id="struct-struct-mq3-client-cgame-marks-boundary-struct-boundary-src-mq3-client-cgame-marks-ml-1164185711"></a>
## Boundary

```ml
struct Boundary
```

Projection and polygon submission are explicit engine boundaries.  A Retail QVM observer records them but leaves dispatched=false, avoiding double draw.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L65)

## Members

<a id="field-field-mq3-client-cgame-marks-boundary-boundary-boundary-src-mq3-client-cgame-marks-ml-1150678079"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while projecting impact decals and submitting their fading polygons.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L68)

<a id="field-field-mq3-client-cgame-marks-boundary-dispatched-dispatched-src-mq3-client-cgame-marks-ml-599920669"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while projecting impact decals and submitting their fading polygons; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L82)

<a id="field-field-mq3-client-cgame-marks-boundary-kind-kind-src-mq3-client-cgame-marks-ml-1735400919"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while projecting impact decals and submitting their fading polygons.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L71)

<a id="field-field-mq3-client-cgame-marks-boundary-points-points-src-mq3-client-cgame-marks-ml-144052821"></a>
### points

```ml
points
```

When constructing this record, `pushBoundary` supplies `points` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L75)

<a id="field-field-mq3-client-cgame-marks-boundary-projection-projection-src-mq3-client-cgame-marks-ml-735669189"></a>
### projection

```ml
projection
```

When constructing this record, `pushBoundary` supplies `projection` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L77)

<a id="field-field-mq3-client-cgame-marks-boundary-shader-shader-src-mq3-client-cgame-marks-ml-1078410217"></a>
### shader

```ml
shader
```

Mark material carried by a polygon-rendering request; empty for a fragment-projection query.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L73)

<a id="field-field-mq3-client-cgame-marks-boundary-temporary-temporary-src-mq3-client-cgame-marks-ml-1961655071"></a>
### temporary

```ml
temporary
```

When constructing this record, `pushBoundary` supplies `temporary` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L84)

<a id="field-field-mq3-client-cgame-marks-boundary-vertices-vertices-src-mq3-client-cgame-marks-ml-1065728341"></a>
### vertices

```ml
vertices
```

When constructing this record, `pushBoundary` supplies `vertices` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L79)
