# `mq3.server.timeouts.Services`

[Home](README.md) · [Source file](File-src-mq3-server-timeouts-ml-1356487829.md)

<a id="struct-struct-mq3-server-timeouts-services-struct-services-src-mq3-server-timeouts-ml-821289495"></a>
## Services

```ml
struct Services
```

Services record for server.timeouts, containing `dropFn`, `diagnosticFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L55)

## Members

<a id="field-field-mq3-server-timeouts-services-context-context-src-mq3-server-timeouts-ml-953417795"></a>
### context

```ml
context
```

Caller-supplied data associated with client timeout disconnection and timeout diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L61)

<a id="field-field-mq3-server-timeouts-services-diagnosticfn-diagnosticfn-src-mq3-server-timeouts-ml-1148040933"></a>
### diagnosticFn

```ml
diagnosticFn
```

Host callback that reports subsystem diagnostics to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L59)

<a id="field-field-mq3-server-timeouts-services-dropfn-dropfn-src-mq3-server-timeouts-ml-1938603681"></a>
### dropFn

```ml
dropFn
```

Host callback that disconnects a client and reports the supplied reason.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/timeouts.ml#L57)
