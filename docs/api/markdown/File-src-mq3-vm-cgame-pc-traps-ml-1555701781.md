# `src/mq3/vm/cgame_pc_traps.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.cgame_pc_traps`](Package-mq3-vm-cgame-pc-traps-916956701.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/l_precomp.ml` as `lPrecomp` → [src/mq3/botlib/l_precomp.ml](File-src-mq3-botlib-l-precomp-ml-1036988431.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/pc_parser.ml` as `pcParser` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-vm-cgame-pc-traps-arg-function-arg-vm-base-index-src-mq3-vm-cgame-pc-traps-ml-1307702452"></a>
### arg

```ml
function arg(vm, base, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L43)

<a id="function-function-mq3-vm-cgame-pc-traps-callback-function-callback-host-src-mq3-vm-cgame-pc-traps-ml-372673652"></a>
### callback

```ml
function callback(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L92)

<a id="constant-constant-mq3-vm-cgame-pc-traps-cg-pc-add-global-define-const-cg-pc-add-global-define-64-src-mq3-vm-cgame-pc-traps-ml-1385293457"></a>
### CG_PC_ADD_GLOBAL_DEFINE

```ml
const CG_PC_ADD_GLOBAL_DEFINE = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L11)

<a id="constant-constant-mq3-vm-cgame-pc-traps-cg-pc-free-source-const-cg-pc-free-source-66-src-mq3-vm-cgame-pc-traps-ml-2018428675"></a>
### CG_PC_FREE_SOURCE

```ml
const CG_PC_FREE_SOURCE = 66
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L13)

<a id="constant-constant-mq3-vm-cgame-pc-traps-cg-pc-load-source-const-cg-pc-load-source-65-src-mq3-vm-cgame-pc-traps-ml-1682499112"></a>
### CG_PC_LOAD_SOURCE

```ml
const CG_PC_LOAD_SOURCE = 65
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L12)

<a id="constant-constant-mq3-vm-cgame-pc-traps-cg-pc-read-token-const-cg-pc-read-token-67-src-mq3-vm-cgame-pc-traps-ml-748534214"></a>
### CG_PC_READ_TOKEN

```ml
const CG_PC_READ_TOKEN = 67
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L14)

<a id="constant-constant-mq3-vm-cgame-pc-traps-cg-pc-source-file-and-line-const-cg-pc-source-file-and-line-68-src-mq3-vm-cgame-pc-traps-ml-2012300675"></a>
### CG_PC_SOURCE_FILE_AND_LINE

```ml
const CG_PC_SOURCE_FILE_AND_LINE = 68
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L15)

<a id="function-function-mq3-vm-cgame-pc-traps-dispatch-function-dispatch-host-vm-base-src-mq3-vm-cgame-pc-traps-ml-1389878708"></a>
### dispatch

```ml
function dispatch(host, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L79)

<a id="function-function-mq3-vm-cgame-pc-traps-fail-function-fail-message-src-mq3-vm-cgame-pc-traps-ml-1518517991"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L41)

<a id="function-function-mq3-vm-cgame-pc-traps-precomplocation-function-precomplocation-runtime-handle-src-mq3-vm-cgame-pc-traps-ml-1633593708"></a>
### precompLocation

```ml
function precompLocation(runtime, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L35)

<a id="function-function-mq3-vm-cgame-pc-traps-precompservices-function-precompservices-runtime-src-mq3-vm-cgame-pc-traps-ml-1676291368"></a>
### precompServices

```ml
function precompServices(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L38)

<a id="function-function-mq3-vm-cgame-pc-traps-readprecomptoken-function-readprecomptoken-runtime-handle-src-mq3-vm-cgame-pc-traps-ml-662229330"></a>
### readPrecompToken

```ml
function readPrecompToken(runtime, handle)
```

Full botlib l_precomp.c ownership adapter. This keeps the existing QVM ABI while sharing the same pc_parser registry used by game/cgame/UI hosts.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L31)

<a id="function-function-mq3-vm-cgame-pc-traps-readregistrytoken-function-readregistrytoken-registry-handle-src-mq3-vm-cgame-pc-traps-ml-707431495"></a>
### readRegistryToken

```ml
function readRegistryToken(registry, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L45)

<a id="function-function-mq3-vm-cgame-pc-traps-readtoken-function-readtoken-host-vm-base-src-mq3-vm-cgame-pc-traps-ml-67102234"></a>
### readToken

```ml
function readToken(host, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L61)

<a id="function-function-mq3-vm-cgame-pc-traps-registrylocation-function-registrylocation-registry-handle-src-mq3-vm-cgame-pc-traps-ml-161910523"></a>
### registryLocation

```ml
function registryLocation(registry, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L51)

<a id="function-function-mq3-vm-cgame-pc-traps-registryservices-function-registryservices-registry-src-mq3-vm-cgame-pc-traps-ml-323717305"></a>
### registryServices

```ml
function registryServices(registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L24)

<a id="function-function-mq3-vm-cgame-pc-traps-services-function-services-context-src-mq3-vm-cgame-pc-traps-ml-880764391"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L23)

- [mq3.vm.cgame_pc_traps.Services](Type-mq3-vm-cgame-pc-traps-services-1432547857.md) — struct
<a id="constant-constant-mq3-vm-cgame-pc-traps-source-name-size-const-source-name-size-64-src-mq3-vm-cgame-pc-traps-ml-1781313097"></a>
### SOURCE_NAME_SIZE

```ml
const SOURCE_NAME_SIZE = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L17)

<a id="function-function-mq3-vm-cgame-pc-traps-sourceline-function-sourceline-host-vm-base-src-mq3-vm-cgame-pc-traps-ml-1871382876"></a>
### sourceLine

```ml
function sourceLine(host, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L70)

- [mq3.vm.cgame_pc_traps.SourceLocation](Type-mq3-vm-cgame-pc-traps-sourcelocation-667073731.md) — struct
<a id="function-function-mq3-vm-cgame-pc-traps-stringcall-function-stringcall-host-vm-base-callback-name-src-mq3-vm-cgame-pc-traps-ml-946145416"></a>
### stringCall

```ml
function stringCall(host, vm, base, callback, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L56)

<a id="constant-constant-mq3-vm-cgame-pc-traps-token-size-const-token-size-1040-src-mq3-vm-cgame-pc-traps-ml-1270001136"></a>
### TOKEN_SIZE

```ml
const TOKEN_SIZE = 1040
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L16)

- [mq3.vm.cgame_pc_traps.TokenResult](Type-mq3-vm-cgame-pc-traps-tokenresult-157190231.md) — struct
<a id="function-function-mq3-vm-cgame-pc-traps-unavailable-function-unavailable-name-src-mq3-vm-cgame-pc-traps-ml-30205177"></a>
### unavailable

```ml
function unavailable(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L42)
