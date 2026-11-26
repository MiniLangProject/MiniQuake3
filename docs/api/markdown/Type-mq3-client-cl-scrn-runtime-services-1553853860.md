# `mq3.client.cl_scrn_runtime.Services`

[Home](README.md) · [Source file](File-src-mq3-client-cl-scrn-runtime-ml-5625006.md)

<a id="struct-struct-mq3-client-cl-scrn-runtime-services-struct-services-src-mq3-client-cl-scrn-runtime-ml-312661627"></a>
## Services

```ml
struct Services
```

Stores engine client scrn runtime host-service callbacks, including `context`, `registerShaderFn`, `stopSoundsFn`, `consoleFn`, `fileTellFn`, `diagnosticFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L30)

## Members

<a id="field-field-mq3-client-cl-scrn-runtime-services-consolefn-consolefn-src-mq3-client-cl-scrn-runtime-ml-1903437581"></a>
### consoleFn

```ml
consoleFn
```

Host callback for the console operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L41)

<a id="field-field-mq3-client-cl-scrn-runtime-services-context-context-src-mq3-client-cl-scrn-runtime-ml-1836275997"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for screen refresh and debug-graph drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L33)

<a id="field-field-mq3-client-cl-scrn-runtime-services-diagnosticfn-diagnosticfn-src-mq3-client-cl-scrn-runtime-ml-2121821475"></a>
### diagnosticFn

```ml
diagnosticFn
```

Host callback for the diagnostic operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L47)

<a id="field-field-mq3-client-cl-scrn-runtime-services-filetellfn-filetellfn-src-mq3-client-cl-scrn-runtime-ml-1303285507"></a>
### fileTellFn

```ml
fileTellFn
```

Host callback for the file tell operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L44)

<a id="field-field-mq3-client-cl-scrn-runtime-services-registershaderfn-registershaderfn-src-mq3-client-cl-scrn-runtime-ml-1319586609"></a>
### registerShaderFn

```ml
registerShaderFn
```

Host callback for the register shader operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L36)

<a id="field-field-mq3-client-cl-scrn-runtime-services-stopsoundsfn-stopsoundsfn-src-mq3-client-cl-scrn-runtime-ml-1017462641"></a>
### stopSoundsFn

```ml
stopSoundsFn
```

Host callback for the stop sounds operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_scrn_runtime.ml#L39)
