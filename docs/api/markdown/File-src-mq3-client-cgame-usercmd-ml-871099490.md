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

Creates a `mq3.client.cgame_usercmd.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_usercmd.ml#L16)

<a id="function-function-mq3-client-cgame-usercmd-scalemouse-function-scalemouse-state-value-src-mq3-client-cgame-usercmd-ml-1195851312"></a>
### scaleMouse

```ml
function scaleMouse(state, value)
```

Computes `value*sensitivity(state)` for client game usercmd `scaleMouse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game usercmd state passed to the helper calls in `scaleMouse`. |
| `value` | `dynamic` | — | Value used by `return value*sensitivity(state)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_usercmd.ml#L37)

<a id="function-function-mq3-client-cgame-usercmd-sensitivity-function-sensitivity-state-src-mq3-client-cgame-usercmd-ml-743805927"></a>
### sensitivity

```ml
function sensitivity(state)
```

Evaluates client game usercmd `sensitivity` and returns `1.0`, `state.sensitivity` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.sensitivity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_usercmd.ml#L33)

<a id="function-function-mq3-client-cgame-usercmd-set-function-set-state-weapon-sensitivity-src-mq3-client-cgame-usercmd-ml-103749958"></a>
### set

```ml
function set(state, weapon, sensitivity)
```

CL_SetUserCmdValue stores both values verbatim.  The weapon is truncated only when usercmd_t is serialized; mouse sensitivity remains binary32.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game usercmd record/storage; this routine assigns `state.weapon`, `state.sensitivity`. |
| `weapon` | `dynamic` | — | Value assigned to `state.weapon`. |
| `sensitivity` | `dynamic` | — | Value assigned to `state.sensitivity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_usercmd.ml#L23)

- [mq3.client.cgame_usercmd.State](Type-mq3-client-cgame-usercmd-state-1256089009.md) — struct
<a id="function-function-mq3-client-cgame-usercmd-weapon-function-weapon-state-src-mq3-client-cgame-usercmd-ml-1461092213"></a>
### weapon

```ml
function weapon(state)
```

Evaluates client game usercmd `weapon` and returns `0`, `state.weapon` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.weapon`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_usercmd.ml#L30)
