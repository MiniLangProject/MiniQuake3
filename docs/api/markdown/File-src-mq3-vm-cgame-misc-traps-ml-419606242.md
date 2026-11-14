# `src/mq3/vm/cgame_misc_traps.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.cgame_misc_traps`](Package-mq3-vm-cgame-misc-traps-1027681472.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)
- `std/time.ml` as `time` → `../MiniLangCompilerML/std/time.ml` — external dependency

## Declarations

<a id="function-function-mq3-vm-cgame-misc-traps-createentitytokens-function-createentitytokens-source-src-mq3-vm-cgame-misc-traps-ml-1719441217"></a>
### createEntityTokens

```ml
function createEntityTokens(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_misc_traps.ml#L59)

<a id="function-function-mq3-vm-cgame-misc-traps-encodeqtime-function-encodeqtime-value-isdst-src-mq3-vm-cgame-misc-traps-ml-178341652"></a>
### encodeQtime

```ml
function encodeQtime(value, isDst)
```

qtime_t is nine consecutive native-QVM ints. Its month and year retain the C library conventions used by Com_RealTime (January=0, year since 1900).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `isDst` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_misc_traps.ml#L22)

<a id="function-function-mq3-vm-cgame-misc-traps-entitytoken-function-entitytoken-vm-address-capacity-state-src-mq3-vm-cgame-misc-traps-ml-1774267768"></a>
### entityToken

```ml
function entityToken(vm, address, capacity, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_misc_traps.ml#L80)

- [mq3.vm.cgame_misc_traps.EntityTokens](Type-mq3-vm-cgame-misc-traps-entitytokens-1592594087.md) — struct
<a id="function-function-mq3-vm-cgame-misc-traps-fail-function-fail-message-src-mq3-vm-cgame-misc-traps-ml-1634157975"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_misc_traps.ml#L18)

<a id="function-function-mq3-vm-cgame-misc-traps-nextentitytoken-function-nextentitytoken-state-src-mq3-vm-cgame-misc-traps-ml-127692459"></a>
### nextEntityToken

```ml
function nextEntityToken(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_misc_traps.ml#L70)

<a id="constant-constant-mq3-vm-cgame-misc-traps-qtime-size-const-qtime-size-36-src-mq3-vm-cgame-misc-traps-ml-1671013500"></a>
### QTIME_SIZE

```ml
const QTIME_SIZE = 36
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_misc_traps.ml#L12)

<a id="function-function-mq3-vm-cgame-misc-traps-realtime-function-realtime-vm-address-value-src-mq3-vm-cgame-misc-traps-ml-402755248"></a>
### realTime

```ml
function realTime(vm, address, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_misc_traps.ml#L44)

- [mq3.vm.cgame_misc_traps.RealTimeValue](Type-mq3-vm-cgame-misc-traps-realtimevalue-764669160.md) — struct
<a id="function-function-mq3-vm-cgame-misc-traps-resetentitytokens-function-resetentitytokens-state-src-mq3-vm-cgame-misc-traps-ml-870151357"></a>
### resetEntityTokens

```ml
function resetEntityTokens(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_misc_traps.ml#L65)

<a id="function-function-mq3-vm-cgame-misc-traps-samplerealtime-function-samplerealtime-src-mq3-vm-cgame-misc-traps-ml-1714640160"></a>
### sampleRealTime

```ml
function sampleRealTime()
```

The standard library exposes portable UTC/local wall clocks but not the platform DST flag. -1 is the C tm value for "unknown" and preserves the ABI without claiming a wrong daylight-saving state.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_misc_traps.ml#L36)

<a id="function-function-mq3-vm-cgame-misc-traps-snapvector-function-snapvector-vm-address-src-mq3-vm-cgame-misc-traps-ml-1507398043"></a>
### snapVector

```ml
function snapVector(vm, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_misc_traps.ml#L52)

- [mq3.vm.cgame_misc_traps.TokenResult](Type-mq3-vm-cgame-misc-traps-tokenresult-839842278.md) — struct
