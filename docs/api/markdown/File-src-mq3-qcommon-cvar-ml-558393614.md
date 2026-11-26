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

Configuration-variable flag requesting persistence in the user configuration file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L20)

<a id="extern_function-extern-function-mq3-qcommon-cvar-atof-extern-function-atof-text-as-cstr-from-ucrtbase-dll-returns-double-src-mq3-qcommon-cvar-ml-1664964635"></a>
### atof

```ml
extern function atof(text as cstr) from "ucrtbase.dll" returns double
```

Convert a C-string floating-point numeric prefix for qcommon.cvar.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — | Null-terminated narrow numeric text accepted by the C runtime. |


**Returns:** The converted double; zero when no number is recognized.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L13)

<a id="extern_function-extern-function-mq3-qcommon-cvar-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-qcommon-cvar-ml-1791065420"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

Convert a C-string signed decimal integer prefix for qcommon.cvar.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — | Null-terminated narrow numeric text accepted by the C runtime. |


**Returns:** The converted signed integer; zero when no number is recognized.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L17)

<a id="function-function-mq3-qcommon-cvar-boundedstring-function-boundedstring-value-capacity-src-mq3-qcommon-cvar-ml-2012014823"></a>
### boundedString

```ml
function boundedString(value, capacity)
```

Compute bounded string in qcommon.cvar; the normal completion returns `decode(slice(data, 0, count))`.

Validation failures include `Cvar_VariableStringBuffer invalid size`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `bytes(value)`. |
| `capacity` | `dynamic` | — | Capacity used in `(capacity < 1)` and `(capacity - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L190)

<a id="constant-constant-mq3-qcommon-cvar-cheat-const-cheat-512-src-mq3-qcommon-cvar-ml-81001755"></a>
### CHEAT

```ml
const CHEAT = 512
```

Configuration-variable flag restricting changes while cheats are disabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L38)

<a id="function-function-mq3-qcommon-cvar-commandcompletion-function-commandcompletion-registry-callback-src-mq3-qcommon-cvar-ml-363356970"></a>
### commandCompletion

```ml
function commandCompletion(registry, callback)
```

Cvar_CommandCompletion preserves the linked-list order (newest first).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `variables`. |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L204)

<a id="function-function-mq3-qcommon-cvar-configline-function-configline-name-value-src-mq3-qcommon-cvar-ml-1283362604"></a>
### configLine

```ml
function configLine(name, value)
```

Cvar_WriteVariables.  Registry.variables is kept in the original linked-list order (newest first), so this text is also byte ordered like q3config.cfg. The native routine formats each line through a 1024-byte stack buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `("seta " + name)` and `(("seta " + name) + " \\"")`. |
| `value` | `dynamic` | — | Value used in `((("seta " + name) + " \\"") + value)` and `(((("seta " + name) + " \\"") + value) + "\\"\\n")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L383)

<a id="function-function-mq3-qcommon-cvar-create-function-create-src-mq3-qcommon-cvar-ml-341609520"></a>
### create

```ml
function create()
```

Create cvar in qcommon.cvar; the normal completion returns `registry`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L312)

<a id="function-function-mq3-qcommon-cvar-createvm-function-createvm-src-mq3-qcommon-cvar-ml-1528945324"></a>
### createVm

```ml
function createVm()
```

Create `mq3.qcommon.cvar.VmCvar` with handle=0; modificationCount=0; value=0.0; integer=0; string=""; copyGeneration=0.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L100)

- [mq3.qcommon.cvar.Cvar](Type-mq3-qcommon-cvar-cvar-1261759200.md) — struct
<a id="constant-constant-mq3-qcommon-cvar-file-hash-size-const-file-hash-size-256-src-mq3-qcommon-cvar-ml-2079715850"></a>
### FILE_HASH_SIZE

```ml
const FILE_HASH_SIZE = 256
```

Number of hash buckets used for file-name lookup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L44)

<a id="function-function-mq3-qcommon-cvar-find-function-find-registry-name-src-mq3-qcommon-cvar-ml-1694138128"></a>
### find

```ml
function find(registry, name)
```

Find cvar in qcommon.cvar.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `variables`. |
| `name` | `dynamic` | — | Name used in `stringEqualsIgnoreCaseAscii(variable.name, name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L166)

<a id="function-function-mq3-qcommon-cvar-generatehashvalue-function-generatehashvalue-name-src-mq3-qcommon-cvar-ml-1787223949"></a>
### generateHashValue

```ml
function generateHashValue(name)
```

generateHashValue: the original uses the ASCII-lowercased byte multiplied by its one-based position plus 118, then masks into 256 buckets.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `bytes(name)` and `(name == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L146)

<a id="function-function-mq3-qcommon-cvar-get-function-get-registry-name-value-flags-src-mq3-qcommon-cvar-ml-1684654296"></a>
### get

```ml
function get(registry, name, value, flags)
```

Get cvar in qcommon.cvar; the normal completion returns `variable`.

Validation failures include `Cvar_Get NULL parameter`; `MAX_CVARS`.
Direct state writes: `registry.modifiedFlags`, `registry.numIndexes`, `registry.indexes`, `registry.variables`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `modifiedFlags`, `numIndexes`, `indexes`, `variables`. Updated in place: `modifiedFlags`, `numIndexes`, `indexes`, `variables`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.cvar.validName`. |
| `value` | `dynamic` | — | Initial `string` field stored in the returned or constructed `mq3.qcommon.cvar.Cvar` record. |
| `flags` | `dynamic` | — | Initial `flags` field stored in the returned or constructed `mq3.qcommon.cvar.Cvar` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L217)

<a id="function-function-mq3-qcommon-cvar-infostring-function-infostring-registry-bit-src-mq3-qcommon-cvar-ml-1860573590"></a>
### infoString

```ml
function infoString(registry, bit)
```

Cvar_InfoString and Cvar_InfoString_Big deliberately differ in insertion order because the unchanged q_shared helpers prepend small pairs and append big pairs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `variables`. |
| `bit` | `dynamic` | — | Bit used in `(variable.flags & bit)` and `((variable.flags & bit) != 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L334)

<a id="function-function-mq3-qcommon-cvar-infostringbig-function-infostringbig-registry-bit-src-mq3-qcommon-cvar-ml-1806309684"></a>
### infoStringBig

```ml
function infoStringBig(registry, bit)
```

Compute info string big in qcommon.cvar; the normal completion returns `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `variables`. |
| `bit` | `dynamic` | — | Bit used in `(variable.flags & bit)` and `((variable.flags & bit) != 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L342)

<a id="function-function-mq3-qcommon-cvar-infostringbuffer-function-infostringbuffer-registry-bit-capacity-src-mq3-qcommon-cvar-ml-1576121530"></a>
### infoStringBuffer

```ml
function infoStringBuffer(registry, bit, capacity)
```

Return `mq3.qcommon.cvar.boundedString(infoString(registry, bit), capacity)` from `qcommon.cvar.infoStringBuffer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.infoString`. |
| `bit` | `dynamic` | — | Bit passed as `bit` to `mq3.qcommon.cvar.infoString`. |
| `capacity` | `dynamic` | — | Capacity passed as `capacity` to `mq3.qcommon.cvar.boundedString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L351)

<a id="constant-constant-mq3-qcommon-cvar-init-const-init-16-src-mq3-qcommon-cvar-ml-1149122730"></a>
### INIT

```ml
const INIT = 16
```

Configuration-variable flag restricting changes to startup initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L28)

<a id="constant-constant-mq3-qcommon-cvar-latch-const-latch-32-src-mq3-qcommon-cvar-ml-1303747494"></a>
### LATCH

```ml
const LATCH = 32
```

Configuration-variable flag deferring a changed value until the relevant restart.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L30)

<a id="constant-constant-mq3-qcommon-cvar-max-cvar-value-string-const-max-cvar-value-string-256-src-mq3-qcommon-cvar-ml-1635713538"></a>
### MAX_CVAR_VALUE_STRING

```ml
const MAX_CVAR_VALUE_STRING = 256
```

Maximum text length accepted for a configuration-variable value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L46)

<a id="constant-constant-mq3-qcommon-cvar-max-cvars-const-max-cvars-1024-src-mq3-qcommon-cvar-ml-1279850292"></a>
### MAX_CVARS

```ml
const MAX_CVARS = 1024
```

Maximum number of registered configuration variables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L42)

<a id="constant-constant-mq3-qcommon-cvar-norestart-const-norestart-1024-src-mq3-qcommon-cvar-ml-709728896"></a>
### NORESTART

```ml
const NORESTART = 1024
```

Configuration-variable flag preserving the variable across registry restart.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L40)

<a id="function-function-mq3-qcommon-cvar-registervm-function-registervm-registry-snapshot-name-defaultvalue-flags-src-mq3-qcommon-cvar-ml-204004995"></a>
### registerVm

```ml
function registerVm(registry, snapshot, name, defaultValue, flags)
```

Register vm in qcommon.cvar; the normal completion returns `updateVm(registry, snapshot)`.

Direct state writes: `snapshot.handle`, `snapshot.modificationCount`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.get`. |
| `snapshot` | `dynamic` | — | Updated in place: `handle`, `modificationCount`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.cvar.get`. |
| `defaultValue` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.cvar.get`. |
| `flags` | `dynamic` | — | Flags passed as `flags` to `mq3.qcommon.cvar.get`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L136)

- [mq3.qcommon.cvar.Registry](Type-mq3-qcommon-cvar-registry-893386049.md) — struct
<a id="function-function-mq3-qcommon-cvar-reset-function-reset-registry-name-src-mq3-qcommon-cvar-ml-1274437518"></a>
### reset

```ml
function reset(registry, name)
```

Reset cvar in qcommon.cvar.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.set2`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.cvar.set2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L309)

<a id="function-function-mq3-qcommon-cvar-restart-function-restart-registry-src-mq3-qcommon-cvar-ml-1690972483"></a>
### restart

```ml
function restart(registry)
```

Cvar_Restart_f resets registered variables while preserving the stable numeric handle table used by vmCvar_t. User-created entries disappear from the linked-list view. The 1.32b source uses sizeof(var), where var is a pointer, so its x86 memset clears only the leading name pointer. Preserve that shipped behavior while avoiding access through the list.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `variables`. Updated in place: `variables`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L359)

<a id="constant-constant-mq3-qcommon-cvar-rom-const-rom-64-src-mq3-qcommon-cvar-ml-278003333"></a>
### ROM

```ml
const ROM = 64
```

Configuration-variable flag preventing ordinary user modification.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L32)

<a id="constant-constant-mq3-qcommon-cvar-serverinfo-const-serverinfo-4-src-mq3-qcommon-cvar-ml-141484723"></a>
### SERVERINFO

```ml
const SERVERINFO = 4
```

Configuration-variable flag including the value in server information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L24)

<a id="function-function-mq3-qcommon-cvar-set-function-set-registry-name-value-src-mq3-qcommon-cvar-ml-1985360627"></a>
### set

```ml
function set(registry, name, value)
```

Public Cvar_Set/Cvar_SetLatched/Cvar_SetValue/Cvar_Reset entry points.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.set2`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.cvar.set2`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.cvar.set2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L291)

<a id="function-function-mq3-qcommon-cvar-set2-function-set2-registry-name-value-force-src-mq3-qcommon-cvar-ml-438656100"></a>
### set2

```ml
function set2(registry, name, value, force)
```

Set 2 in qcommon.cvar; the normal completion returns `variable`.

Direct state writes: `registry.modifiedFlags`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `modifiedFlags`. Updated in place: `modifiedFlags`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.cvar.validName`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.cvar.get`. |
| `force` | `dynamic` | — | Force operand used by `set2`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L251)

<a id="function-function-mq3-qcommon-cvar-setcheatstate-function-setcheatstate-registry-src-mq3-qcommon-cvar-ml-2075799881"></a>
### setCheatState

```ml
function setCheatState(registry)
```

Set cheat state in qcommon.cvar.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `variables`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L320)

<a id="function-function-mq3-qcommon-cvar-setlatched-function-setlatched-registry-name-value-src-mq3-qcommon-cvar-ml-715695915"></a>
### setLatched

```ml
function setLatched(registry, name, value)
```

Set latched in qcommon.cvar.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.set2`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.cvar.set2`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.cvar.set2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L296)

<a id="function-function-mq3-qcommon-cvar-setvalue-function-setvalue-registry-name-value-src-mq3-qcommon-cvar-ml-1748457351"></a>
### setValue

```ml
function setValue(registry, name, value)
```

Set value in qcommon.cvar; the normal completion returns `set(registry, name, text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.set`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.cvar.set`. |
| `value` | `dynamic` | — | Floating-point value to narrow to binary32. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L301)

<a id="constant-constant-mq3-qcommon-cvar-systeminfo-const-systeminfo-8-src-mq3-qcommon-cvar-ml-1043293767"></a>
### SYSTEMINFO

```ml
const SYSTEMINFO = 8
```

Configuration-variable flag including the value in replicated system information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L26)

<a id="constant-constant-mq3-qcommon-cvar-temp-const-temp-256-src-mq3-qcommon-cvar-ml-132323208"></a>
### TEMP

```ml
const TEMP = 256
```

Configuration-variable flag marking a non-persistent temporary value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L36)

<a id="function-function-mq3-qcommon-cvar-updatevm-function-updatevm-registry-snapshot-src-mq3-qcommon-cvar-ml-1088097737"></a>
### updateVm

```ml
function updateVm(registry, snapshot)
```

Update vm in qcommon.cvar.

Validation failures include `Cvar_Update NULL snapshot`; `Cvar_Update handle out of range`; `Cvar_Update exceeds native string storage`.
Direct state writes: `snapshot.modificationCount`, `snapshot.string`, `snapshot.value`, `snapshot.integer`, `snapshot.copyGeneration`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `numIndexes`, `indexes`. |
| `snapshot` | `dynamic` | — | Record exposing `handle`, `modificationCount`, `copyGeneration`. Updated in place: `modificationCount`, `string`, `value`, `integer`, `copyGeneration`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L109)

<a id="constant-constant-mq3-qcommon-cvar-user-created-const-user-created-128-src-mq3-qcommon-cvar-ml-1954693268"></a>
### USER_CREATED

```ml
const USER_CREATED = 128
```

Configuration-variable flag marking a variable created by the user.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L34)

<a id="constant-constant-mq3-qcommon-cvar-userinfo-const-userinfo-2-src-mq3-qcommon-cvar-ml-1057468117"></a>
### USERINFO

```ml
const USERINFO = 2
```

Configuration-variable flag including the value in client user information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L22)

<a id="function-function-mq3-qcommon-cvar-validname-function-validname-name-src-mq3-qcommon-cvar-ml-135019403"></a>
### validName

```ml
function validName(name)
```

Cvar_ValidateString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `(name == void)` and `strings.indexOf(name, ";", 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L158)

<a id="function-function-mq3-qcommon-cvar-variableintegervalue-function-variableintegervalue-registry-name-src-mq3-qcommon-cvar-ml-211007968"></a>
### variableIntegerValue

```ml
function variableIntegerValue(registry, name)
```

Compute variable integer value in qcommon.cvar; the normal completion returns `variable.integer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.find`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.cvar.find`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L180)

<a id="function-function-mq3-qcommon-cvar-variablestring-function-variablestring-registry-name-src-mq3-qcommon-cvar-ml-1874186152"></a>
### variableString

```ml
function variableString(registry, name)
```

Compute variable string in qcommon.cvar; the normal completion returns `variable.string`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.find`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.cvar.find`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L184)

<a id="function-function-mq3-qcommon-cvar-variablestringbuffer-function-variablestringbuffer-registry-name-capacity-src-mq3-qcommon-cvar-ml-5851012"></a>
### variableStringBuffer

```ml
function variableStringBuffer(registry, name, capacity)
```

Return `mq3.qcommon.cvar.boundedString(variableString(registry, name), capacity)` from `qcommon.cvar.variableStringBuffer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.variableString`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.cvar.variableString`. |
| `capacity` | `dynamic` | — | Capacity passed as `capacity` to `mq3.qcommon.cvar.boundedString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L199)

<a id="function-function-mq3-qcommon-cvar-variablevalue-function-variablevalue-registry-name-src-mq3-qcommon-cvar-ml-799661910"></a>
### variableValue

```ml
function variableValue(registry, name)
```

Cvar_VariableValue / Cvar_VariableIntegerValue / Cvar_VariableString.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.find`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.cvar.find`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L176)

- [mq3.qcommon.cvar.VmCvar](Type-mq3-qcommon-cvar-vmcvar-334256681.md) — struct
<a id="function-function-mq3-qcommon-cvar-writevariables-function-writevariables-registry-src-mq3-qcommon-cvar-ml-1062832945"></a>
### writeVariables

```ml
function writeVariables(registry)
```

Write variables in qcommon.cvar; the normal completion returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Record exposing `variables`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L391)
