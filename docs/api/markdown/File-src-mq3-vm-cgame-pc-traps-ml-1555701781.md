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

Return `mq3.vm.syscall_common.argument(vm, base, index)` from `vm.cgame_pc_traps.arg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L97)

<a id="function-function-mq3-vm-cgame-pc-traps-callback-function-callback-host-src-mq3-vm-cgame-pc-traps-ml-372673652"></a>
### callback

```ml
function callback(host)
```

Apply `mq3.vm.cgame_pc_traps.dispatch` for callback in vm.cgame_pc_traps.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.cgame_pc_traps.dispatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L172)

<a id="constant-constant-mq3-vm-cgame-pc-traps-cg-pc-add-global-define-const-cg-pc-add-global-define-64-src-mq3-vm-cgame-pc-traps-ml-1385293457"></a>
### CG_PC_ADD_GLOBAL_DEFINE

```ml
const CG_PC_ADD_GLOBAL_DEFINE = 64
```

Client-game syscall number selecting the host pc add global define service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L12)

<a id="constant-constant-mq3-vm-cgame-pc-traps-cg-pc-free-source-const-cg-pc-free-source-66-src-mq3-vm-cgame-pc-traps-ml-2018428675"></a>
### CG_PC_FREE_SOURCE

```ml
const CG_PC_FREE_SOURCE = 66
```

Client-game syscall number selecting the host pc free source service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L16)

<a id="constant-constant-mq3-vm-cgame-pc-traps-cg-pc-load-source-const-cg-pc-load-source-65-src-mq3-vm-cgame-pc-traps-ml-1682499112"></a>
### CG_PC_LOAD_SOURCE

```ml
const CG_PC_LOAD_SOURCE = 65
```

Client-game syscall number selecting the host pc load source service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L14)

<a id="constant-constant-mq3-vm-cgame-pc-traps-cg-pc-read-token-const-cg-pc-read-token-67-src-mq3-vm-cgame-pc-traps-ml-748534214"></a>
### CG_PC_READ_TOKEN

```ml
const CG_PC_READ_TOKEN = 67
```

Client-game syscall number selecting the host pc read token service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L18)

<a id="constant-constant-mq3-vm-cgame-pc-traps-cg-pc-source-file-and-line-const-cg-pc-source-file-and-line-68-src-mq3-vm-cgame-pc-traps-ml-2012300675"></a>
### CG_PC_SOURCE_FILE_AND_LINE

```ml
const CG_PC_SOURCE_FILE_AND_LINE = 68
```

Client-game syscall number selecting the host pc source file and line service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L20)

<a id="function-function-mq3-vm-cgame-pc-traps-dispatch-function-dispatch-host-vm-base-src-mq3-vm-cgame-pc-traps-ml-1389878708"></a>
### dispatch

```ml
function dispatch(host, vm, base)
```

Dispatch cgame pc traps in vm.cgame_pc_traps; the normal completion returns `fail(("unsupported trap " + str(op)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `addDefineFn`, `loadSourceFn`, `freeSourceFn`, `context`. |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.cgame_pc_traps.arg`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L157)

<a id="function-function-mq3-vm-cgame-pc-traps-fail-function-fail-message-src-mq3-vm-cgame-pc-traps-ml-1518517991"></a>
### fail

```ml
function fail(message)
```

Create the vm.cgame_pc_traps error for `fail` with 7490 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("cgame PC traps: " + message)` and `error(7490, ("cgame PC traps: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L89)

<a id="function-function-mq3-vm-cgame-pc-traps-precomplocation-function-precomplocation-runtime-handle-src-mq3-vm-cgame-pc-traps-ml-1633593708"></a>
### precompLocation

```ml
function precompLocation(runtime, handle)
```

Compute precomp location in vm.cgame_pc_traps; the normal completion returns `SourceLocation(true, value[0], value[1])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.botlib.l_precomp.PC_SourceFileAndLine`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.botlib.l_precomp.PC_SourceFileAndLine`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L79)

<a id="function-function-mq3-vm-cgame-pc-traps-precompservices-function-precompservices-runtime-src-mq3-vm-cgame-pc-traps-ml-1676291368"></a>
### precompServices

```ml
function precompServices(runtime)
```

Compute precomp services in vm.cgame_pc_traps; the normal completion returns `host`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Context passed as `context` to `mq3.vm.cgame_pc_traps.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L84)

<a id="function-function-mq3-vm-cgame-pc-traps-readprecomptoken-function-readprecomptoken-runtime-handle-src-mq3-vm-cgame-pc-traps-ml-662229330"></a>
### readPrecompToken

```ml
function readPrecompToken(runtime, handle)
```

Full botlib l_precomp.c ownership adapter. This keeps the existing QVM ABI while sharing the same pc_parser registry used by game/cgame/UI hosts.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.botlib.l_precomp.PC_ReadTokenHandle`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.botlib.l_precomp.PC_ReadTokenHandle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L72)

<a id="function-function-mq3-vm-cgame-pc-traps-readregistrytoken-function-readregistrytoken-registry-handle-src-mq3-vm-cgame-pc-traps-ml-707431495"></a>
### readRegistryToken

```ml
function readRegistryToken(registry, handle)
```

Read registry token in vm.cgame_pc_traps; the normal completion returns `TokenResult(true, pcParser.encode(token))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.vm.pc_parser.read`. |
| `handle` | `dynamic` | — | Source handle passed as `sourceHandle` to `mq3.vm.pc_parser.read`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L102)

<a id="function-function-mq3-vm-cgame-pc-traps-readtoken-function-readtoken-host-vm-base-src-mq3-vm-cgame-pc-traps-ml-67102234"></a>
### readToken

```ml
function readToken(host, vm, base)
```

Read token in vm.cgame_pc_traps; the normal completion returns `1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `readTokenFn`, `context`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.cgame_pc_traps.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.cgame_pc_traps.arg`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L131)

<a id="function-function-mq3-vm-cgame-pc-traps-registrylocation-function-registrylocation-registry-handle-src-mq3-vm-cgame-pc-traps-ml-161910523"></a>
### registryLocation

```ml
function registryLocation(registry, handle)
```

Compute registry location in vm.cgame_pc_traps; the normal completion returns `SourceLocation(true, value[0], value[1])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.vm.pc_parser.location`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.vm.pc_parser.location`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L111)

<a id="function-function-mq3-vm-cgame-pc-traps-registryservices-function-registryservices-registry-src-mq3-vm-cgame-pc-traps-ml-323717305"></a>
### registryServices

```ml
function registryServices(registry)
```

Compute registry services in vm.cgame_pc_traps; the normal completion returns `host`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Context passed as `context` to `mq3.vm.cgame_pc_traps.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L63)

<a id="function-function-mq3-vm-cgame-pc-traps-services-function-services-context-src-mq3-vm-cgame-pc-traps-ml-880764391"></a>
### services

```ml
function services(context)
```

Create `mq3.vm.cgame_pc_traps.Services` with context=context; addDefineFn=void; loadSourceFn=void; freeSourceFn=void; readTokenFn=void; sourceLineFn=void.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.vm.cgame_pc_traps.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L60)

- [mq3.vm.cgame_pc_traps.Services](Type-mq3-vm-cgame-pc-traps-services-1432547857.md) — struct
<a id="constant-constant-mq3-vm-cgame-pc-traps-source-name-size-const-source-name-size-64-src-mq3-vm-cgame-pc-traps-ml-1781313097"></a>
### SOURCE_NAME_SIZE

```ml
const SOURCE_NAME_SIZE = 64
```

Byte size used for source name storage or binary layout in mq3.vm.cgame_pc_traps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L24)

<a id="function-function-mq3-vm-cgame-pc-traps-sourceline-function-sourceline-host-vm-base-src-mq3-vm-cgame-pc-traps-ml-1871382876"></a>
### sourceLine

```ml
function sourceLine(host, vm, base)
```

Compute source line in vm.cgame_pc_traps; the normal completion returns `1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `sourceLineFn`, `context`. |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.cgame_pc_traps.arg`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L144)

- [mq3.vm.cgame_pc_traps.SourceLocation](Type-mq3-vm-cgame-pc-traps-sourcelocation-667073731.md) — struct
<a id="function-function-mq3-vm-cgame-pc-traps-stringcall-function-stringcall-host-vm-base-callback-name-src-mq3-vm-cgame-pc-traps-ml-946145416"></a>
### stringCall

```ml
function stringCall(host, vm, base, callback, name)
```

Compute string call in vm.cgame_pc_traps; the normal completion returns `callback(host.context, common.readString(vm, arg(vm, base, 1)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.cgame_pc_traps.arg`. |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.vm.cgame_pc_traps.unavailable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L122)

<a id="constant-constant-mq3-vm-cgame-pc-traps-token-size-const-token-size-1040-src-mq3-vm-cgame-pc-traps-ml-1270001136"></a>
### TOKEN_SIZE

```ml
const TOKEN_SIZE = 1040
```

Byte size used for token storage or binary layout in mq3.vm.cgame_pc_traps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L22)

- [mq3.vm.cgame_pc_traps.TokenResult](Type-mq3-vm-cgame-pc-traps-tokenresult-157190231.md) — struct
<a id="function-function-mq3-vm-cgame-pc-traps-unavailable-function-unavailable-name-src-mq3-vm-cgame-pc-traps-ml-30205177"></a>
### unavailable

```ml
function unavailable(name)
```

Return `mq3.vm.cgame_pc_traps.fail((name + " service unavailable"))` from `vm.cgame_pc_traps.unavailable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `(name + " service unavailable")` and `fail((name + " service unavailable"))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/cgame_pc_traps.ml#L92)
