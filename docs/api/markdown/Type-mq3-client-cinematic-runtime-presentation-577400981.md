# `mq3.client.cinematic_runtime.Presentation`

[Home](README.md) · [Source file](File-src-mq3-client-cinematic-runtime-ml-1539162371.md)

<a id="struct-struct-mq3-client-cinematic-runtime-presentation-struct-presentation-src-mq3-client-cinematic-runtime-ml-124714499"></a>
## Presentation

```ml
struct Presentation
```

Stores cinematic runtime presentation record, including `pixels`, `sourceWidth`, `sourceHeight`, `x`, `y`, `width` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L74)

## Members

<a id="field-field-mq3-client-cinematic-runtime-presentation-dirty-dirty-src-mq3-client-cinematic-runtime-ml-1486919233"></a>
### dirty

```ml
dirty
```

When constructing this record, `presentation` supplies `draw.dirty` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L90)

<a id="field-field-mq3-client-cinematic-runtime-presentation-height-height-src-mq3-client-cinematic-runtime-ml-273808351"></a>
### height

```ml
height
```

Destination height passed to the cinematic presenter after any virtual-to-target scaling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L88)

<a id="field-field-mq3-client-cinematic-runtime-presentation-pixels-pixels-src-mq3-client-cinematic-runtime-ml-1147798651"></a>
### pixels

```ml
pixels
```

When constructing this record, `presentation` supplies `draw.frame.pixels` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L76)

<a id="field-field-mq3-client-cinematic-runtime-presentation-sourceheight-sourceheight-src-mq3-client-cinematic-runtime-ml-44251453"></a>
### sourceHeight

```ml
sourceHeight
```

When constructing this record, `presentation` supplies `draw.frame.height` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L80)

<a id="field-field-mq3-client-cinematic-runtime-presentation-sourcewidth-sourcewidth-src-mq3-client-cinematic-runtime-ml-707238185"></a>
### sourceWidth

```ml
sourceWidth
```

When constructing this record, `presentation` supplies `draw.frame.width` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L78)

<a id="field-field-mq3-client-cinematic-runtime-presentation-width-width-src-mq3-client-cinematic-runtime-ml-1752986953"></a>
### width

```ml
width
```

Destination width passed to the cinematic presenter after any virtual-to-target scaling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L86)

<a id="field-field-mq3-client-cinematic-runtime-presentation-x-x-src-mq3-client-cinematic-runtime-ml-605826853"></a>
### x

```ml
x
```

Horizontal coordinate of the scaled cinematic rectangle in target-display pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L82)

<a id="field-field-mq3-client-cinematic-runtime-presentation-y-y-src-mq3-client-cinematic-runtime-ml-398514577"></a>
### y

```ml
y
```

Vertical coordinate of the scaled cinematic rectangle in target-display pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cinematic_runtime.ml#L84)
