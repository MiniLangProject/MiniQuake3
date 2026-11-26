# `mq3.client.cgame_vm.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-vm-ml-1871886258.md)

<a id="struct-struct-mq3-client-cgame-vm-state-struct-state-src-mq3-client-cgame-vm-ml-619440073"></a>
## State

```ml
struct State
```

Stores client game vm state, including `host`, `slot`, `active`, `cgameStarted`, `connectionState`, `keyCatchers` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L74)

## Members

<a id="field-field-mq3-client-cgame-vm-state-active-active-src-mq3-client-cgame-vm-ml-546148274"></a>
### active

```ml
active
```

When constructing this record, `create` supplies `false` for this member. Used by `requireActive` and `initialize` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L81)

<a id="field-field-mq3-client-cgame-vm-state-callcount-callcount-src-mq3-client-cgame-vm-ml-761375338"></a>
### callCount

```ml
callCount
```

When constructing this record, `create` supplies `0` for this member. Used by `invoke` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L96)

<a id="field-field-mq3-client-cgame-vm-state-cgamestarted-cgamestarted-src-mq3-client-cgame-vm-ml-1780499518"></a>
### cgameStarted

```ml
cgameStarted
```

When constructing this record, `create` supplies `false` for this member. Used by `initialize` and `shutdown` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L84)

<a id="field-field-mq3-client-cgame-vm-state-connectionstate-connectionstate-src-mq3-client-cgame-vm-ml-440515006"></a>
### connectionState

```ml
connectionState
```

Client connection-state identifier controlling handshake, loading, and active-play behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L86)

<a id="field-field-mq3-client-cgame-vm-state-host-host-src-mq3-client-cgame-vm-ml-1955044218"></a>
### host

```ml
host
```

Host-adapter callbacks and context used to execute the module's engine operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L76)

<a id="field-field-mq3-client-cgame-vm-state-keycatchers-keycatchers-src-mq3-client-cgame-vm-ml-1859137598"></a>
### keyCatchers

```ml
keyCatchers
```

Bitmask selecting which subsystems currently intercept keyboard input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L88)

<a id="field-field-mq3-client-cgame-vm-state-lastargs-lastargs-src-mq3-client-cgame-vm-ml-1983778196"></a>
### lastArgs

```ml
lastArgs
```

When constructing this record, `create` supplies an empty list for this member. Used by `invoke` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L102)

<a id="field-field-mq3-client-cgame-vm-state-lastexport-lastexport-src-mq3-client-cgame-vm-ml-851303102"></a>
### lastExport

```ml
lastExport
```

When constructing this record, `create` supplies `-1` for this member. Used by `invoke` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L99)

<a id="field-field-mq3-client-cgame-vm-state-loadmilliseconds-loadmilliseconds-src-mq3-client-cgame-vm-ml-965810594"></a>
### loadMilliseconds

```ml
loadMilliseconds
```

When constructing this record, `create` supplies `0` for this member. Used by `initialize` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L93)

<a id="field-field-mq3-client-cgame-vm-state-mapname-mapname-src-mq3-client-cgame-vm-ml-1128518022"></a>
### mapname

```ml
mapname
```

Map name parsed from server information or selected by the client UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L90)

<a id="field-field-mq3-client-cgame-vm-state-slot-slot-src-mq3-client-cgame-vm-ml-1280616998"></a>
### slot

```ml
slot
```

VM slot index identifying the loaded CGame or UI module in the VM runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_vm.ml#L78)
