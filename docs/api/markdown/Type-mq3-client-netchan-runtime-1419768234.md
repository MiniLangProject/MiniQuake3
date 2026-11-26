# `mq3.client.netchan.Runtime`

[Home](README.md) · [Source file](File-src-mq3-client-netchan-ml-1745063016.md)

<a id="struct-struct-mq3-client-netchan-runtime-struct-runtime-src-mq3-client-netchan-ml-2043101073"></a>
## Runtime

```ml
struct Runtime
```

Stores netchan runtime wiring and state, including `transport`, `connection`, `newsize`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L28)

## Members

<a id="field-field-mq3-client-netchan-runtime-connection-connection-src-mq3-client-netchan-ml-1215230433"></a>
### connection

```ml
connection
```

When constructing this record, `create` supplies `connection` for this member. Used by `transmit` and `process` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L34)

<a id="field-field-mq3-client-netchan-runtime-newsize-newsize-src-mq3-client-netchan-ml-1142455853"></a>
### newsize

```ml
newsize
```

When constructing this record, `create` supplies `0` for this member. Used by `process` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L37)

<a id="field-field-mq3-client-netchan-runtime-transport-transport-src-mq3-client-netchan-ml-357620193"></a>
### transport

```ml
transport
```

When constructing this record, `create` supplies `transport` for this member. Used by `transmitNextFragment` and `transmit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/netchan.ml#L31)
