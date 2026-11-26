# `mq3.server.frame.Services`

[Home](README.md) · [Source file](File-src-mq3-server-frame-ml-1912753238.md)

<a id="struct-struct-mq3-server-frame-services-struct-services-src-mq3-server-frame-ml-285997091"></a>
## Services

```ml
struct Services
```

Services record for server.frame, containing `shutdownFn`, `cvarSetFn`, `botFrameFn`, `sleepFn`, `commandFn`, `infoStringFn`, and 11 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L69)

## Members

<a id="field-field-mq3-server-frame-services-botframefn-botframefn-src-mq3-server-frame-ml-718462705"></a>
### botFrameFn

```ml
botFrameFn
```

Host callback that runs bot-library work for the current server frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L75)

<a id="field-field-mq3-server-frame-services-commandfn-commandfn-src-mq3-server-frame-ml-103566017"></a>
### commandFn

```ml
commandFn
```

Host callback that executes a command through the host command interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L79)

<a id="field-field-mq3-server-frame-services-context-context-src-mq3-server-frame-ml-1823244281"></a>
### context

```ml
context
```

Caller-supplied data associated with server frame timing, game updates, heartbeat work, and frame observations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L104)

<a id="field-field-mq3-server-frame-services-cvarsetfn-cvarsetfn-src-mq3-server-frame-ml-1584167825"></a>
### cvarSetFn

```ml
cvarSetFn
```

Host callback that sets a configuration variable in the host registry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L73)

<a id="field-field-mq3-server-frame-services-gameframefn-gameframefn-src-mq3-server-frame-ml-140132605"></a>
### gameFrameFn

```ml
gameFrameFn
```

Host callback that runs the game VM for one server simulation frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L87)

<a id="field-field-mq3-server-frame-services-heartbeatfn-heartbeatfn-src-mq3-server-frame-ml-52441905"></a>
### heartbeatFn

```ml
heartbeatFn
```

Host callback that sends a server heartbeat to the configured master.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L89)

<a id="field-field-mq3-server-frame-services-infostringfn-infostringfn-src-mq3-server-frame-ml-339532463"></a>
### infoStringFn

```ml
infoStringFn
```

Host callback that returns an indexed host information string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L81)

<a id="field-field-mq3-server-frame-services-messagesobservedfn-messagesobservedfn-src-mq3-server-frame-ml-1452513169"></a>
### messagesObservedFn

```ml
messagesObservedFn
```

Host callback that observes messages sent during a server frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L97)

<a id="field-field-mq3-server-frame-services-millisecondsfn-millisecondsfn-src-mq3-server-frame-ml-581673041"></a>
### millisecondsFn

```ml
millisecondsFn
```

Host callback that supplies the current host clock in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L85)

<a id="field-field-mq3-server-frame-services-pauseobservedfn-pauseobservedfn-src-mq3-server-frame-ml-1383156369"></a>
### pauseObservedFn

```ml
pauseObservedFn
```

Host callback that observes the server pause decision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L91)

<a id="field-field-mq3-server-frame-services-pingsobservedfn-pingsobservedfn-src-mq3-server-frame-ml-516909389"></a>
### pingsObservedFn

```ml
pingsObservedFn
```

Host callback that observes updated client latency estimates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L93)

<a id="field-field-mq3-server-frame-services-setconfigstringfn-setconfigstringfn-src-mq3-server-frame-ml-1823510357"></a>
### setConfigstringFn

```ml
setConfigstringFn
```

Host callback that updates an indexed server configuration string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L83)

<a id="field-field-mq3-server-frame-services-shutdownfn-shutdownfn-src-mq3-server-frame-ml-1324400737"></a>
### shutdownFn

```ml
shutdownFn
```

Host callback that shuts down the host subsystem and releases its resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L71)

<a id="field-field-mq3-server-frame-services-sleepfn-sleepfn-src-mq3-server-frame-ml-2131557289"></a>
### sleepFn

```ml
sleepFn
```

Host callback that waits for the requested interval through the host scheduler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L77)

<a id="field-field-mq3-server-frame-services-snapshotservices-snapshotservices-src-mq3-server-frame-ml-1851001785"></a>
### snapshotServices

```ml
snapshotServices
```

Host callbacks used while scheduling or sending client snapshots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L101)

<a id="field-field-mq3-server-frame-services-timeoutobservedfn-timeoutobservedfn-src-mq3-server-frame-ml-1860250685"></a>
### timeoutObservedFn

```ml
timeoutObservedFn
```

Host callback that observes client timeout decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L95)

<a id="field-field-mq3-server-frame-services-timeoutservices-timeoutservices-src-mq3-server-frame-ml-545082669"></a>
### timeoutServices

```ml
timeoutServices
```

Host callbacks used when clients time out.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L99)
