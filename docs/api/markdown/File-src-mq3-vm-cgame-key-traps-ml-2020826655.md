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

Return `mq3.vm.syscall_common.argument(vm, base, index)` from `vm.cgame_key_traps.arg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L34)

<a id="function-function-mq3-vm-cgame-key-traps-callback-function-callback-host-src-mq3-vm-cgame-key-traps-ml-1469666764"></a>
### callback

```ml
function callback(host)
```

Apply `mq3.vm.cgame_key_traps.dispatch` for callback in vm.cgame_key_traps.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.cgame_key_traps.dispatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L210)

<a id="constant-constant-mq3-vm-cgame-key-traps-cg-key-getcatcher-const-cg-key-getcatcher-61-src-mq3-vm-cgame-key-traps-ml-501308336"></a>
### CG_KEY_GETCATCHER

```ml
const CG_KEY_GETCATCHER = 61
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L9)

<a id="constant-constant-mq3-vm-cgame-key-traps-cg-key-getkey-const-cg-key-getkey-63-src-mq3-vm-cgame-key-traps-ml-674354994"></a>
### CG_KEY_GETKEY

```ml
const CG_KEY_GETKEY = 63
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L11)

<a id="constant-constant-mq3-vm-cgame-key-traps-cg-key-isdown-const-cg-key-isdown-60-src-mq3-vm-cgame-key-traps-ml-1879089359"></a>
### CG_KEY_ISDOWN

```ml
const CG_KEY_ISDOWN = 60
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L8)

<a id="constant-constant-mq3-vm-cgame-key-traps-cg-key-setcatcher-const-cg-key-setcatcher-62-src-mq3-vm-cgame-key-traps-ml-1839741933"></a>
### CG_KEY_SETCATCHER

```ml
const CG_KEY_SETCATCHER = 62
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L10)

<a id="function-function-mq3-vm-cgame-key-traps-clearstates-function-clearstates-state-src-mq3-vm-cgame-key-traps-ml-2103759349"></a>
### clearStates

```ml
function clearStates(state)
```

Clear states in vm.cgame_key_traps.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `down`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L167)

<a id="function-function-mq3-vm-cgame-key-traps-create-function-create-src-mq3-vm-cgame-key-traps-ml-388386822"></a>
### create

```ml
function create()
```

Create `mq3.vm.cgame_key_traps.State` with down=array(MAX_KEYS, false); bindings=array(MAX_KEYS, void); catcher=0; overstrike=false; bindingSerial=0.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L23)

<a id="function-function-mq3-vm-cgame-key-traps-dispatch-function-dispatch-host-vm-base-src-mq3-vm-cgame-key-traps-ml-1526460228"></a>
### dispatch

```ml
function dispatch(host, vm, base)
```

Dispatch cgame key traps in vm.cgame_key_traps; the normal completion returns `fail(("unsupported trap " + str(op)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `isDownFn`, `context`, `getCatcherFn`, `setCatcherFn`, `getKeyFn`. |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.cgame_key_traps.arg`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L184)

<a id="function-function-mq3-vm-cgame-key-traps-fail-function-fail-message-src-mq3-vm-cgame-key-traps-ml-676852785"></a>
### fail

```ml
function fail(message)
```

Create the vm.cgame_key_traps error for `fail` with 7487 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("cgame key traps: " + message)` and `error(7487, ("cgame key traps: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L26)

<a id="function-function-mq3-vm-cgame-key-traps-getbinding-function-getbinding-state-key-src-mq3-vm-cgame-key-traps-ml-1901124014"></a>
### getBinding

```ml
function getBinding(state, key)
```

Get binding in vm.cgame_key_traps; the normal completion returns `state.bindings[key]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `bindings`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.vm.cgame_key_traps.validKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L79)

<a id="function-function-mq3-vm-cgame-key-traps-getcatcher-function-getcatcher-state-src-mq3-vm-cgame-key-traps-ml-249561127"></a>
### getCatcher

```ml
function getCatcher(state)
```

Get catcher in vm.cgame_key_traps; the normal completion returns `state.catcher`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `catcher`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L57)

<a id="function-function-mq3-vm-cgame-key-traps-getkey-function-getkey-state-binding-src-mq3-vm-cgame-key-traps-ml-37588476"></a>
### getKey

```ml
function getKey(state, binding)
```

Get key in vm.cgame_key_traps; the normal completion returns `- 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `bindings`. |
| `binding` | `dynamic` | — | Binding used in `(binding == void)` and `((state == void) or (binding == void))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L86)

<a id="function-function-mq3-vm-cgame-key-traps-getoverstrike-function-getoverstrike-state-src-mq3-vm-cgame-key-traps-ml-576730267"></a>
### getOverstrike

```ml
function getOverstrike(state)
```

Get overstrike in vm.cgame_key_traps; the normal completion returns `state.overstrike`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `overstrike`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L158)

<a id="function-function-mq3-vm-cgame-key-traps-hexnibble-function-hexnibble-value-src-mq3-vm-cgame-key-traps-ml-313117293"></a>
### hexNibble

```ml
function hexNibble(value)
```

Compute hex nibble in vm.cgame_key_traps; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value - 48)` and `(value - 97)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L140)

<a id="function-function-mq3-vm-cgame-key-traps-isdown-function-isdown-state-key-src-mq3-vm-cgame-key-traps-ml-760937010"></a>
### isDown

```ml
function isDown(state, key)
```

Test down in vm.cgame_key_traps; the normal completion returns `state.down[key]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `down`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.vm.cgame_key_traps.validKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L51)

<a id="function-function-mq3-vm-cgame-key-traps-keynumtostring-function-keynumtostring-key-src-mq3-vm-cgame-key-traps-ml-1981826569"></a>
### keynumToString

```ml
function keynumToString(key)
```

Exact cl_keys.c textual key ABI used by the original controls menu.  Keys absent from keynames[] intentionally retain the lowercase 0xnn spelling.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key used in `(key < 0)` and `(key > 32)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L100)

<a id="constant-constant-mq3-vm-cgame-key-traps-max-keys-const-max-keys-256-src-mq3-vm-cgame-key-traps-ml-1625006674"></a>
### MAX_KEYS

```ml
const MAX_KEYS = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L12)

<a id="function-function-mq3-vm-cgame-key-traps-services-function-services-context-src-mq3-vm-cgame-key-traps-ml-1865868249"></a>
### services

```ml
function services(context)
```

Create `mq3.vm.cgame_key_traps.Services` with context=context; isDownFn=void; getCatcherFn=void; setCatcherFn=void; getKeyFn=void.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.vm.cgame_key_traps.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L21)

- [mq3.vm.cgame_key_traps.Services](Type-mq3-vm-cgame-key-traps-services-1882952869.md) — struct
<a id="function-function-mq3-vm-cgame-key-traps-setbinding-function-setbinding-state-key-value-src-mq3-vm-cgame-key-traps-ml-1465740535"></a>
### setBinding

```ml
function setBinding(state, key, value)
```

Set binding in vm.cgame_key_traps; the normal completion returns `true`.

Direct state writes: `state.bindingSerial`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `bindings`, `bindingSerial`. Updated in place: `bindingSerial`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.vm.cgame_key_traps.validKey`. |
| `value` | `dynamic` | — | Value used in `(value == void)` and `(state.bindings[key] != value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L70)

<a id="function-function-mq3-vm-cgame-key-traps-setcatcher-function-setcatcher-state-value-src-mq3-vm-cgame-key-traps-ml-1865481612"></a>
### setCatcher

```ml
function setCatcher(state, value)
```

Set catcher in vm.cgame_key_traps; updates `state.catcher`.

Direct state writes: `state.catcher`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `catcher`. |
| `value` | `dynamic` | — | Value operand used by `setCatcher`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L63)

<a id="function-function-mq3-vm-cgame-key-traps-setdown-function-setdown-state-key-value-src-mq3-vm-cgame-key-traps-ml-1110406975"></a>
### setDown

```ml
function setDown(state, key, value)
```

Set down in vm.cgame_key_traps; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `down`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.vm.cgame_key_traps.validKey`. |
| `value` | `dynamic` | — | Value operand used by `setDown`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L44)

<a id="function-function-mq3-vm-cgame-key-traps-setoverstrike-function-setoverstrike-state-value-src-mq3-vm-cgame-key-traps-ml-1881891416"></a>
### setOverstrike

```ml
function setOverstrike(state, value)
```

Set overstrike in vm.cgame_key_traps; updates `state.overstrike`.

Direct state writes: `state.overstrike`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `overstrike`. |
| `value` | `dynamic` | — | Value operand used by `setOverstrike`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L164)

- [mq3.vm.cgame_key_traps.State](Type-mq3-vm-cgame-key-traps-state-691993510.md) — struct
<a id="function-function-mq3-vm-cgame-key-traps-stateservices-function-stateservices-state-src-mq3-vm-cgame-key-traps-ml-631302213"></a>
### stateServices

```ml
function stateServices(state)
```

Compute state services in vm.cgame_key_traps; the normal completion returns `host`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Context passed as `context` to `mq3.vm.cgame_key_traps.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L175)

<a id="function-function-mq3-vm-cgame-key-traps-stringtokeynum-function-stringtokeynum-text-src-mq3-vm-cgame-key-traps-ml-190703139"></a>
### stringToKeynum

```ml
function stringToKeynum(text)
```

Compute string to keynum in vm.cgame_key_traps; the normal completion returns `- 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `len(text)` and `bytes(text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L148)

<a id="function-function-mq3-vm-cgame-key-traps-unavailable-function-unavailable-name-src-mq3-vm-cgame-key-traps-ml-138654151"></a>
### unavailable

```ml
function unavailable(name)
```

Return `mq3.vm.cgame_key_traps.fail((name + " service unavailable"))` from `vm.cgame_key_traps.unavailable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `(name + " service unavailable")` and `fail((name + " service unavailable"))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L29)

<a id="function-function-mq3-vm-cgame-key-traps-validkey-function-validkey-key-src-mq3-vm-cgame-key-traps-ml-2042095721"></a>
### validKey

```ml
function validKey(key)
```

These state helpers mirror cl_keys.c and cl_ui.c closely enough to be shared by native input, the UI QVM and the cgame QVM without exposing VM memory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key used in `(key >= 0)` and `(key < MAX_KEYS)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/cgame_key_traps.ml#L39)
