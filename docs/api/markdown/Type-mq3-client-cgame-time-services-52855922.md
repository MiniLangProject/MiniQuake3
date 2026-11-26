# `mq3.client.cgame_time.Services`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-time-ml-148018170.md)

<a id="struct-struct-mq3-client-cgame-time-services-struct-services-src-mq3-client-cgame-time-ml-1704312521"></a>
## Services

```ml
struct Services
```

Stores client game time host-service callbacks, including `context`, `addTextFn`, `clearActiveActionFn`, `beginProfilingFn`, `readDemoFn`, `millisecondsFn` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L17)

## Members

<a id="field-field-mq3-client-cgame-time-services-addtextfn-addtextfn-src-mq3-client-cgame-time-ml-1226800357"></a>
### addTextFn

```ml
addTextFn
```

Host callback for the add text operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L23)

<a id="field-field-mq3-client-cgame-time-services-beginprofilingfn-beginprofilingfn-src-mq3-client-cgame-time-ml-2074149651"></a>
### beginProfilingFn

```ml
beginProfilingFn
```

Host callback for the begin profiling operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L29)

<a id="field-field-mq3-client-cgame-time-services-clearactiveactionfn-clearactiveactionfn-src-mq3-client-cgame-time-ml-1861234925"></a>
### clearActiveActionFn

```ml
clearActiveActionFn
```

Host callback for the clear active action operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L26)

<a id="field-field-mq3-client-cgame-time-services-context-context-src-mq3-client-cgame-time-ml-828228621"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for the engine's CGame time controller.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L20)

<a id="field-field-mq3-client-cgame-time-services-diagnosticfn-diagnosticfn-src-mq3-client-cgame-time-ml-1348495071"></a>
### diagnosticFn

```ml
diagnosticFn
```

Host callback for the diagnostic operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L38)

<a id="field-field-mq3-client-cgame-time-services-millisecondsfn-millisecondsfn-src-mq3-client-cgame-time-ml-250282021"></a>
### millisecondsFn

```ml
millisecondsFn
```

Host callback for the milliseconds operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L35)

<a id="field-field-mq3-client-cgame-time-services-readdemofn-readdemofn-src-mq3-client-cgame-time-ml-1564292327"></a>
### readDemoFn

```ml
readDemoFn
```

Host callback for the read demo operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_time.ml#L32)
