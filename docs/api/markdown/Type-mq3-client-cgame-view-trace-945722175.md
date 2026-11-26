# `mq3.client.cgame_view.Trace`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-view-ml-1544499938.md)

<a id="struct-struct-mq3-client-cgame-view-trace-struct-trace-src-mq3-client-cgame-view-ml-798045809"></a>
## Trace

```ml
struct Trace
```

Stores client game view trace record, including `fraction`, `endpos`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L154)

## Members

<a id="field-field-mq3-client-cgame-view-trace-endpos-endpos-src-mq3-client-cgame-view-ml-1338650500"></a>
### endpos

```ml
endpos
```

Final world-space position reached by the collision trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L158)

<a id="field-field-mq3-client-cgame-view-trace-fraction-fraction-src-mq3-client-cgame-view-ml-1674881138"></a>
### fraction

```ml
fraction
```

When constructing this record, `nextTrace` supplies `1.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L156)
