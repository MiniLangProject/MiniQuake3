# `src/mq3/qcommon/cvar.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.cvar`](Package-mq3-qcommon-cvar-32118784.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/q_shared_runtime.ml` as `shared` → [src/mq3/shared/q_shared_runtime.ml](File-src-mq3-shared-q-shared-runtime-ml-1830953505.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-qcommon-cvar-archive-const-archive-1-src-mq3-qcommon-cvar-ml-1201605436"></a>
### ARCHIVE

```ml
const ARCHIVE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L13)

<a id="extern_function-extern-function-mq3-qcommon-cvar-atof-extern-function-atof-text-as-cstr-from-ucrtbase-dll-returns-double-src-mq3-qcommon-cvar-ml-1664964635"></a>
### atof

```ml
extern function atof(text as cstr) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L10)

<a id="extern_function-extern-function-mq3-qcommon-cvar-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-qcommon-cvar-ml-1791065420"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L11)

<a id="function-function-mq3-qcommon-cvar-boundedstring-function-boundedstring-value-capacity-src-mq3-qcommon-cvar-ml-2012014823"></a>
### boundedString

```ml
function boundedString(value, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L114)

<a id="constant-constant-mq3-qcommon-cvar-cheat-const-cheat-512-src-mq3-qcommon-cvar-ml-81001755"></a>
### CHEAT

```ml
const CHEAT = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L22)

<a id="function-function-mq3-qcommon-cvar-commandcompletion-function-commandcompletion-registry-callback-src-mq3-qcommon-cvar-ml-363356970"></a>
### commandCompletion

```ml
function commandCompletion(registry, callback)
```

Cvar_CommandCompletion preserves the linked-list order (newest first).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L122)

<a id="function-function-mq3-qcommon-cvar-configline-function-configline-name-value-src-mq3-qcommon-cvar-ml-1283362604"></a>
### configLine

```ml
function configLine(name, value)
```

Cvar_WriteVariables.  Registry.variables is kept in the original linked-list order (newest first), so this text is also byte ordered like q3config.cfg. The native routine formats each line through a 1024-byte stack buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L257)

<a id="function-function-mq3-qcommon-cvar-create-function-create-src-mq3-qcommon-cvar-ml-341609520"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L200)

<a id="function-function-mq3-qcommon-cvar-createvm-function-createvm-src-mq3-qcommon-cvar-ml-1528945324"></a>
### createVm

```ml
function createVm()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L56)

- [mq3.qcommon.cvar.Cvar](Type-mq3-qcommon-cvar-cvar-1261759200.md) — struct
<a id="constant-constant-mq3-qcommon-cvar-file-hash-size-const-file-hash-size-256-src-mq3-qcommon-cvar-ml-2079715850"></a>
### FILE_HASH_SIZE

```ml
const FILE_HASH_SIZE = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L25)

<a id="function-function-mq3-qcommon-cvar-find-function-find-registry-name-src-mq3-qcommon-cvar-ml-1694138128"></a>
### find

```ml
function find(registry, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L103)

<a id="function-function-mq3-qcommon-cvar-generatehashvalue-function-generatehashvalue-name-src-mq3-qcommon-cvar-ml-1787223949"></a>
### generateHashValue

```ml
function generateHashValue(name)
```

generateHashValue: the original uses the ASCII-lowercased byte multiplied by its one-based position plus 118, then masks into 256 buckets.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L87)

<a id="function-function-mq3-qcommon-cvar-get-function-get-registry-name-value-flags-src-mq3-qcommon-cvar-ml-1684654296"></a>
### get

```ml
function get(registry, name, value, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L127)

<a id="function-function-mq3-qcommon-cvar-infostring-function-infostring-registry-bit-src-mq3-qcommon-cvar-ml-1860573590"></a>
### infoString

```ml
function infoString(registry, bit)
```

Cvar_InfoString and Cvar_InfoString_Big deliberately differ in insertion order because the unchanged q_shared helpers prepend small pairs and append big pairs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `bit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L218)

<a id="function-function-mq3-qcommon-cvar-infostringbig-function-infostringbig-registry-bit-src-mq3-qcommon-cvar-ml-1806309684"></a>
### infoStringBig

```ml
function infoStringBig(registry, bit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `bit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L223)

<a id="function-function-mq3-qcommon-cvar-infostringbuffer-function-infostringbuffer-registry-bit-capacity-src-mq3-qcommon-cvar-ml-1576121530"></a>
### infoStringBuffer

```ml
function infoStringBuffer(registry, bit, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `bit` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L228)

<a id="constant-constant-mq3-qcommon-cvar-init-const-init-16-src-mq3-qcommon-cvar-ml-1149122730"></a>
### INIT

```ml
const INIT = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L17)

<a id="constant-constant-mq3-qcommon-cvar-latch-const-latch-32-src-mq3-qcommon-cvar-ml-1303747494"></a>
### LATCH

```ml
const LATCH = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L18)

<a id="constant-constant-mq3-qcommon-cvar-max-cvar-value-string-const-max-cvar-value-string-256-src-mq3-qcommon-cvar-ml-1635713538"></a>
### MAX_CVAR_VALUE_STRING

```ml
const MAX_CVAR_VALUE_STRING = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L26)

<a id="constant-constant-mq3-qcommon-cvar-max-cvars-const-max-cvars-1024-src-mq3-qcommon-cvar-ml-1279850292"></a>
### MAX_CVARS

```ml
const MAX_CVARS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L24)

<a id="constant-constant-mq3-qcommon-cvar-norestart-const-norestart-1024-src-mq3-qcommon-cvar-ml-709728896"></a>
### NORESTART

```ml
const NORESTART = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L23)

<a id="function-function-mq3-qcommon-cvar-registervm-function-registervm-registry-snapshot-name-defaultvalue-flags-src-mq3-qcommon-cvar-ml-204004995"></a>
### registerVm

```ml
function registerVm(registry, snapshot, name, defaultValue, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `snapshot` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `defaultValue` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L78)

- [mq3.qcommon.cvar.Registry](Type-mq3-qcommon-cvar-registry-893386049.md) — struct
<a id="function-function-mq3-qcommon-cvar-reset-function-reset-registry-name-src-mq3-qcommon-cvar-ml-1274437518"></a>
### reset

```ml
function reset(registry, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L198)

<a id="function-function-mq3-qcommon-cvar-restart-function-restart-registry-src-mq3-qcommon-cvar-ml-1690972483"></a>
### restart

```ml
function restart(registry)
```

Cvar_Restart_f resets registered variables while preserving the stable numeric handle table used by vmCvar_t. User-created entries disappear from the linked-list view. The 1.32b source uses sizeof(var), where var is a pointer, so its x86 memset clears only the leading name pointer. Preserve that shipped behavior while avoiding access through the list.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L235)

<a id="constant-constant-mq3-qcommon-cvar-rom-const-rom-64-src-mq3-qcommon-cvar-ml-278003333"></a>
### ROM

```ml
const ROM = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L19)

<a id="constant-constant-mq3-qcommon-cvar-serverinfo-const-serverinfo-4-src-mq3-qcommon-cvar-ml-141484723"></a>
### SERVERINFO

```ml
const SERVERINFO = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L15)

<a id="function-function-mq3-qcommon-cvar-set-function-set-registry-name-value-src-mq3-qcommon-cvar-ml-1985360627"></a>
### set

```ml
function set(registry, name, value)
```

Public Cvar_Set/Cvar_SetLatched/Cvar_SetValue/Cvar_Reset entry points.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L191)

<a id="function-function-mq3-qcommon-cvar-set2-function-set2-registry-name-value-force-src-mq3-qcommon-cvar-ml-438656100"></a>
### set2

```ml
function set2(registry, name, value, force)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `force` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L154)

<a id="function-function-mq3-qcommon-cvar-setcheatstate-function-setcheatstate-registry-src-mq3-qcommon-cvar-ml-2075799881"></a>
### setCheatState

```ml
function setCheatState(registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L206)

<a id="function-function-mq3-qcommon-cvar-setlatched-function-setlatched-registry-name-value-src-mq3-qcommon-cvar-ml-715695915"></a>
### setLatched

```ml
function setLatched(registry, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L192)

<a id="function-function-mq3-qcommon-cvar-setvalue-function-setvalue-registry-name-value-src-mq3-qcommon-cvar-ml-1748457351"></a>
### setValue

```ml
function setValue(registry, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L193)

<a id="constant-constant-mq3-qcommon-cvar-systeminfo-const-systeminfo-8-src-mq3-qcommon-cvar-ml-1043293767"></a>
### SYSTEMINFO

```ml
const SYSTEMINFO = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L16)

<a id="constant-constant-mq3-qcommon-cvar-temp-const-temp-256-src-mq3-qcommon-cvar-ml-132323208"></a>
### TEMP

```ml
const TEMP = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L21)

<a id="function-function-mq3-qcommon-cvar-updatevm-function-updatevm-registry-snapshot-src-mq3-qcommon-cvar-ml-1088097737"></a>
### updateVm

```ml
function updateVm(registry, snapshot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `snapshot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L59)

<a id="constant-constant-mq3-qcommon-cvar-user-created-const-user-created-128-src-mq3-qcommon-cvar-ml-1954693268"></a>
### USER_CREATED

```ml
const USER_CREATED = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L20)

<a id="constant-constant-mq3-qcommon-cvar-userinfo-const-userinfo-2-src-mq3-qcommon-cvar-ml-1057468117"></a>
### USERINFO

```ml
const USERINFO = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L14)

<a id="function-function-mq3-qcommon-cvar-validname-function-validname-name-src-mq3-qcommon-cvar-ml-135019403"></a>
### validName

```ml
function validName(name)
```

Cvar_ValidateString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L98)

<a id="function-function-mq3-qcommon-cvar-variableintegervalue-function-variableintegervalue-registry-name-src-mq3-qcommon-cvar-ml-211007968"></a>
### variableIntegerValue

```ml
function variableIntegerValue(registry, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L112)

<a id="function-function-mq3-qcommon-cvar-variablestring-function-variablestring-registry-name-src-mq3-qcommon-cvar-ml-1874186152"></a>
### variableString

```ml
function variableString(registry, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L113)

<a id="function-function-mq3-qcommon-cvar-variablestringbuffer-function-variablestringbuffer-registry-name-capacity-src-mq3-qcommon-cvar-ml-5851012"></a>
### variableStringBuffer

```ml
function variableStringBuffer(registry, name, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L119)

<a id="function-function-mq3-qcommon-cvar-variablevalue-function-variablevalue-registry-name-src-mq3-qcommon-cvar-ml-799661910"></a>
### variableValue

```ml
function variableValue(registry, name)
```

Cvar_VariableValue / Cvar_VariableIntegerValue / Cvar_VariableString.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L111)

- [mq3.qcommon.cvar.VmCvar](Type-mq3-qcommon-cvar-vmcvar-334256681.md) — struct
<a id="function-function-mq3-qcommon-cvar-writevariables-function-writevariables-registry-src-mq3-qcommon-cvar-ml-1062832945"></a>
### writeVariables

```ml
function writeVariables(registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/cvar.ml#L263)
