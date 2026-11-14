# `src/mq3/vm/cgame_key_traps.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.cgame_key_traps`](Package-mq3-vm-cgame-key-traps-283530393.md)

Reachable from entry: **yes**

## Imports

- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-vm-cgame-key-traps-arg-function-arg-vm-base-index-src-mq3-vm-cgame-key-traps-ml-1274143108"></a>
### arg

```ml
function arg(vm, base, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L21)

<a id="function-function-mq3-vm-cgame-key-traps-callback-function-callback-host-src-mq3-vm-cgame-key-traps-ml-1469666764"></a>
### callback

```ml
function callback(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L146)

<a id="constant-constant-mq3-vm-cgame-key-traps-cg-key-getcatcher-const-cg-key-getcatcher-61-src-mq3-vm-cgame-key-traps-ml-501308336"></a>
### CG_KEY_GETCATCHER

```ml
const CG_KEY_GETCATCHER = 61
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L9)

<a id="constant-constant-mq3-vm-cgame-key-traps-cg-key-getkey-const-cg-key-getkey-63-src-mq3-vm-cgame-key-traps-ml-674354994"></a>
### CG_KEY_GETKEY

```ml
const CG_KEY_GETKEY = 63
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L11)

<a id="constant-constant-mq3-vm-cgame-key-traps-cg-key-isdown-const-cg-key-isdown-60-src-mq3-vm-cgame-key-traps-ml-1879089359"></a>
### CG_KEY_ISDOWN

```ml
const CG_KEY_ISDOWN = 60
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L8)

<a id="constant-constant-mq3-vm-cgame-key-traps-cg-key-setcatcher-const-cg-key-setcatcher-62-src-mq3-vm-cgame-key-traps-ml-1839741933"></a>
### CG_KEY_SETCATCHER

```ml
const CG_KEY_SETCATCHER = 62
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L10)

<a id="function-function-mq3-vm-cgame-key-traps-clearstates-function-clearstates-state-src-mq3-vm-cgame-key-traps-ml-2103759349"></a>
### clearStates

```ml
function clearStates(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L111)

<a id="function-function-mq3-vm-cgame-key-traps-create-function-create-src-mq3-vm-cgame-key-traps-ml-388386822"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L18)

<a id="function-function-mq3-vm-cgame-key-traps-dispatch-function-dispatch-host-vm-base-src-mq3-vm-cgame-key-traps-ml-1526460228"></a>
### dispatch

```ml
function dispatch(host, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L122)

<a id="function-function-mq3-vm-cgame-key-traps-fail-function-fail-message-src-mq3-vm-cgame-key-traps-ml-676852785"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L19)

<a id="function-function-mq3-vm-cgame-key-traps-getbinding-function-getbinding-state-key-src-mq3-vm-cgame-key-traps-ml-1901124014"></a>
### getBinding

```ml
function getBinding(state, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L40)

<a id="function-function-mq3-vm-cgame-key-traps-getcatcher-function-getcatcher-state-src-mq3-vm-cgame-key-traps-ml-249561127"></a>
### getCatcher

```ml
function getCatcher(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L34)

<a id="function-function-mq3-vm-cgame-key-traps-getkey-function-getkey-state-binding-src-mq3-vm-cgame-key-traps-ml-37588476"></a>
### getKey

```ml
function getKey(state, binding)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `binding` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L44)

<a id="function-function-mq3-vm-cgame-key-traps-getoverstrike-function-getoverstrike-state-src-mq3-vm-cgame-key-traps-ml-576730267"></a>
### getOverstrike

```ml
function getOverstrike(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L109)

<a id="function-function-mq3-vm-cgame-key-traps-hexnibble-function-hexnibble-value-src-mq3-vm-cgame-key-traps-ml-313117293"></a>
### hexNibble

```ml
function hexNibble(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L95)

<a id="function-function-mq3-vm-cgame-key-traps-isdown-function-isdown-state-key-src-mq3-vm-cgame-key-traps-ml-760937010"></a>
### isDown

```ml
function isDown(state, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L30)

<a id="function-function-mq3-vm-cgame-key-traps-keynumtostring-function-keynumtostring-key-src-mq3-vm-cgame-key-traps-ml-1981826569"></a>
### keynumToString

```ml
function keynumToString(key)
```

Exact cl_keys.c textual key ABI used by the original controls menu.  Keys absent from keynames[] intentionally retain the lowercase 0xnn spelling.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L57)

<a id="constant-constant-mq3-vm-cgame-key-traps-max-keys-const-max-keys-256-src-mq3-vm-cgame-key-traps-ml-1625006674"></a>
### MAX_KEYS

```ml
const MAX_KEYS = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L12)

<a id="function-function-mq3-vm-cgame-key-traps-services-function-services-context-src-mq3-vm-cgame-key-traps-ml-1865868249"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L17)

- [mq3.vm.cgame_key_traps.Services](Type-mq3-vm-cgame-key-traps-services-1882952869.md) — struct
<a id="function-function-mq3-vm-cgame-key-traps-setbinding-function-setbinding-state-key-value-src-mq3-vm-cgame-key-traps-ml-1465740535"></a>
### setBinding

```ml
function setBinding(state, key, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L36)

<a id="function-function-mq3-vm-cgame-key-traps-setcatcher-function-setcatcher-state-value-src-mq3-vm-cgame-key-traps-ml-1865481612"></a>
### setCatcher

```ml
function setCatcher(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L35)

<a id="function-function-mq3-vm-cgame-key-traps-setdown-function-setdown-state-key-value-src-mq3-vm-cgame-key-traps-ml-1110406975"></a>
### setDown

```ml
function setDown(state, key, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L26)

<a id="function-function-mq3-vm-cgame-key-traps-setoverstrike-function-setoverstrike-state-value-src-mq3-vm-cgame-key-traps-ml-1881891416"></a>
### setOverstrike

```ml
function setOverstrike(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L110)

- [mq3.vm.cgame_key_traps.State](Type-mq3-vm-cgame-key-traps-state-691993510.md) — struct
<a id="function-function-mq3-vm-cgame-key-traps-stateservices-function-stateservices-state-src-mq3-vm-cgame-key-traps-ml-631302213"></a>
### stateServices

```ml
function stateServices(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L117)

<a id="function-function-mq3-vm-cgame-key-traps-stringtokeynum-function-stringtokeynum-text-src-mq3-vm-cgame-key-traps-ml-190703139"></a>
### stringToKeynum

```ml
function stringToKeynum(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L101)

<a id="function-function-mq3-vm-cgame-key-traps-unavailable-function-unavailable-name-src-mq3-vm-cgame-key-traps-ml-138654151"></a>
### unavailable

```ml
function unavailable(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L20)

<a id="function-function-mq3-vm-cgame-key-traps-validkey-function-validkey-key-src-mq3-vm-cgame-key-traps-ml-2042095721"></a>
### validKey

```ml
function validKey(key)
```

These state helpers mirror cl_keys.c and cl_ui.c closely enough to be shared by native input, the UI QVM and the cgame QVM without exposing VM memory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_key_traps.ml#L25)
