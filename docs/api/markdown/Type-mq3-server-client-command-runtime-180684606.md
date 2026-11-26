# `mq3.server.client_command.Runtime`

[Home](README.md) · [Source file](File-src-mq3-server-client-command-ml-1186902078.md)

<a id="struct-struct-mq3-server-client-command-runtime-struct-runtime-src-mq3-server-client-command-ml-17881571"></a>
## Runtime

```ml
struct Runtime
```

Server clock, flood policy, and host callbacks used when consuming reliable client commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command.ml#L26)

## Members

<a id="field-field-mq3-server-client-command-runtime-clientrunning-clientrunning-src-mq3-server-client-command-ml-107773209"></a>
### clientRunning

```ml
clientRunning
```

True when a local client is running; this bypasses the active-client flood interval.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command.ml#L32)

<a id="field-field-mq3-server-client-command-runtime-context-context-src-mq3-server-client-command-ml-1424879849"></a>
### context

```ml
context
```

Caller-owned data accessible through the first callback argument as `host.context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command.ml#L41)

<a id="field-field-mq3-server-client-command-runtime-diagnosticfn-diagnosticfn-src-mq3-server-client-command-ml-1300173287"></a>
### diagnosticFn

```ml
diagnosticFn
```

Optional callback `(host, clientState, sequence, text)` called for nonduplicate commands before gap validation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command.ml#L39)

<a id="field-field-mq3-server-client-command-runtime-dropfn-dropfn-src-mq3-server-client-command-ml-92711591"></a>
### dropFn

```ml
dropFn
```

Optional callback `(host, clientState, reason)` used to disconnect a client after a sequence gap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command.ml#L37)

<a id="field-field-mq3-server-client-command-runtime-executefn-executefn-src-mq3-server-client-command-ml-1093105773"></a>
### executeFn

```ml
executeFn
```

Optional callback `(host, clientState, text, clientOk)` invoked for each next-in-sequence command. `clientOk` is false when flood policy denies game-command dispatch; the return value is ignored.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command.ml#L35)

<a id="field-field-mq3-server-client-command-runtime-floodprotect-floodprotect-src-mq3-server-client-command-ml-58229287"></a>
### floodProtect

```ml
floodProtect
```

Enables the game-command flood interval for active clients when no local client is running.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command.ml#L30)

<a id="field-field-mq3-server-client-command-runtime-time-time-src-mq3-server-client-command-ml-923546727"></a>
### time

```ml
time
```

Server time used to enforce reliable-command flood protection, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command.ml#L28)
