# `mq3.client.cgame_localents.Services`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-localents-ml-2123896286.md)

<a id="struct-struct-mq3-client-cgame-localents-services-struct-services-src-mq3-client-cgame-localents-ml-202654883"></a>
## Services

```ml
struct Services
```

Stores client game localents host-service callbacks, including `traceFn`, `pointContentsFn`, `randomFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L197)

## Members

<a id="field-field-mq3-client-cgame-localents-services-context-context-src-mq3-client-cgame-localents-ml-589351829"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for short-lived client effect entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L207)

<a id="field-field-mq3-client-cgame-localents-services-pointcontentsfn-pointcontentsfn-src-mq3-client-cgame-localents-ml-31027473"></a>
### pointContentsFn

```ml
pointContentsFn
```

Host callback for the point contents operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L202)

<a id="field-field-mq3-client-cgame-localents-services-randomfn-randomfn-src-mq3-client-cgame-localents-ml-2125091703"></a>
### randomFn

```ml
randomFn
```

Host callback for the random operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L204)

<a id="field-field-mq3-client-cgame-localents-services-tracefn-tracefn-src-mq3-client-cgame-localents-ml-1734228137"></a>
### traceFn

```ml
traceFn
```

Host callback for the trace operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L199)
