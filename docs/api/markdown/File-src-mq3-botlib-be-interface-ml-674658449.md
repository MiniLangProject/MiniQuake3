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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L105)

<a id="function-function-mq3-botlib-be-interface-aiexports-function-aiexports-src-mq3-botlib-be-interface-ml-721689012"></a>
### aiExports

```ml
function aiExports()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L107)

- [mq3.botlib.be_interface.Api](Type-mq3-botlib-be-interface-api-1768285179.md) — struct
<a id="constant-constant-mq3-botlib-be-interface-blerr-invalidentitynumber-const-blerr-invalidentitynumber-publicheaders-blerr-invalidentitynumber-src-mq3-botlib-be-interface-ml-1712564057"></a>
### BLERR_INVALIDENTITYNUMBER

```ml
const BLERR_INVALIDENTITYNUMBER = publicHeaders.BLERR_INVALIDENTITYNUMBER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L17)

<a id="constant-constant-mq3-botlib-be-interface-blerr-librarynotsetup-const-blerr-librarynotsetup-publicheaders-blerr-librarynotsetup-src-mq3-botlib-be-interface-ml-304496869"></a>
### BLERR_LIBRARYNOTSETUP

```ml
const BLERR_LIBRARYNOTSETUP = publicHeaders.BLERR_LIBRARYNOTSETUP
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L16)

<a id="constant-constant-mq3-botlib-be-interface-blerr-noerror-const-blerr-noerror-publicheaders-blerr-noerror-src-mq3-botlib-be-interface-ml-374925519"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = publicHeaders.BLERR_NOERROR
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L15)

<a id="function-function-mq3-botlib-be-interface-botexporttest-function-botexporttest-parm0-parm1-parm2-parm3-src-mq3-botlib-be-interface-ml-186296480"></a>
### BotExportTest

```ml
function BotExportTest(parm0, parm1, parm2, parm3)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parm0` | `dynamic` | — |  |
| `parm1` | `dynamic` | — |  |
| `parm2` | `dynamic` | — |  |
| `parm3` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L92)

<a id="constant-constant-mq3-botlib-be-interface-botlib-api-version-const-botlib-api-version-publicheaders-botlib-api-version-src-mq3-botlib-be-interface-ml-772952670"></a>
### BOTLIB_API_VERSION

```ml
const BOTLIB_API_VERSION = publicHeaders.BOTLIB_API_VERSION
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L14)

<a id="function-function-mq3-botlib-be-interface-botlibsetup-function-botlibsetup-state-src-mq3-botlib-be-interface-ml-801838051"></a>
### BotLibSetup

```ml
function BotLibSetup(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L41)

<a id="function-function-mq3-botlib-be-interface-eaexports-function-eaexports-src-mq3-botlib-be-interface-ml-1451714588"></a>
### eaExports

```ml
function eaExports()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L106)

<a id="function-function-mq3-botlib-be-interface-export-botlibloadmap-function-export-botlibloadmap-state-mapname-service-src-mq3-botlib-be-interface-ml-1445466105"></a>
### Export_BotLibLoadMap

```ml
function Export_BotLibLoadMap(state, mapName, service)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `service` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L76)

<a id="function-function-mq3-botlib-be-interface-export-botlibsetup-function-export-botlibsetup-state-service-src-mq3-botlib-be-interface-ml-801424302"></a>
### Export_BotLibSetup

```ml
function Export_BotLibSetup(state, service)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `service` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L43)

<a id="function-function-mq3-botlib-be-interface-export-botlibshutdown-function-export-botlibshutdown-state-service-registry-src-mq3-botlib-be-interface-ml-1146898295"></a>
### Export_BotLibShutdown

```ml
function Export_BotLibShutdown(state, service, registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `service` | `dynamic` | — |  |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L55)

<a id="function-function-mq3-botlib-be-interface-export-botlibstartframe-function-export-botlibstartframe-state-time-service-src-mq3-botlib-be-interface-ml-1869798413"></a>
### Export_BotLibStartFrame

```ml
function Export_BotLibStartFrame(state, time, service)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `service` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L70)

<a id="function-function-mq3-botlib-be-interface-export-botlibupdateentity-function-export-botlibupdateentity-state-entity-present-service-src-mq3-botlib-be-interface-ml-841227422"></a>
### Export_BotLibUpdateEntity

```ml
function Export_BotLibUpdateEntity(state, entity, present, service)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `present` | `dynamic` | — |  |
| `service` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L85)

<a id="function-function-mq3-botlib-be-interface-export-botlibvarget-function-export-botlibvarget-state-name-size-src-mq3-botlib-be-interface-ml-642749375"></a>
### Export_BotLibVarGet

```ml
function Export_BotLibVarGet(state, name, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L66)

<a id="function-function-mq3-botlib-be-interface-export-botlibvarset-function-export-botlibvarset-state-name-value-src-mq3-botlib-be-interface-ml-1707202181"></a>
### Export_BotLibVarSet

```ml
function Export_BotLibVarSet(state, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L65)

<a id="function-function-mq3-botlib-be-interface-getbotlibapi-function-getbotlibapi-apiversion-importvalid-src-mq3-botlib-be-interface-ml-618187637"></a>
### GetBotLibAPI

```ml
function GetBotLibAPI(apiVersion, importValid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `apiVersion` | `dynamic` | — |  |
| `importValid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L109)

<a id="function-function-mq3-botlib-be-interface-invoke-function-invoke-service-callback-src-mq3-botlib-be-interface-ml-1491904436"></a>
### invoke

```ml
function invoke(service, callback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `service` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L23)

<a id="function-function-mq3-botlib-be-interface-invoke1-function-invoke1-service-callback-value-src-mq3-botlib-be-interface-ml-1550701497"></a>
### invoke1

```ml
function invoke1(service, callback, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `service` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L27)

<a id="function-function-mq3-botlib-be-interface-invoke2-function-invoke2-service-callback-first-second-src-mq3-botlib-be-interface-ml-333135776"></a>
### invoke2

```ml
function invoke2(service, callback, first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `service` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L31)

<a id="function-function-mq3-botlib-be-interface-pc-addglobaldefine-function-pc-addglobaldefine-registry-text-src-mq3-botlib-be-interface-ml-2064370058"></a>
### PC_AddGlobalDefine

```ml
function PC_AddGlobalDefine(registry, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L94)

<a id="function-function-mq3-botlib-be-interface-pc-checkopensourcehandles-function-pc-checkopensourcehandles-registry-src-mq3-botlib-be-interface-ml-1367890269"></a>
### PC_CheckOpenSourceHandles

```ml
function PC_CheckOpenSourceHandles(registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L99)

<a id="function-function-mq3-botlib-be-interface-pc-freesourcehandle-function-pc-freesourcehandle-registry-handle-src-mq3-botlib-be-interface-ml-403825917"></a>
### PC_FreeSourceHandle

```ml
function PC_FreeSourceHandle(registry, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L96)

<a id="function-function-mq3-botlib-be-interface-pc-loadsourcehandle-function-pc-loadsourcehandle-registry-name-src-mq3-botlib-be-interface-ml-2108239588"></a>
### PC_LoadSourceHandle

```ml
function PC_LoadSourceHandle(registry, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L95)

<a id="function-function-mq3-botlib-be-interface-pc-readtokenhandle-function-pc-readtokenhandle-registry-handle-src-mq3-botlib-be-interface-ml-538967307"></a>
### PC_ReadTokenHandle

```ml
function PC_ReadTokenHandle(registry, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L97)

<a id="function-function-mq3-botlib-be-interface-pc-sourcefileandline-function-pc-sourcefileandline-registry-handle-src-mq3-botlib-be-interface-ml-2034179423"></a>
### PC_SourceFileAndLine

```ml
function PC_SourceFileAndLine(registry, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L98)

<a id="function-function-mq3-botlib-be-interface-services-function-services-context-src-mq3-botlib-be-interface-ml-192793695"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L22)

- [mq3.botlib.be_interface.Services](Type-mq3-botlib-be-interface-services-1301193177.md) — struct
<a id="function-function-mq3-botlib-be-interface-sys-milliseconds-function-sys-milliseconds-clockvalue-clockspersecond-src-mq3-botlib-be-interface-ml-1840429163"></a>
### Sys_MilliSeconds

```ml
function Sys_MilliSeconds(clockValue, clocksPerSecond)
```

Sys_MilliSeconds uses clock() rather than wall time in the original.  The deterministic form accepts the two clock values explicitly.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clockValue` | `dynamic` | — |  |
| `clocksPerSecond` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L38)

<a id="function-function-mq3-botlib-be-interface-topexports-function-topexports-src-mq3-botlib-be-interface-ml-1899186698"></a>
### topExports

```ml
function topExports()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L104)

<a id="function-function-mq3-botlib-be-interface-validclientnumber-function-validclientnumber-state-number-src-mq3-botlib-be-interface-ml-423096340"></a>
### ValidClientNumber

```ml
function ValidClientNumber(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L39)

<a id="function-function-mq3-botlib-be-interface-validentitynumber-function-validentitynumber-state-number-src-mq3-botlib-be-interface-ml-28021468"></a>
### ValidEntityNumber

```ml
function ValidEntityNumber(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_interface.ml#L40)
