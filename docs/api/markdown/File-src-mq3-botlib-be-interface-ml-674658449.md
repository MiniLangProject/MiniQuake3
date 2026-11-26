# `src/mq3/botlib/be_interface.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.be_interface`](Package-mq3-botlib-be-interface-1225273141.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/lifecycle_runtime.ml` as `botLifecycleRuntime` → [src/mq3/botlib/lifecycle_runtime.ml](File-src-mq3-botlib-lifecycle-runtime-ml-1352513457.md)
- `mq3/botlib/public_headers.ml` as `publicHeaders` → [src/mq3/botlib/public_headers.ml](File-src-mq3-botlib-public-headers-ml-206085358.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/pc_parser.ml` as `pc` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)

## Declarations

<a id="function-function-mq3-botlib-be-interface-aasexports-function-aasexports-src-mq3-botlib-be-interface-ml-368905946"></a>
### aasExports

```ml
function aasExports()
```

Return the ordered aas exports table for be interface: 22 entries beginning with `["AAS_EntityInfo","AAS_EntityInfo"]` and `["AAS_Initialized","AAS_Initialized"]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L259)

<a id="function-function-mq3-botlib-be-interface-aiexports-function-aiexports-src-mq3-botlib-be-interface-ml-721689012"></a>
### aiExports

```ml
function aiExports()
```

Return the ordered ai exports table for be interface: 75 entries beginning with `["BotLoadCharacter","BotLoadCharacter"]` and `["BotFreeCharacter","BotFreeCharacter"]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L263)

- [mq3.botlib.be_interface.Api](Type-mq3-botlib-be-interface-api-1768285179.md) — struct
<a id="constant-constant-mq3-botlib-be-interface-blerr-invalidentitynumber-const-blerr-invalidentitynumber-publicheaders-blerr-invalidentitynumber-src-mq3-botlib-be-interface-ml-1712564057"></a>
### BLERR_INVALIDENTITYNUMBER

```ml
const BLERR_INVALIDENTITYNUMBER = publicHeaders.BLERR_INVALIDENTITYNUMBER
```

Bot-library error indicating an out-of-range entity number.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L21)

<a id="constant-constant-mq3-botlib-be-interface-blerr-librarynotsetup-const-blerr-librarynotsetup-publicheaders-blerr-librarynotsetup-src-mq3-botlib-be-interface-ml-304496869"></a>
### BLERR_LIBRARYNOTSETUP

```ml
const BLERR_LIBRARYNOTSETUP = publicHeaders.BLERR_LIBRARYNOTSETUP
```

Bot-library error indicating that setup has not completed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L19)

<a id="constant-constant-mq3-botlib-be-interface-blerr-noerror-const-blerr-noerror-publicheaders-blerr-noerror-src-mq3-botlib-be-interface-ml-374925519"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = publicHeaders.BLERR_NOERROR
```

Bot-library status indicating successful completion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L17)

<a id="function-function-mq3-botlib-be-interface-botexporttest-function-botexporttest-parm0-parm1-parm2-parm3-src-mq3-botlib-be-interface-ml-186296480"></a>
### BotExportTest

```ml
function BotExportTest(parm0, parm1, parm2, parm3)
```

Return `0` for `BotExportTest`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parm0` | `dynamic` | — | Not read by this implementation; retained in the `BotExportTest` signature. |
| `parm1` | `dynamic` | — | Not read by this implementation; retained in the `BotExportTest` signature. |
| `parm2` | `dynamic` | — | Not read by this implementation; retained in the `BotExportTest` signature. |
| `parm3` | `dynamic` | — | Not read by this implementation; retained in the `BotExportTest` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L227)

<a id="constant-constant-mq3-botlib-be-interface-botlib-api-version-const-botlib-api-version-publicheaders-botlib-api-version-src-mq3-botlib-be-interface-ml-772952670"></a>
### BOTLIB_API_VERSION

```ml
const BOTLIB_API_VERSION = publicHeaders.BOTLIB_API_VERSION
```

Serialized format or interface version expected by be interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L15)

<a id="function-function-mq3-botlib-be-interface-botlibsetup-function-botlibsetup-state-src-mq3-botlib-be-interface-ml-801838051"></a>
### BotLibSetup

```ml
function BotLibSetup(state)
```

Test `state!=void and state.setup` as the condition for `BotLibSetup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be interface state; accesses `setup`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L132)

<a id="function-function-mq3-botlib-be-interface-eaexports-function-eaexports-src-mq3-botlib-be-interface-ml-1451714588"></a>
### eaExports

```ml
function eaExports()
```

Return the ordered ea exports table for be interface: 24 entries beginning with `["EA_Command","EA_Command"]` and `["EA_Say","EA_Say"]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L261)

<a id="function-function-mq3-botlib-be-interface-export-botlibloadmap-function-export-botlibloadmap-state-mapname-service-src-mq3-botlib-be-interface-ml-1445466105"></a>
### Export_BotLibLoadMap

```ml
function Export_BotLibLoadMap(state, mapName, service)
```

Set `state.mapName` to `mapName` and `state.mapLoads` to `state.mapLoads+1` in `mq3.botlib.be_interface.Export_BotLibLoadMap`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be interface state; accesses `mapName` and `mapLoads`. May update `state.mapName` and `state.mapLoads` in place. |
| `mapName` | `dynamic` | — | Value passed as argument 2 to `callback`. |
| `service` | `dynamic` | — | Service record; accesses `aasLoadMapFn`, `initLevelItemsFn` and `setBrushModelTypesFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L190)

<a id="function-function-mq3-botlib-be-interface-export-botlibsetup-function-export-botlibsetup-state-service-src-mq3-botlib-be-interface-ml-801424302"></a>
### Export_BotLibSetup

```ml
function Export_BotLibSetup(state, service)
```

Update `state.developer`, `state.setup`, `state.maxclients` and `state.maxentities` and related state during `Export_BotLibSetup`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be interface state; accesses `developer`, `setup`, `maxclients`, `maxentities` and `mapName` and related fields. May update `state.developer`, `state.setup` and `state.maxclients` and additional fields in place. |
| `service` | `dynamic` | — | Service record; accesses `aasSetupFn`, `eaSetupFn`, `weaponSetupFn`, `goalSetupFn` and `chatSetupFn` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L137)

<a id="function-function-mq3-botlib-be-interface-export-botlibshutdown-function-export-botlibshutdown-state-service-registry-src-mq3-botlib-be-interface-ml-1146898295"></a>
### Export_BotLibShutdown

```ml
function Export_BotLibShutdown(state, service, registry)
```

Apply `mq3.botlib.be_interface.BotLibSetup`, `mq3.botlib.be_interface.services` and `mq3.botlib.be_interface.invoke` while evaluating `Export_BotLibShutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be interface state; accesses `setup`. |
| `service` | `dynamic` | — | Service record; accesses `chatShutdownFn`, `moveShutdownFn`, `goalShutdownFn`, `weaponShutdownFn` and `weightsShutdownFn` and related fields. |
| `registry` | `dynamic` | — | Registry record; accesses `defines`. May update `registry.defines` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L153)

<a id="function-function-mq3-botlib-be-interface-export-botlibstartframe-function-export-botlibstartframe-state-time-service-src-mq3-botlib-be-interface-ml-1869798413"></a>
### Export_BotLibStartFrame

```ml
function Export_BotLibStartFrame(state, time, service)
```

Set `state.time` to `time` and `state.frames` to `state.frames+1` in `mq3.botlib.be_interface.Export_BotLibStartFrame`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be interface state; accesses `time` and `frames`. May update `state.time` and `state.frames` in place. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |
| `service` | `dynamic` | — | Service record; accesses `aasStartFrameFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L180)

<a id="function-function-mq3-botlib-be-interface-export-botlibupdateentity-function-export-botlibupdateentity-state-entity-present-service-src-mq3-botlib-be-interface-ml-841227422"></a>
### Export_BotLibUpdateEntity

```ml
function Export_BotLibUpdateEntity(state, entity, present, service)
```

Set `state.entityUpdates` to `state.entityUpdates+1` and `state.removedEntities` to `state.removedEntities+1` in `mq3.botlib.be_interface.Export_BotLibUpdateEntity`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be interface state; accesses `entityUpdates` and `removedEntities`. May update `state.entityUpdates` and `state.removedEntities` in place. |
| `entity` | `dynamic` | — | Operand used to evaluate the returned expression `state!=void and number>=0 and number<=state.maxentities`. |
| `present` | `dynamic` | — | Value passed as argument 3 to `callback`. |
| `service` | `dynamic` | — | Service record; accesses `aasUpdateEntityFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L204)

<a id="function-function-mq3-botlib-be-interface-export-botlibupdateentityplain-function-export-botlibupdateentityplain-state-entity-present-src-mq3-botlib-be-interface-ml-800070015"></a>
### Export_BotLibUpdateEntityPlain

```ml
function Export_BotLibUpdateEntityPlain(state, entity, present)
```

The QVM host has no aasUpdateEntity callback: it applies the entity state immediately after the lifecycle check. Avoid constructing an empty Services object for the 1024 entity slots visited on every original bot frame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be interface state; accesses `entityUpdates` and `removedEntities`. May update `state.entityUpdates` and `state.removedEntities` in place. |
| `entity` | `dynamic` | — | Operand used to evaluate the returned expression `state!=void and number>=0 and number<=state.maxentities`. |
| `present` | `dynamic` | — | Value used by `Export_BotLibUpdateEntityPlain` in `if not present then state.removedEntities=state.removedEntities+1 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L217)

<a id="function-function-mq3-botlib-be-interface-export-botlibvarget-function-export-botlibvarget-state-name-size-src-mq3-botlib-be-interface-ml-642749375"></a>
### Export_BotLibVarGet

```ml
function Export_BotLibVarGet(state, name, size)
```

Apply `mq3.botlib.lifecycle_runtime.varGet` while evaluating `Export_BotLibVarGet`. Return paths include `decode(slice(data,0,count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L172)

<a id="function-function-mq3-botlib-be-interface-export-botlibvarset-function-export-botlibvarset-state-name-value-src-mq3-botlib-be-interface-ml-1707202181"></a>
### Export_BotLibVarSet

```ml
function Export_BotLibVarSet(state, name, value)
```

Forward `Export_BotLibVarSet` to `mq3.botlib.lifecycle_runtime.varSet` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lib variables state; accesses `variables`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `value` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L167)

<a id="function-function-mq3-botlib-be-interface-getbotlibapi-function-getbotlibapi-apiversion-importvalid-src-mq3-botlib-be-interface-ml-618187637"></a>
### GetBotLibAPI

```ml
function GetBotLibAPI(apiVersion, importValid)
```

Build the `mq3.botlib.be_interface.Api` result for `GetBotLibAPI`. Return paths include `Api(apiVersion,topExports(),aasExports(),eaExports(),aiExports())`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `apiVersion` | `dynamic` | — | Initial value stored in `mq3.botlib.be_interface.Api.version`. |
| `importValid` | `dynamic` | — | Value used by `GetBotLibAPI` in `if not importValid or apiVersion!=BOTLIB_API_VERSION then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L268)

<a id="function-function-mq3-botlib-be-interface-invoke-function-invoke-service-callback-src-mq3-botlib-be-interface-ml-1491904436"></a>
### invoke

```ml
function invoke(service, callback)
```

Call an optional host service with its context and normalize missing or void results to BLERR_NOERROR.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `service` | `dynamic` | — | Service record; accesses `context`. |
| `callback` | `dynamic` | — | Callback invoked by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L95)

<a id="function-function-mq3-botlib-be-interface-invoke1-function-invoke1-service-callback-value-src-mq3-botlib-be-interface-ml-1550701497"></a>
### invoke1

```ml
function invoke1(service, callback, value)
```

Call an optional one-argument host service and normalize missing or void results to BLERR_NOERROR.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `service` | `dynamic` | — | Service record; accesses `context`. |
| `callback` | `dynamic` | — | Callback invoked by this operation. |
| `value` | `dynamic` | — | Value passed as argument 2 to `callback`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L103)

<a id="function-function-mq3-botlib-be-interface-invoke2-function-invoke2-service-callback-first-second-src-mq3-botlib-be-interface-ml-333135776"></a>
### invoke2

```ml
function invoke2(service, callback, first, second)
```

Call an optional two-argument host service and normalize missing or void results to BLERR_NOERROR.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `service` | `dynamic` | — | Service record; accesses `context`. |
| `callback` | `dynamic` | — | Callback invoked by this operation. |
| `first` | `dynamic` | — | Value passed as argument 2 to `callback`. |
| `second` | `dynamic` | — | Value passed as argument 3 to `callback`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L112)

<a id="function-function-mq3-botlib-be-interface-pc-addglobaldefine-function-pc-addglobaldefine-registry-text-src-mq3-botlib-be-interface-ml-2064370058"></a>
### PC_AddGlobalDefine

```ml
function PC_AddGlobalDefine(registry, text)
```

Forward `PC_AddGlobalDefine` to `mq3.vm.pc_parser.addDefine` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L232)

<a id="function-function-mq3-botlib-be-interface-pc-checkopensourcehandles-function-pc-checkopensourcehandles-registry-src-mq3-botlib-be-interface-ml-1367890269"></a>
### PC_CheckOpenSourceHandles

```ml
function PC_CheckOpenSourceHandles(registry)
```

Count open source handles in the shared preprocessor registry.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L251)

<a id="function-function-mq3-botlib-be-interface-pc-freesourcehandle-function-pc-freesourcehandle-registry-handle-src-mq3-botlib-be-interface-ml-403825917"></a>
### PC_FreeSourceHandle

```ml
function PC_FreeSourceHandle(registry, handle)
```

Forward `PC_FreeSourceHandle` to `mq3.vm.pc_parser.free` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources`. May update `registry.sources[handle]` in place. |
| `handle` | `dynamic` | — | Handle identifying the allocated preprocessor source. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L240)

<a id="function-function-mq3-botlib-be-interface-pc-loadsourcehandle-function-pc-loadsourcehandle-registry-name-src-mq3-botlib-be-interface-ml-2108239588"></a>
### PC_LoadSourceHandle

```ml
function PC_LoadSourceHandle(registry, name)
```

Forward `PC_LoadSourceHandle` to `mq3.vm.pc_parser.load` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `loadFn`, `sources` and `context`. May update `registry.sources[slot]` in place. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L236)

<a id="function-function-mq3-botlib-be-interface-pc-readtokenhandle-function-pc-readtokenhandle-registry-handle-src-mq3-botlib-be-interface-ml-538967307"></a>
### PC_ReadTokenHandle

```ml
function PC_ReadTokenHandle(registry, handle)
```

Forward `PC_ReadTokenHandle` to `mq3.vm.pc_parser.read` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L244)

<a id="function-function-mq3-botlib-be-interface-pc-sourcefileandline-function-pc-sourcefileandline-registry-handle-src-mq3-botlib-be-interface-ml-2034179423"></a>
### PC_SourceFileAndLine

```ml
function PC_SourceFileAndLine(registry, handle)
```

Forward `PC_SourceFileAndLine` to `mq3.vm.pc_parser.location` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry record; accesses `sources`. |
| `handle` | `dynamic` | — | Handle identifying the allocated preprocessor source. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L248)

<a id="function-function-mq3-botlib-be-interface-services-function-services-context-src-mq3-botlib-be-interface-ml-192793695"></a>
### services

```ml
function services(context)
```

Create a `mq3.botlib.be_interface.Services` record, initializing `context` from `context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L91)

- [mq3.botlib.be_interface.Services](Type-mq3-botlib-be-interface-services-1301193177.md) — struct
<a id="function-function-mq3-botlib-be-interface-sys-milliseconds-function-sys-milliseconds-clockvalue-clockspersecond-src-mq3-botlib-be-interface-ml-1840429163"></a>
### Sys_MilliSeconds

```ml
function Sys_MilliSeconds(clockValue, clocksPerSecond)
```

Sys_MilliSeconds uses clock() rather than wall time in the original.  The deterministic form accepts the two clock values explicitly.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clockValue` | `dynamic` | — | Operand used to evaluate the returned expression `n.trunc32(clockValue*1000/clocksPerSecond)`. |
| `clocksPerSecond` | `dynamic` | — | Operand used to evaluate the returned expression `n.trunc32(clockValue*1000/clocksPerSecond)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L121)

<a id="function-function-mq3-botlib-be-interface-topexports-function-topexports-src-mq3-botlib-be-interface-ml-1899186698"></a>
### topExports

```ml
function topExports()
```

Return the ordered top exports table for be interface: 13 entries beginning with `["BotLibSetup","Export_BotLibSetup"]` and `["BotLibShutdown","Export_BotLibShutdown"]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L257)

<a id="function-function-mq3-botlib-be-interface-validclientnumber-function-validclientnumber-state-number-src-mq3-botlib-be-interface-ml-423096340"></a>
### ValidClientNumber

```ml
function ValidClientNumber(state, number)
```

Test `state!=void and number>=0 and number<=state.maxclients` as the condition for `ValidClientNumber`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be interface state; accesses `maxclients`. |
| `number` | `dynamic` | — | Operand used to evaluate the returned expression `state!=void and number>=0 and number<=state.maxclients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L125)

<a id="function-function-mq3-botlib-be-interface-validentitynumber-function-validentitynumber-state-number-src-mq3-botlib-be-interface-ml-28021468"></a>
### ValidEntityNumber

```ml
function ValidEntityNumber(state, number)
```

Test `state!=void and number>=0 and number<=state.maxentities` as the condition for `ValidEntityNumber`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be interface state; accesses `maxentities`. |
| `number` | `dynamic` | — | Operand used to evaluate the returned expression `state!=void and number>=0 and number<=state.maxentities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L129)
