# `mq3.server.client_command_dispatch.Services`

[Home](README.md) · [Source file](File-src-mq3-server-client-command-dispatch-ml-253634273.md)

<a id="struct-struct-mq3-server-client-command-dispatch-services-struct-services-src-mq3-server-client-command-dispatch-ml-34145423"></a>
## Services

```ml
struct Services
```

Services record for server.client_command_dispatch, containing `builtinFn`, `downloadFn`, `gameFn`, `ignoredFn`, `context`, `downloadContext`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command_dispatch.ml#L12)

## Members

<a id="field-field-mq3-server-client-command-dispatch-services-builtinfn-builtinfn-src-mq3-server-client-command-dispatch-ml-949523229"></a>
### builtinFn

```ml
builtinFn
```

Host callback that handles a built-in server-side client command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command_dispatch.ml#L14)

<a id="field-field-mq3-server-client-command-dispatch-services-context-context-src-mq3-server-client-command-dispatch-ml-568734893"></a>
### context

```ml
context
```

Caller-supplied data associated with dispatch of built-in, download, and game client commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command_dispatch.ml#L22)

<a id="field-field-mq3-server-client-command-dispatch-services-downloadcontext-downloadcontext-src-mq3-server-client-command-dispatch-ml-1293177081"></a>
### downloadContext

```ml
downloadContext
```

Bound context for handling client download commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command_dispatch.ml#L24)

<a id="field-field-mq3-server-client-command-dispatch-services-downloadfn-downloadfn-src-mq3-server-client-command-dispatch-ml-1551282565"></a>
### downloadFn

```ml
downloadFn
```

Host callback that handles a client file-download command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command_dispatch.ml#L16)

<a id="field-field-mq3-server-client-command-dispatch-services-gamefn-gamefn-src-mq3-server-client-command-dispatch-ml-791809725"></a>
### gameFn

```ml
gameFn
```

Host callback that dispatches a lifecycle request to the game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command_dispatch.ml#L18)

<a id="field-field-mq3-server-client-command-dispatch-services-ignoredfn-ignoredfn-src-mq3-server-client-command-dispatch-ml-1188731565"></a>
### ignoredFn

```ml
ignoredFn
```

Host callback that observes a client command intentionally ignored by the dispatcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command_dispatch.ml#L20)

<a id="field-field-mq3-server-client-command-dispatch-services-lifecycleruntime-lifecycleruntime-src-mq3-server-client-command-dispatch-ml-1830225149"></a>
### lifecycleRuntime

```ml
lifecycleRuntime
```

Server/client lifecycle state used by disconnect and entry commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command_dispatch.ml#L26)
