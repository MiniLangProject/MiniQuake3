# `src/mq3/client/ui_input_latch.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_input_latch`](Package-mq3-client-ui-input-latch-1492593149.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-client-ui-input-latch-beginframe-function-beginframe-state-src-mq3-client-ui-input-latch-ml-1111605817"></a>
### beginFrame

```ml
function beginFrame(state)
```

Updates `state.pulse[index]` during UI input latch `beginFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI input latch record/storage; this routine assigns `state.pulse[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_input_latch.ml#L27)

<a id="function-function-mq3-client-ui-input-latch-create-function-create-keycount-src-mq3-client-ui-input-latch-ml-1584435428"></a>
### create

```ml
function create(keyCount)
```

Calls `mq3.client.ui_input_latch.State` from UI input latch `create`. The final path returns `State(array(keyCount,false),array(keyCount,false))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `keyCount` | `dynamic` | — | Value used by `if typeof(keyCount)!="int" or keyCount<1 then return error(7703,"UI input latch: invalid key capacity") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_input_latch.ml#L20)

<a id="constant-constant-mq3-client-ui-input-latch-input-key-const-input-key-1-src-mq3-client-ui-input-latch-ml-455511196"></a>
### INPUT_KEY

```ml
const INPUT_KEY = 1
```

Platform input-event tag selecting a key press or release.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_input_latch.ml#L6)

<a id="function-function-mq3-client-ui-input-latch-keydown-function-keydown-state-key-src-mq3-client-ui-input-latch-ml-567883264"></a>
### keyDown

```ml
function keyDown(state, key)
```

Tests the held or one-frame pulse state for a valid key; invalid keys return false.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.down`, `state.pulse`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI input latch entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_input_latch.ml#L48)

<a id="function-function-mq3-client-ui-input-latch-observe-function-observe-state-type-key-value-src-mq3-client-ui-input-latch-ml-1647633929"></a>
### observe

```ml
function observe(state, type, key, value)
```

Updates `state.down[key]`, `state.pulse[key]` during UI input latch `observe`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI input latch record/storage; this routine assigns `state.down[key]`, `state.pulse[key]`. |
| `type` | `dynamic` | — | Value used by `if type!=INPUT_KEY or key<0 or key>=len(state.down) then return false end if`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI input latch entry. |
| `value` | `dynamic` | — | Value used by `down=value!=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_input_latch.ml#L38)

- [mq3.client.ui_input_latch.State](Type-mq3-client-ui-input-latch-state-116436234.md) — struct
