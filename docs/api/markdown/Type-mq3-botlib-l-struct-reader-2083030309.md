# `mq3.botlib.l_struct.Reader`

[Home](README.md) · [Source file](File-src-mq3-botlib-l-struct-ml-34381902.md)

<a id="struct-struct-mq3-botlib-l-struct-reader-struct-reader-src-mq3-botlib-l-struct-ml-1521757377"></a>
## Reader

```ml
struct Reader
```

A reader can consume either a raw pc_parser Source or a precompiled handle. pending is local because l_struct.c needs exactly one-token pushback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L71)

## Members

<a id="field-field-mq3-botlib-l-struct-reader-diagnostics-diagnostics-src-mq3-botlib-l-struct-ml-1104426020"></a>
### diagnostics

```ml
diagnostics
```

Diagnostics collected while processing the subsystem's requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L81)

<a id="field-field-mq3-botlib-l-struct-reader-pending-pending-src-mq3-botlib-l-struct-ml-1072831132"></a>
### pending

```ml
pending
```

Saved token or command awaiting consumption by the next operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L79)

<a id="field-field-mq3-botlib-l-struct-reader-registry-registry-src-mq3-botlib-l-struct-ml-47657038"></a>
### registry

```ml
registry
```

Registry used to resolve registered names, handles, or runtime definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L75)

<a id="field-field-mq3-botlib-l-struct-reader-source-source-src-mq3-botlib-l-struct-ml-2146095886"></a>
### source

```ml
source
```

Script input supplying the structured-data tokens.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L73)

<a id="field-field-mq3-botlib-l-struct-reader-sourcehandle-sourcehandle-src-mq3-botlib-l-struct-ml-244512098"></a>
### sourceHandle

```ml
sourceHandle
```

Handle of the preprocessor source being read.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_struct.ml#L77)
