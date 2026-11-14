# `src/mq3/client/cgame_usercmd.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_usercmd`](Package-mq3-client-cgame-usercmd-1704695818.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-client-cgame-usercmd-create-function-create-src-mq3-client-cgame-usercmd-ml-972311622"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_usercmd.ml#L8)

<a id="function-function-mq3-client-cgame-usercmd-scalemouse-function-scalemouse-state-value-src-mq3-client-cgame-usercmd-ml-1195851312"></a>
### scaleMouse

```ml
function scaleMouse(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_usercmd.ml#L19)

<a id="function-function-mq3-client-cgame-usercmd-sensitivity-function-sensitivity-state-src-mq3-client-cgame-usercmd-ml-743805927"></a>
### sensitivity

```ml
function sensitivity(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_usercmd.ml#L18)

<a id="function-function-mq3-client-cgame-usercmd-set-function-set-state-weapon-sensitivity-src-mq3-client-cgame-usercmd-ml-103749958"></a>
### set

```ml
function set(state, weapon, sensitivity)
```

CL_SetUserCmdValue stores both values verbatim.  The weapon is truncated only when usercmd_t is serialized; mouse sensitivity remains binary32.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |
| `sensitivity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_usercmd.ml#L12)

- [mq3.client.cgame_usercmd.State](Type-mq3-client-cgame-usercmd-state-1256089009.md) — struct
<a id="function-function-mq3-client-cgame-usercmd-weapon-function-weapon-state-src-mq3-client-cgame-usercmd-ml-1461092213"></a>
### weapon

```ml
function weapon(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_usercmd.ml#L17)
