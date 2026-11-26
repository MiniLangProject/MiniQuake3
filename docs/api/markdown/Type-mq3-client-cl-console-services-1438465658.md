# `mq3.client.cl_console.Services`

[Home](README.md) · [Source file](File-src-mq3-client-cl-console-ml-1724798958.md)

<a id="struct-struct-mq3-client-cl-console-services-struct-services-src-mq3-client-cl-console-ml-1765118909"></a>
## Services

```ml
struct Services
```

Stores engine client console host-service callbacks, including `context`, `startDemoLoopFn`, `crosshairPlayerFn`, `lastAttackerFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L40)

## Members

<a id="field-field-mq3-client-cl-console-services-context-context-src-mq3-client-cl-console-ml-988677741"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for console scrollback and notification drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L43)

<a id="field-field-mq3-client-cl-console-services-crosshairplayerfn-crosshairplayerfn-src-mq3-client-cl-console-ml-198940877"></a>
### crosshairPlayerFn

```ml
crosshairPlayerFn
```

Host callback for the crosshair player operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L49)

<a id="field-field-mq3-client-cl-console-services-lastattackerfn-lastattackerfn-src-mq3-client-cl-console-ml-1613484019"></a>
### lastAttackerFn

```ml
lastAttackerFn
```

Host callback for the last attacker operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L52)

<a id="field-field-mq3-client-cl-console-services-startdemoloopfn-startdemoloopfn-src-mq3-client-cl-console-ml-1978232077"></a>
### startDemoLoopFn

```ml
startDemoLoopFn
```

Host callback for the start demo loop operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_console.ml#L46)
