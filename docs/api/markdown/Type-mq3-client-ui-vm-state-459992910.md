# `mq3.client.ui_vm.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-vm-ml-1076773103.md)

<a id="struct-struct-mq3-client-ui-vm-state-struct-state-src-mq3-client-ui-vm-ml-1441788739"></a>
## State

```ml
struct State
```

Stores UI vm state, including `host`, `slot`, `active`, `uiStarted`, `keyCatchers`, `apiVersion` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L58)

## Members

<a id="field-field-mq3-client-ui-vm-state-active-active-src-mq3-client-ui-vm-ml-931131682"></a>
### active

```ml
active
```

When constructing this record, `create` supplies `false` for this member. Used by `requireActive` and `initialize` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L65)

<a id="field-field-mq3-client-ui-vm-state-apiversion-apiversion-src-mq3-client-ui-vm-ml-1066115842"></a>
### apiVersion

```ml
apiVersion
```

When constructing this record, `create` supplies `0` for this member. Used by `initialize` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L73)

<a id="field-field-mq3-client-ui-vm-state-callcount-callcount-src-mq3-client-ui-vm-ml-1357787110"></a>
### callCount

```ml
callCount
```

When constructing this record, `create` supplies `0` for this member. Used by `invoke` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L76)

<a id="field-field-mq3-client-ui-vm-state-host-host-src-mq3-client-ui-vm-ml-116019250"></a>
### host

```ml
host
```

Host-adapter callbacks and context used to execute the module's engine operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L60)

<a id="field-field-mq3-client-ui-vm-state-keycatchers-keycatchers-src-mq3-client-ui-vm-ml-1053593426"></a>
### keyCatchers

```ml
keyCatchers
```

Bitmask selecting which subsystems currently intercept keyboard input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L70)

<a id="field-field-mq3-client-ui-vm-state-lastargs-lastargs-src-mq3-client-ui-vm-ml-742182188"></a>
### lastArgs

```ml
lastArgs
```

When constructing this record, `create` supplies an empty list for this member. Used by `invoke` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L82)

<a id="field-field-mq3-client-ui-vm-state-lastexport-lastexport-src-mq3-client-ui-vm-ml-972453026"></a>
### lastExport

```ml
lastExport
```

When constructing this record, `create` supplies `-1` for this member. Used by `invoke` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L79)

<a id="field-field-mq3-client-ui-vm-state-slot-slot-src-mq3-client-ui-vm-ml-932259878"></a>
### slot

```ml
slot
```

VM slot index identifying the loaded CGame or UI module in the VM runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L62)

<a id="field-field-mq3-client-ui-vm-state-uistarted-uistarted-src-mq3-client-ui-vm-ml-770085578"></a>
### uiStarted

```ml
uiStarted
```

When constructing this record, `create` supplies `false` for this member. Used by `initialize` and `shutdown` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_vm.ml#L68)
