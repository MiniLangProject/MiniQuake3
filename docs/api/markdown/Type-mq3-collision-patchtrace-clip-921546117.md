# `mq3.collision.patchtrace.Clip`

[Home](README.md) · [Source file](File-src-mq3-collision-patchtrace-ml-877086175.md)

<a id="struct-struct-mq3-collision-patchtrace-clip-struct-clip-src-mq3-collision-patchtrace-ml-618729285"></a>
## Clip

```ml
struct Clip
```

Clip record for collision.patchtrace, containing `enter`, `leave`, `hit`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/patchtrace.ml#L21)

## Members

<a id="field-field-mq3-collision-patchtrace-clip-enter-enter-src-mq3-collision-patchtrace-ml-1520260193"></a>
### enter

```ml
enter
```

Earliest fraction at which the trace enters the facet volume.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/patchtrace.ml#L23)

<a id="field-field-mq3-collision-patchtrace-clip-hit-hit-src-mq3-collision-patchtrace-ml-1306973129"></a>
### hit

```ml
hit
```

True when clipping produces a valid intersection interval.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/patchtrace.ml#L27)

<a id="field-field-mq3-collision-patchtrace-clip-leave-leave-src-mq3-collision-patchtrace-ml-312090201"></a>
### leave

```ml
leave
```

Latest fraction at which the trace leaves the facet volume.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/patchtrace.ml#L25)
