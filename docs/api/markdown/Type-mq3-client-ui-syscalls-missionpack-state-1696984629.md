# `mq3.client.ui_syscalls_missionpack.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-syscalls-missionpack-ml-1966791630.md)

<a id="struct-struct-mq3-client-ui-syscalls-missionpack-state-struct-state-src-mq3-client-ui-syscalls-missionpack-ml-2042461343"></a>
## State

```ml
struct State
```

Stores UI syscalls missionpack state, including `syscallFn`, `context`, `calls`, `lastOpcode`, `lastArguments`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_syscalls_missionpack.ml#L192)

## Members

<a id="field-field-mq3-client-ui-syscalls-missionpack-state-calls-calls-src-mq3-client-ui-syscalls-missionpack-ml-1594508348"></a>
### calls

```ml
calls
```

When constructing this record, `dllEntry` supplies `0` for this member. Used by `invoke` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_syscalls_missionpack.ml#L200)

<a id="field-field-mq3-client-ui-syscalls-missionpack-state-context-context-src-mq3-client-ui-syscalls-missionpack-ml-366450284"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for the Missionpack UI syscall gateway.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_syscalls_missionpack.ml#L197)

<a id="field-field-mq3-client-ui-syscalls-missionpack-state-lastarguments-lastarguments-src-mq3-client-ui-syscalls-missionpack-ml-1717836152"></a>
### lastArguments

```ml
lastArguments
```

When constructing this record, `dllEntry` supplies an empty list for this member. Used by `invoke` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_syscalls_missionpack.ml#L206)

<a id="field-field-mq3-client-ui-syscalls-missionpack-state-lastopcode-lastopcode-src-mq3-client-ui-syscalls-missionpack-ml-1168658048"></a>
### lastOpcode

```ml
lastOpcode
```

When constructing this record, `dllEntry` supplies `-1` for this member. Used by `invoke` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_syscalls_missionpack.ml#L203)

<a id="field-field-mq3-client-ui-syscalls-missionpack-state-syscallfn-syscallfn-src-mq3-client-ui-syscalls-missionpack-ml-1345434248"></a>
### syscallFn

```ml
syscallFn
```

Host callback for the syscall operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_syscalls_missionpack.ml#L194)
