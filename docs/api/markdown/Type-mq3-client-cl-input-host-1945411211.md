# `mq3.client.cl_input.Host`

[Home](README.md) · [Source file](File-src-mq3-client-cl-input-ml-663114153.md)

<a id="struct-struct-mq3-client-cl-input-host-struct-host-src-mq3-client-cl-input-ml-1654105723"></a>
## Host

```ml
struct Host
```

The callbacks are the only VM/host boundary in this module.  Supplying void suppresses the corresponding side effect, which makes deterministic native and headless clients use the same input state machine as the windowed host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L20)

## Members

<a id="field-field-mq3-client-cl-input-host-cgamemousefn-cgamemousefn-src-mq3-client-cl-input-ml-626043605"></a>
### cgameMouseFn

```ml
cgameMouseFn
```

Host callback for the cgame mouse operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L26)

<a id="field-field-mq3-client-cl-input-host-context-context-src-mq3-client-cl-input-ml-1317652041"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for engine input sampling and user-command construction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L34)

<a id="field-field-mq3-client-cl-input-host-debuggraphfn-debuggraphfn-src-mq3-client-cl-input-ml-1972624779"></a>
### debugGraphFn

```ml
debugGraphFn
```

Host callback for the debug graph operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L29)

<a id="field-field-mq3-client-cl-input-host-printfn-printfn-src-mq3-client-cl-input-ml-1335469969"></a>
### printFn

```ml
printFn
```

Host callback for the print operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L31)

<a id="field-field-mq3-client-cl-input-host-uimousefn-uimousefn-src-mq3-client-cl-input-ml-94167853"></a>
### uiMouseFn

```ml
uiMouseFn
```

Host callback for the ui mouse operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L23)
