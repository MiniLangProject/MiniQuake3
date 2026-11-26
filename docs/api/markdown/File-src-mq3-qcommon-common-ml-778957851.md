# `src/mq3/qcommon/common.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.common`](Package-mq3-qcommon-common-135583411.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/engine_loop.ml` as `engine` → [src/mq3/platform/engine_loop.ml](File-src-mq3-platform-engine-loop-ml-224472914.md)
- `mq3/qcommon/command_buffer.ml` as `command` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/config_persistence.ml` as `config` → [src/mq3/qcommon/config_persistence.ml](File-src-mq3-qcommon-config-persistence-ml-1954559630.md)
- `mq3/qcommon/headers.ml` as `qcommonHeaders` → [src/mq3/qcommon/headers.ml](File-src-mq3-qcommon-headers-ml-405080448.md)
- `mq3/qcommon/network_pump.ml` as `network` → [src/mq3/qcommon/network_pump.ml](File-src-mq3-qcommon-network-pump-ml-493477247.md)
- `mq3/qcommon/startup_commands.ml` as `startup` → [src/mq3/qcommon/startup_commands.ml](File-src-mq3-qcommon-startup-commands-ml-835791996.md)

## Declarations

<a id="function-function-mq3-qcommon-common-copydword-function-copydword-destination-constant-count-src-mq3-qcommon-common-ml-1661372085"></a>
### _copyDWord

```ml
function _copyDWord(destination, constant, count)
```

Copy d word in qcommon.common; the normal completion returns `true`.

Direct state writes: `destination elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Mutable sequence written at `i`. |
| `constant` | `dynamic` | — | Constant operand used by `_copyDWord`; its reads are shown in the implementation. |
| `count` | `dynamic` | — | Count used in `(count < 0)` and `(count > 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L520)

<a id="extern_function-extern-function-mq3-qcommon-common-acos-extern-function-acos-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-qcommon-common-ml-940443332"></a>
### acos

```ml
extern function acos(value as double) from "ucrtbase.dll" returns double
```

Compute the inverse cosine in radians.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Floating-point operand. |


**Returns:** The principal angle in radians, with C-runtime domain handling outside [-1, 1].

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L17)

- [mq3.qcommon.common.Allocation](Type-mq3-qcommon-common-allocation-426269833.md) — struct
<a id="function-function-mq3-qcommon-common-com-addstartupcommands-function-com-addstartupcommands-state-src-mq3-qcommon-common-ml-500948637"></a>
### Com_AddStartupCommands

```ml
function Com_AddStartupCommands(state)
```

Return `mq3.qcommon.startup_commands.addStartupCommands(state.startupState)` from `qcommon.common.Com_AddStartupCommands`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `startupState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L152)

<a id="function-function-mq3-qcommon-common-com-appendcdkey-function-com-appendcdkey-state-filename-src-mq3-qcommon-common-ml-1843292686"></a>
### Com_AppendCDKey

```ml
function Com_AppendCDKey(state, filename)
```

Append cd key in qcommon.common; the normal completion returns `key`.

Direct state writes: `state.cdKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `cdKey`. Updated in place: `cdKey`. |
| `filename` | `dynamic` | — | Filename passed as `filename` to `mq3.qcommon.common.readKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L447)

<a id="function-function-mq3-qcommon-common-com-beginredirect-function-com-beginredirect-state-capacity-flushfn-context-src-mq3-qcommon-common-ml-1262307128"></a>
### Com_BeginRedirect

```ml
function Com_BeginRedirect(state, capacity, flushFn, context)
```

Begin redirect in qcommon.common; the normal completion returns `true`.

Direct state writes: `state.redirect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `redirect`. |
| `capacity` | `dynamic` | — | Initial `capacity` field stored in the returned or constructed `mq3.qcommon.common.Redirect` record. |
| `flushFn` | `dynamic` | — | Initial `flushFn` field stored in the returned or constructed `mq3.qcommon.common.Redirect` record. |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.qcommon.common.Redirect` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L95)

<a id="function-function-mq3-qcommon-common-com-crash-f-function-com-crash-f-state-src-mq3-qcommon-common-ml-1860329901"></a>
### Com_Crash_f

```ml
function Com_Crash_f(state)
```

Return `mq3.qcommon.common.Com_Error(state, ERR_FATAL, "Testing crash")` from `qcommon.common.Com_Crash_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.common.Com_Error`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L137)

<a id="function-function-mq3-qcommon-common-com-dprintf-function-com-dprintf-state-text-src-mq3-qcommon-common-ml-1299848722"></a>
### Com_DPrintf

```ml
function Com_DPrintf(state, text)
```

Compute d printf in qcommon.common.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `developer`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.common.Com_Printf`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L112)

<a id="function-function-mq3-qcommon-common-com-endredirect-function-com-endredirect-state-src-mq3-qcommon-common-ml-1556994939"></a>
### Com_EndRedirect

```ml
function Com_EndRedirect(state)
```

End redirect in qcommon.common; the normal completion returns `true`.

Direct state writes: `state.redirect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `redirect`. Updated in place: `redirect`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L100)

<a id="function-function-mq3-qcommon-common-com-error-function-com-error-state-code-message-src-mq3-qcommon-common-ml-751490809"></a>
### Com_Error

```ml
function Com_Error(state, code, message)
```

Update `state.errorCount`, `state.lastErrorTime`, `state.errorEntered`, `state.errorMessage` in qcommon.common; the normal completion returns `result`.

Direct state writes: `state.errorCount`, `state.lastErrorTime`, `state.errorEntered`, `state.errorMessage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `lastErrorTime`, `errorCount`, `buildScript`, `errorEntered`, `errorMessage`, `services`. Updated in place: `errorCount`, `lastErrorTime`, `errorEntered`, `errorMessage`. |
| `code` | `dynamic` | — | Initial `code` field stored in the returned or constructed `mq3.qcommon.common.CommonError` record. |
| `message` | `dynamic` | — | Initial `message` field stored in the returned or constructed `mq3.qcommon.common.CommonError` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L119)

<a id="function-function-mq3-qcommon-common-com-error-f-function-com-error-f-state-src-mq3-qcommon-common-ml-1177997583"></a>
### Com_Error_f

```ml
function Com_Error_f(state)
```

Return `mq3.qcommon.common.Com_Error(state, ERR_DROP, "Testing drop error")` from `qcommon.common.Com_Error_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.common.Com_Error`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L130)

<a id="function-function-mq3-qcommon-common-com-eventloop-function-com-eventloop-state-maxevents-src-mq3-qcommon-common-ml-477465252"></a>
### Com_EventLoop

```ml
function Com_EventLoop(state, maxEvents)
```

Update `state.frameTime` in qcommon.common; the normal completion returns `last`.

Direct state writes: `state.frameTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `frameTime`, `services`, `networkPump`. Updated in place: `frameTime`. |
| `maxEvents` | `dynamic` | — | Max events used in `(count < maxEvents)` and `(maxEvents - count)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L408)

<a id="function-function-mq3-qcommon-common-com-filter-function-com-filter-filter-name-casesensitive-src-mq3-qcommon-common-ml-134727631"></a>
### Com_Filter

```ml
function Com_Filter(filter, name, casesensitive)
```

Test filter in qcommon.common; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filter` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.common.visible`. |
| `name` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.common.visible`. |
| `casesensitive` | `dynamic` | — | Casesensitive passed as `casesensitive` to `mq3.qcommon.common.Com_StringContains`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L173)

<a id="function-function-mq3-qcommon-common-com-filterpath-function-com-filterpath-filter-name-casesensitive-src-mq3-qcommon-common-ml-805807651"></a>
### Com_FilterPath

```ml
function Com_FilterPath(filter, name, casesensitive)
```

Return `mq3.qcommon.common.Com_Filter(normalizePath(filter), normalizePath(name), casesensitive)` from `qcommon.common.Com_FilterPath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filter` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.common.normalizePath`. |
| `name` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.common.normalizePath`. |
| `casesensitive` | `dynamic` | — | Casesensitive passed as `casesensitive` to `mq3.qcommon.common.Com_Filter`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L194)

<a id="function-function-mq3-qcommon-common-com-frame-function-com-frame-state-src-mq3-qcommon-common-ml-495495919"></a>
### Com_Frame

```ml
function Com_Frame(state)
```

Update `state.lastTime`, `state.frameMsec`, `state.frameNumber` in qcommon.common; the normal completion returns `true`.

Direct state writes: `state.lastTime`, `state.frameMsec`, `state.frameNumber`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `dedicated`, `maxFps`, `timedemo`, `lastTime`, `commandState`, `engineRuntime`, `frameNumber`. Updated in place: `lastTime`, `frameMsec`, `frameNumber`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L483)

<a id="function-function-mq3-qcommon-common-com-freeze-f-function-com-freeze-f-state-seconds-src-mq3-qcommon-common-ml-759930354"></a>
### Com_Freeze_f

```ml
function Com_Freeze_f(state, seconds)
```

Test freeze f in qcommon.common; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.common.Com_Milliseconds`. |
| `seconds` | `dynamic` | — | Seconds used in `(seconds < 0.0)` and `(((Com_Milliseconds(state) - start) * 0.001) <= seconds)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L134)

<a id="function-function-mq3-qcommon-common-com-getevent-function-com-getevent-state-src-mq3-qcommon-common-ml-284979893"></a>
### Com_GetEvent

```ml
function Com_GetEvent(state)
```

Get event in qcommon.common; the normal completion returns `Com_GetRealEvent(state)`.

Direct state writes: `state.tail`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `head`, `tail`, `pushed`. Updated in place: `tail`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L397)

<a id="function-function-mq3-qcommon-common-com-getrealevent-function-com-getrealevent-state-src-mq3-qcommon-common-ml-2083650181"></a>
### Com_GetRealEvent

```ml
function Com_GetRealEvent(state)
```

Get real event in qcommon.common; the normal completion returns `value`.

Direct state writes: `state.journalIndex`, `state.journalEvents`, `state.journalDirty`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `journalMode`, `journalIndex`, `journalEvents`, `services`. Updated in place: `journalIndex`, `journalEvents`, `journalDirty`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L389)

<a id="function-function-mq3-qcommon-common-com-hashkey-function-com-hashkey-text-maxlength-src-mq3-qcommon-common-ml-146329117"></a>
### Com_HashKey

```ml
function Com_HashKey(text, maxLength)
```

Compute hash key in qcommon.common; the normal completion returns `((hash ^ (hash >> 10)) ^ (hash >> 20))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.common.visible`. |
| `maxLength` | `dynamic` | — | Max length used in `(count > maxLength)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L198)

<a id="function-function-mq3-qcommon-common-com-init-function-com-init-state-commandline-src-mq3-qcommon-common-ml-1820424472"></a>
### Com_Init

```ml
function Com_Init(state, commandLine)
```

Update `state.frameTime`, `state.fullyInitialized` in qcommon.common; the normal completion returns `true`.

Direct state writes: `state.frameTime`, `state.fullyInitialized`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`. Updated in place: `frameTime`, `fullyInitialized`. |
| `commandLine` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.common.Com_ParseCommandLine`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L458)

<a id="function-function-mq3-qcommon-common-com-inithunkmemory-function-com-inithunkmemory-state-src-mq3-qcommon-common-ml-1991194397"></a>
### Com_InitHunkMemory

```ml
function Com_InitHunkMemory(state)
```

Update `state.hunk` in qcommon.common; the normal completion returns `true`.

Direct state writes: `state.hunk`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `hunk`. Updated in place: `hunk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L310)

<a id="function-function-mq3-qcommon-common-com-initjournaling-function-com-initjournaling-state-mode-path-src-mq3-qcommon-common-ml-390882085"></a>
### Com_InitJournaling

```ml
function Com_InitJournaling(state, mode, path)
```

Update `state.journalMode`, `state.journalEvents`, `state.journalIndex`, `state.journalPath` in qcommon.common; the normal completion returns `mode`.

Direct state writes: `state.journalMode`, `state.journalEvents`, `state.journalIndex`, `state.journalPath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`, `journalPath`. Updated in place: `journalMode`, `journalEvents`, `journalIndex`, `journalPath`. |
| `mode` | `dynamic` | — | Mode used in `(mode == 2)` and `((mode == 2) and (state.services.readFn != void))`. |
| `path` | `dynamic` | — | Path used in `(path != void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L373)

<a id="function-function-mq3-qcommon-common-com-initpushevent-function-com-initpushevent-state-src-mq3-qcommon-common-ml-979329157"></a>
### Com_InitPushEvent

```ml
function Com_InitPushEvent(state)
```

Update `state.head`, `state.tail`, `state.pushed` in qcommon.common.

Direct state writes: `state.head`, `state.tail`, `state.pushed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `head`, `tail`, `pushed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L378)

<a id="function-function-mq3-qcommon-common-com-initsmallzonememory-function-com-initsmallzonememory-state-src-mq3-qcommon-common-ml-700338781"></a>
### Com_InitSmallZoneMemory

```ml
function Com_InitSmallZoneMemory(state)
```

Update `state.smallZone` in qcommon.common; the normal completion returns `true`.

Direct state writes: `state.smallZone`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `smallZone`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L293)

<a id="function-function-mq3-qcommon-common-com-initzonememory-function-com-initzonememory-state-src-mq3-qcommon-common-ml-1354916973"></a>
### Com_InitZoneMemory

```ml
function Com_InitZoneMemory(state)
```

Update `state.zone` in qcommon.common; the normal completion returns `true`.

Direct state writes: `state.zone`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `zone`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L298)

<a id="function-function-mq3-qcommon-common-com-memcmp-function-com-memcmp-left-right-count-src-mq3-qcommon-common-ml-1014765392"></a>
### Com_Memcmp

```ml
function Com_Memcmp(left, right, count)
```

Test memcmp in qcommon.common; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Left used in `left[i]` and `len(left)`. |
| `right` | `dynamic` | — | Right used in `right[i]` and `len(right)`. |
| `count` | `dynamic` | — | Count used in `(count < 0)` and `(count > 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L513)

<a id="function-function-mq3-qcommon-common-com-memcpy-function-com-memcpy-destination-source-count-src-mq3-qcommon-common-ml-1100489764"></a>
### Com_Memcpy

```ml
function Com_Memcpy(destination, source, count)
```

Update `destination entries` in qcommon.common; the normal completion returns `true`.

Direct state writes: `destination elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Mutable sequence written at `i`. |
| `source` | `dynamic` | — | Source used in `len(source)` and `(count > len(source))`. |
| `count` | `dynamic` | — | Count used in `(count < 0)` and `(count > 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L501)

<a id="function-function-mq3-qcommon-common-com-meminfo-f-function-com-meminfo-f-state-src-mq3-qcommon-common-ml-1199001085"></a>
### Com_Meminfo_f

```ml
function Com_Meminfo_f(state)
```

Compute qcommon.common.Com_Meminfo_f as `[state.zone.used, state.zone.capacity, state.smallZone.used, state.smallZone.capacity, state.hunk.lowPermanent, state.hunk.highPermanent, state.hunk.capacity]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `zone`, `smallZone`, `hunk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L301)

<a id="function-function-mq3-qcommon-common-com-memset-function-com-memset-destination-value-count-src-mq3-qcommon-common-ml-1336103902"></a>
### Com_Memset

```ml
function Com_Memset(destination, value, count)
```

Update `destination entries` in qcommon.common; the normal completion returns `true`.

Direct state writes: `destination elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Mutable sequence written at `i`. |
| `value` | `dynamic` | — | Value used in `(value & 255)`. |
| `count` | `dynamic` | — | Count used in `(count < 0)` and `(count > 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L508)

<a id="function-function-mq3-qcommon-common-com-milliseconds-function-com-milliseconds-state-src-mq3-qcommon-common-ml-152733361"></a>
### Com_Milliseconds

```ml
function Com_Milliseconds(state)
```

Compute milliseconds in qcommon.common; the normal completion returns `state.frameTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`, `frameTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L414)

<a id="function-function-mq3-qcommon-common-com-modifymsec-function-com-modifymsec-state-msec-src-mq3-qcommon-common-ml-2132431737"></a>
### Com_ModifyMsec

```ml
function Com_ModifyMsec(state, msec)
```

Compute modify msec in qcommon.common; the normal completion returns `msec`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `fixedTime`, `timescale`, `cameraMode`, `svRunning`, `dedicated`. |
| `msec` | `dynamic` | — | Msec used in `(msec < 1)` and `(msec > clamp)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L472)

<a id="function-function-mq3-qcommon-common-com-parsecommandline-function-com-parsecommandline-state-text-src-mq3-qcommon-common-ml-522555640"></a>
### Com_ParseCommandLine

```ml
function Com_ParseCommandLine(state, text)
```

Return `mq3.qcommon.startup_commands.parseCommandLine(state.startupState, text)` from `qcommon.common.Com_ParseCommandLine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `startupState`. |
| `text` | `dynamic` | — | Command line passed as `commandLine` to `mq3.qcommon.startup_commands.parseCommandLine`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L142)

<a id="function-function-mq3-qcommon-common-com-prefetch-function-com-prefetch-source-count-type-src-mq3-qcommon-common-ml-143289122"></a>
### Com_Prefetch

```ml
function Com_Prefetch(source, count, type)
```

Compute qcommon.common.Com_Prefetch as `void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `count` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `type` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L525)

<a id="function-function-mq3-qcommon-common-com-printf-function-com-printf-state-text-src-mq3-qcommon-common-ml-1708056400"></a>
### Com_Printf

```ml
function Com_Printf(state, text)
```

Compute printf in qcommon.common.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `redirect`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.common.visible`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L104)

<a id="function-function-mq3-qcommon-common-com-pushevent-function-com-pushevent-state-event-src-mq3-qcommon-common-ml-1312120113"></a>
### Com_PushEvent

```ml
function Com_PushEvent(state, event)
```

Update `state.tail`, `state.head` in qcommon.common.

Direct state writes: `state.tail`, `state.head`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `head`, `tail`, `pushed`. Updated in place: `tail`, `head`. |
| `event` | `dynamic` | — | Event operand used by `Com_PushEvent`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L384)

<a id="function-function-mq3-qcommon-common-com-quit-f-function-com-quit-f-state-src-mq3-qcommon-common-ml-914238021"></a>
### Com_Quit_f

```ml
function Com_Quit_f(state)
```

Test quit f in qcommon.common; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `errorEntered`, `services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L127)

<a id="function-function-mq3-qcommon-common-com-readcdkey-function-com-readcdkey-state-filename-src-mq3-qcommon-common-ml-1371921206"></a>
### Com_ReadCDKey

```ml
function Com_ReadCDKey(state, filename)
```

Read cd key in qcommon.common; the normal completion returns `key`.

Direct state writes: `state.cdKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `cdKey`. Updated in place: `cdKey`. |
| `filename` | `dynamic` | — | Filename passed as `filename` to `mq3.qcommon.common.readKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L441)

<a id="function-function-mq3-qcommon-common-com-realtime-function-com-realtime-state-target-src-mq3-qcommon-common-ml-868237158"></a>
### Com_RealTime

```ml
function Com_RealTime(state, target)
```

Update `target.sec`, `target.min`, `target.hour`, `target.mday` in qcommon.common; the normal completion returns `value[0]`.

Direct state writes: `target.sec`, `target.min`, `target.hour`, `target.mday`, `target.mon`, `target.year`, `target.wday`, `target.yday` and further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`. |
| `target` | `dynamic` | — | Updated in place: `sec`, `min`, `hour`, `mday`, `mon`, `year` and further fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L204)

<a id="function-function-mq3-qcommon-common-com-runandtimeserverpacket-function-com-runandtimeserverpacket-state-address-data-src-mq3-qcommon-common-ml-194363597"></a>
### Com_RunAndTimeServerPacket

```ml
function Com_RunAndTimeServerPacket(state, address, data)
```

Compute run and time server packet in qcommon.common.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`. |
| `address` | `dynamic` | — | Address used in `state.services.packetEventFn(state.services.context, address, data, true)`. |
| `data` | `dynamic` | — | Data used in `state.services.packetEventFn(state.services.context, address, data, true)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L402)

<a id="function-function-mq3-qcommon-common-com-safemode-function-com-safemode-state-src-mq3-qcommon-common-ml-442002001"></a>
### Com_SafeMode

```ml
function Com_SafeMode(state)
```

Return `mq3.qcommon.startup_commands.safeMode(state.startupState)` from `qcommon.common.Com_SafeMode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `startupState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L145)

<a id="function-function-mq3-qcommon-common-com-shutdown-function-com-shutdown-state-src-mq3-qcommon-common-ml-410589181"></a>
### Com_Shutdown

```ml
function Com_Shutdown(state)
```

Update `state.shutdown` in qcommon.common; the normal completion returns `true`.

Direct state writes: `state.shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `shutdown`, `journalMode`, `journalDirty`, `services`, `journalPath`, `journalEvents`. Updated in place: `shutdown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L493)

<a id="function-function-mq3-qcommon-common-com-startupvariable-function-com-startupvariable-state-match-src-mq3-qcommon-common-ml-866884860"></a>
### Com_StartupVariable

```ml
function Com_StartupVariable(state, match)
```

Return `mq3.qcommon.startup_commands.startupVariable(state.startupState, match)` from `qcommon.common.Com_StartupVariable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `startupState`. |
| `match` | `dynamic` | — | Match passed as `match` to `mq3.qcommon.startup_commands.startupVariable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L149)

<a id="function-function-mq3-qcommon-common-com-stringcontains-function-com-stringcontains-str1-str2-casesensitive-src-mq3-qcommon-common-ml-1441546563"></a>
### Com_StringContains

```ml
function Com_StringContains(str1, str2, casesensitive)
```

Compute string contains in qcommon.common; the normal completion returns `- 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `str1` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.common.visible`. |
| `str2` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.common.visible`. |
| `casesensitive` | `dynamic` | — | Casesensitive operand used by `Com_StringContains`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L165)

<a id="function-function-mq3-qcommon-common-com-touchmemory-function-com-touchmemory-state-src-mq3-qcommon-common-ml-1963908433"></a>
### Com_TouchMemory

```ml
function Com_TouchMemory(state)
```

Compute touch memory in qcommon.common; the normal completion returns `sum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `zone`, `hunk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L304)

<a id="function-function-mq3-qcommon-common-com-writecdkey-function-com-writecdkey-state-filename-key-src-mq3-qcommon-common-ml-1428432017"></a>
### Com_WriteCDKey

```ml
function Com_WriteCDKey(state, filename, key)
```

Write cd key in qcommon.common.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`. |
| `filename` | `dynamic` | — | Filename used in `(filename + "/q3key")`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.qcommon.common.validKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L452)

<a id="function-function-mq3-qcommon-common-com-writeconfig-f-function-com-writeconfig-f-state-src-mq3-qcommon-common-ml-1015110469"></a>
### Com_WriteConfig_f

```ml
function Com_WriteConfig_f(state)
```

Write config f in qcommon.common; the normal completion returns `config.writeConfigCommand(state.configState, state.commandState)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `configState`, `commandState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L468)

<a id="function-function-mq3-qcommon-common-com-writeconfigtofile-function-com-writeconfigtofile-state-filename-src-mq3-qcommon-common-ml-1528636406"></a>
### Com_WriteConfigToFile

```ml
function Com_WriteConfigToFile(state, filename)
```

Write config to file in qcommon.common; the normal completion returns `config.writeConfigToFile(state.configState, filename)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `configState`. |
| `filename` | `dynamic` | — | Filename passed as `filename` to `mq3.qcommon.config_persistence.writeConfigToFile`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L462)

<a id="function-function-mq3-qcommon-common-com-writeconfiguration-function-com-writeconfiguration-state-src-mq3-qcommon-common-ml-1235806657"></a>
### Com_WriteConfiguration

```ml
function Com_WriteConfiguration(state)
```

Write configuration in qcommon.common; the normal completion returns `config.writeConfiguration(state.configState)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `configState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L465)

- [mq3.qcommon.common.CommonError](Type-mq3-qcommon-common-commonerror-423548968.md) — struct
<a id="function-function-mq3-qcommon-common-concatremaining-function-concatremaining-state-source-start-src-mq3-qcommon-common-ml-301874252"></a>
### ConcatRemaining

```ml
function ConcatRemaining(state, source, start)
```

Compute concat remaining in qcommon.common; the normal completion returns `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `completionField`. |
| `source` | `dynamic` | — | Source used in `bytes(source)`. |
| `start` | `dynamic` | — | Start used in `bytes(start)` and `(decode(slice(data, i, len(needle))) == start)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L555)

<a id="function-function-mq3-qcommon-common-copystring-function-copystring-state-text-src-mq3-qcommon-common-ml-307098868"></a>
### CopyString

```ml
function CopyString(state, text)
```

Return `decode(bytes(visible(text)))` from `qcommon.common.CopyString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.common.visible`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L288)

<a id="function-function-mq3-qcommon-common-create-function-create-host-commandstate-src-mq3-qcommon-common-ml-1874013200"></a>
### create

```ml
function create(host, commandState)
```

Create common in qcommon.common.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Initial `services` field stored in the returned or constructed `mq3.qcommon.common.State` record. |
| `commandState` | `dynamic` | — | Command state passed as `commandState` to `mq3.qcommon.startup_commands.create`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L65)

<a id="function-function-mq3-qcommon-common-createhunk-function-createhunk-capacity-src-mq3-qcommon-common-ml-1345908444"></a>
### createHunk

```ml
function createHunk(capacity)
```

Create hunk in qcommon.common; the normal completion returns `Hunk(capacity, 0, 0, 0, 0, 0, 0, 1, 1, [], HUNK_LOW, HUNK_HIGH)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — | Initial `capacity` field stored in the returned or constructed `mq3.qcommon.common.Hunk` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L61)

<a id="function-function-mq3-qcommon-common-createzone-function-createzone-capacity-src-mq3-qcommon-common-ml-1192129176"></a>
### createZone

```ml
function createZone(capacity)
```

Create zone in qcommon.common; the normal completion returns `Zone(capacity, 0, 1, [])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — | Initial `capacity` field stored in the returned or constructed `mq3.qcommon.common.Zone` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L58)

<a id="function-function-mq3-qcommon-common-emit-function-emit-state-text-src-mq3-qcommon-common-ml-896776172"></a>
### emit

```ml
function emit(state, text)
```

Emit common in qcommon.common; updates `state.lastPrint`.

Direct state writes: `state.lastPrint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`. Updated in place: `lastPrint`. |
| `text` | `dynamic` | — | Text used in `state.services.printFn(state.services.context, text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L86)

<a id="constant-constant-mq3-qcommon-common-err-disconnect-const-err-disconnect-3-src-mq3-qcommon-common-ml-1738535026"></a>
### ERR_DISCONNECT

```ml
const ERR_DISCONNECT = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L22)

<a id="constant-constant-mq3-qcommon-common-err-drop-const-err-drop-1-src-mq3-qcommon-common-ml-726164074"></a>
### ERR_DROP

```ml
const ERR_DROP = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L20)

<a id="constant-constant-mq3-qcommon-common-err-fatal-const-err-fatal-0-src-mq3-qcommon-common-ml-1560198233"></a>
### ERR_FATAL

```ml
const ERR_FATAL = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L19)

<a id="constant-constant-mq3-qcommon-common-err-need-cd-const-err-need-cd-4-src-mq3-qcommon-common-ml-136278545"></a>
### ERR_NEED_CD

```ml
const ERR_NEED_CD = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L23)

<a id="constant-constant-mq3-qcommon-common-err-serverdisconnect-const-err-serverdisconnect-2-src-mq3-qcommon-common-ml-1461881603"></a>
### ERR_SERVERDISCONNECT

```ml
const ERR_SERVERDISCONNECT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L21)

- [mq3.qcommon.common.Field](Type-mq3-qcommon-common-field-55104153.md) — struct
<a id="function-function-mq3-qcommon-common-field-clear-function-field-clear-edit-src-mq3-qcommon-common-ml-193387480"></a>
### Field_Clear

```ml
function Field_Clear(edit)
```

Update `edit.buffer`, `edit.cursor`, `edit.scroll` in qcommon.common.

Direct state writes: `edit.buffer`, `edit.cursor`, `edit.scroll`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `edit` | `dynamic` | — | Updated in place: `buffer`, `cursor`, `scroll`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L534)

<a id="function-function-mq3-qcommon-common-field-completecommand-function-field-completecommand-state-field-commandnames-cvarnames-src-mq3-qcommon-common-ml-105816386"></a>
### Field_CompleteCommand

```ml
function Field_CompleteCommand(state, field, commandNames, cvarNames)
```

Update `state.completionField`, `state.completionString`, `state.shortestMatch`, `state.matchCount` in qcommon.common; the normal completion returns `state.matchCount`.

Direct state writes: `state.completionField`, `state.completionString`, `state.shortestMatch`, `state.matchCount`, `field.buffer`, `field.cursor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `commandState`, `matchCount`, `shortestMatch`. Updated in place: `completionField`, `completionString`, `shortestMatch`, `matchCount`. |
| `field` | `dynamic` | — | Record exposing `buffer`. Updated in place: `buffer`, `cursor`. |
| `commandNames` | `dynamic` | — | Sequence traversed as `candidate` by the loop in `Field_CompleteCommand`. |
| `cvarNames` | `dynamic` | — | Sequence traversed as `candidate` by the loop in `Field_CompleteCommand`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L563)

<a id="function-function-mq3-qcommon-common-findallocation-function-findallocation-zone-handle-src-mq3-qcommon-common-ml-1686999376"></a>
### findAllocation

```ml
function findAllocation(zone, handle)
```

Find allocation in qcommon.common.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `zone` | `dynamic` | — | Record exposing `allocations`. |
| `handle` | `dynamic` | — | Handle used in `(value.handle == handle)` and `((value.handle == handle) and not value.freed)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L209)

<a id="function-function-mq3-qcommon-common-findmatches-function-findmatches-state-value-src-mq3-qcommon-common-ml-2125535746"></a>
### FindMatches

```ml
function FindMatches(state, value)
```

Find matches in qcommon.common; the normal completion returns `true`.

Direct state writes: `state.matchCount`, `state.shortestMatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `completionString`, `matchCount`, `shortestMatch`. Updated in place: `matchCount`, `shortestMatch`. |
| `value` | `dynamic` | — | Left passed as `left` to `mq3.qcommon.common.samePrefix`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L540)

- [mq3.qcommon.common.Hunk](Type-mq3-qcommon-common-hunk-2027410891.md) — struct
<a id="function-function-mq3-qcommon-common-hunk-alloc-function-hunk-alloc-state-size-preference-src-mq3-qcommon-common-ml-818829389"></a>
### Hunk_Alloc

```ml
function Hunk_Alloc(state, size, preference)
```

Compute hunk alloc in qcommon.common; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `hunk`. |
| `size` | `dynamic` | — | Initial `size` field stored in the returned or constructed `mq3.qcommon.common.Allocation` record. |
| `preference` | `dynamic` | — | Preference operand used by `Hunk_Alloc`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L343)

<a id="function-function-mq3-qcommon-common-hunk-allocatetempmemory-function-hunk-allocatetempmemory-state-size-src-mq3-qcommon-common-ml-1900214428"></a>
### Hunk_AllocateTempMemory

```ml
function Hunk_AllocateTempMemory(state, size)
```

Compute hunk allocate temp memory in qcommon.common; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `hunk`. |
| `size` | `dynamic` | — | Initial `size` field stored in the returned or constructed `mq3.qcommon.common.Allocation` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L347)

<a id="function-function-mq3-qcommon-common-hunk-checkmark-function-hunk-checkmark-state-src-mq3-qcommon-common-ml-1202974997"></a>
### Hunk_CheckMark

```ml
function Hunk_CheckMark(state)
```

Compute qcommon.common.Hunk_CheckMark as `((state.hunk.markLow != 0) or (state.hunk.markHigh != 0))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `hunk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L322)

<a id="function-function-mq3-qcommon-common-hunk-clear-function-hunk-clear-state-src-mq3-qcommon-common-ml-551766005"></a>
### Hunk_Clear

```ml
function Hunk_Clear(state)
```

Update `state.hunk` in qcommon.common.

Direct state writes: `state.hunk`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `hunk`. Updated in place: `hunk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L327)

<a id="function-function-mq3-qcommon-common-hunk-cleartempmemory-function-hunk-cleartempmemory-state-src-mq3-qcommon-common-ml-1698618077"></a>
### Hunk_ClearTempMemory

```ml
function Hunk_ClearTempMemory(state)
```

Compute hunk clear temp memory in qcommon.common.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `hunk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L356)

<a id="function-function-mq3-qcommon-common-hunk-cleartomark-function-hunk-cleartomark-state-src-mq3-qcommon-common-ml-1093216917"></a>
### Hunk_ClearToMark

```ml
function Hunk_ClearToMark(state)
```

Compute hunk clear to mark in qcommon.common.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `hunk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L319)

<a id="function-function-mq3-qcommon-common-hunk-freetempmemory-function-hunk-freetempmemory-state-value-src-mq3-qcommon-common-ml-275366846"></a>
### Hunk_FreeTempMemory

```ml
function Hunk_FreeTempMemory(state, value)
```

Update `value.freed` in qcommon.common; the normal completion returns `true`.

Direct state writes: `value.freed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `hunk`. |
| `value` | `dynamic` | — | Record exposing `freed`, `temporary`, `bank`, `size`. Updated in place: `freed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L353)

<a id="constant-constant-mq3-qcommon-common-hunk-high-const-hunk-high-1-src-mq3-qcommon-common-ml-1760851522"></a>
### HUNK_HIGH

```ml
const HUNK_HIGH = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L32)

<a id="function-function-mq3-qcommon-common-hunk-log-function-hunk-log-state-src-mq3-qcommon-common-ml-1768456489"></a>
### Hunk_Log

```ml
function Hunk_Log(state)
```

Compute qcommon.common.Hunk_Log as `state.hunk.allocations`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `hunk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L359)

<a id="constant-constant-mq3-qcommon-common-hunk-low-const-hunk-low-0-src-mq3-qcommon-common-ml-1491755985"></a>
### HUNK_LOW

```ml
const HUNK_LOW = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L31)

<a id="function-function-mq3-qcommon-common-hunk-memoryremaining-function-hunk-memoryremaining-state-src-mq3-qcommon-common-ml-2018993301"></a>
### Hunk_MemoryRemaining

```ml
function Hunk_MemoryRemaining(state)
```

Compute hunk memory remaining in qcommon.common; the normal completion returns `(h.capacity - (((h.lowPermanent + h.highPermanent) + h.lowTemp) + h.highTemp))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `hunk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L313)

<a id="function-function-mq3-qcommon-common-hunk-setmark-function-hunk-setmark-state-src-mq3-qcommon-common-ml-1007432429"></a>
### Hunk_SetMark

```ml
function Hunk_SetMark(state)
```

Compute hunk set mark in qcommon.common.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `hunk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L316)

<a id="function-function-mq3-qcommon-common-hunk-smalllog-function-hunk-smalllog-state-src-mq3-qcommon-common-ml-1294793413"></a>
### Hunk_SmallLog

```ml
function Hunk_SmallLog(state)
```

Compute hunk small log in qcommon.common; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `hunk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L362)

<a id="function-function-mq3-qcommon-common-hunk-swapbanks-function-hunk-swapbanks-state-src-mq3-qcommon-common-ml-1606264309"></a>
### Hunk_SwapBanks

```ml
function Hunk_SwapBanks(state)
```

Compute hunk swap banks in qcommon.common; the normal completion returns `h.permanentBank`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `hunk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L330)

<a id="function-function-mq3-qcommon-common-hunk-trash-function-hunk-trash-state-src-mq3-qcommon-common-ml-465420717"></a>
### Hunk_Trash

```ml
function Hunk_Trash(state)
```

Compute qcommon.common.Hunk_Trash as `void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L365)

<a id="function-function-mq3-qcommon-common-info-print-function-info-print-state-text-src-mq3-qcommon-common-ml-1098671828"></a>
### Info_Print

```ml
function Info_Print(state, text)
```

Compute info print in qcommon.common; the normal completion returns `lines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.common.Com_Printf`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.common.visible`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L156)

<a id="function-function-mq3-qcommon-common-keyconcatargs-function-keyconcatargs-state-src-mq3-qcommon-common-ml-1176361621"></a>
### keyConcatArgs

```ml
function keyConcatArgs(state)
```

Compute key concat args in qcommon.common; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `commandState`, `completionField`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L550)

<a id="function-function-mq3-qcommon-common-lower-function-lower-value-src-mq3-qcommon-common-ml-741304187"></a>
### lower

```ml
function lower(value)
```

Compute lower in qcommon.common; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value + 32)` and `(value >= 65)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L74)

<a id="constant-constant-mq3-qcommon-common-max-edit-line-const-max-edit-line-qcommonheaders-max-edit-line-src-mq3-qcommon-common-ml-1417981251"></a>
### MAX_EDIT_LINE

```ml
const MAX_EDIT_LINE = qcommonHeaders.MAX_EDIT_LINE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L25)

<a id="constant-constant-mq3-qcommon-common-max-pushed-events-const-max-pushed-events-1024-src-mq3-qcommon-common-ml-1782985328"></a>
### MAX_PUSHED_EVENTS

```ml
const MAX_PUSHED_EVENTS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L24)

<a id="constant-constant-mq3-qcommon-common-max-token-chars-const-max-token-chars-1024-src-mq3-qcommon-common-ml-607454052"></a>
### MAX_TOKEN_CHARS

```ml
const MAX_TOKEN_CHARS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L26)

<a id="function-function-mq3-qcommon-common-normalizepath-function-normalizepath-value-src-mq3-qcommon-common-ml-1909128297"></a>
### normalizePath

```ml
function normalizePath(value)
```

Normalize path in qcommon.common; the normal completion returns `decode(result)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.common.visible`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L189)

<a id="function-function-mq3-qcommon-common-padkey-function-padkey-src-mq3-qcommon-common-ml-1587054828"></a>
### padKey

```ml
function padKey()
```

Compute qcommon.common.padKey as `"                "`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L417)

<a id="function-function-mq3-qcommon-common-permanent-function-permanent-state-size-preference-src-mq3-qcommon-common-ml-1044129481"></a>
### permanent

```ml
function permanent(state, size, preference)
```

Return `mq3.qcommon.common.Hunk_Alloc(state, size, preference)` from `qcommon.common.permanent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.common.Hunk_Alloc`. |
| `size` | `dynamic` | — | Size passed as `size` to `mq3.qcommon.common.Hunk_Alloc`. |
| `preference` | `dynamic` | — | Preference passed as `preference` to `mq3.qcommon.common.Hunk_Alloc`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L571)

<a id="function-function-mq3-qcommon-common-printmatches-function-printmatches-state-value-src-mq3-qcommon-common-ml-1973113118"></a>
### PrintMatches

```ml
function PrintMatches(state, value)
```

Test print matches in qcommon.common; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `shortestMatch`. |
| `value` | `dynamic` | — | Left passed as `left` to `mq3.qcommon.common.samePrefix`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L544)

<a id="function-function-mq3-qcommon-common-q-acos-function-q-acos-value-src-mq3-qcommon-common-ml-1669102049"></a>
### Q_acos

```ml
function Q_acos(value)
```

Compute acos in qcommon.common; the normal completion returns `angle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L528)

<a id="function-function-mq3-qcommon-common-quotearg-function-quotearg-value-src-mq3-qcommon-common-ml-608669241"></a>
### quoteArg

```ml
function quoteArg(value)
```

Compute quote arg in qcommon.common; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `bytes(value)` and `("\\"" + value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L547)

<a id="function-function-mq3-qcommon-common-readkey-function-readkey-state-filename-src-mq3-qcommon-common-ml-996149572"></a>
### readKey

```ml
function readKey(state, filename)
```

Read key in qcommon.common; the normal completion returns `key`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`. |
| `filename` | `dynamic` | — | Filename used in `(filename + "/q3key")` and `state.services.readFn(state.services.context, (filename + "/q3key"))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L425)

- [mq3.qcommon.common.Redirect](Type-mq3-qcommon-common-redirect-587251143.md) — struct
<a id="function-function-mq3-qcommon-common-s-malloc-function-s-malloc-state-size-src-mq3-qcommon-common-ml-1711004594"></a>
### S_Malloc

```ml
function S_Malloc(state, size)
```

Return `mq3.qcommon.common.S_MallocDebug(state, size, "", "", 0)` from `qcommon.common.S_Malloc`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.common.S_MallocDebug`. |
| `size` | `dynamic` | — | Size passed as `size` to `mq3.qcommon.common.S_MallocDebug`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L260)

<a id="function-function-mq3-qcommon-common-s-mallocdebug-function-s-mallocdebug-state-size-label-file-line-src-mq3-qcommon-common-ml-706434636"></a>
### S_MallocDebug

```ml
function S_MallocDebug(state, size, label, file, line)
```

Update `state.zone` in qcommon.common; the normal completion returns `value`.

Direct state writes: `state.zone`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `zone`, `smallZone`. Updated in place: `zone`. |
| `size` | `dynamic` | — | Size passed as `size` to `mq3.qcommon.common.Z_TagMallocDebug`. |
| `label` | `dynamic` | — | Label passed as `label` to `mq3.qcommon.common.Z_TagMallocDebug`. |
| `file` | `dynamic` | — | File passed as `file` to `mq3.qcommon.common.Z_TagMallocDebug`. |
| `line` | `dynamic` | — | Line passed as `line` to `mq3.qcommon.common.Z_TagMallocDebug`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L256)

<a id="function-function-mq3-qcommon-common-sameprefix-function-sameprefix-left-right-count-casesensitive-src-mq3-qcommon-common-ml-2054127142"></a>
### samePrefix

```ml
function samePrefix(left, right, count, casesensitive)
```

Test same prefix in qcommon.common; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Left used in `bytes(left)`. |
| `right` | `dynamic` | — | Right used in `bytes(right)`. |
| `count` | `dynamic` | — | Count used in `(count - 1)` and `(len(a) < count)`. |
| `casesensitive` | `dynamic` | — | Casesensitive operand used by `samePrefix`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L80)

<a id="function-function-mq3-qcommon-common-services-function-services-context-src-mq3-qcommon-common-ml-1923402619"></a>
### services

```ml
function services(context)
```

Create `mq3.qcommon.common.Services` with context=context; printFn=void; errorFn=void; quitFn=void; 14 further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.qcommon.common.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L55)

- [mq3.qcommon.common.Services](Type-mq3-qcommon-common-services-1183297755.md) — struct
- [mq3.qcommon.common.State](Type-mq3-qcommon-common-state-41417224.md) — struct
- [mq3.qcommon.common.SysEvent](Type-mq3-qcommon-common-sysevent-1699934460.md) — struct
<a id="constant-constant-mq3-qcommon-common-tag-botlib-const-tag-botlib-2-src-mq3-qcommon-common-ml-1328593859"></a>
### TAG_BOTLIB

```ml
const TAG_BOTLIB = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L29)

<a id="constant-constant-mq3-qcommon-common-tag-free-const-tag-free-0-src-mq3-qcommon-common-ml-1060078321"></a>
### TAG_FREE

```ml
const TAG_FREE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L27)

<a id="constant-constant-mq3-qcommon-common-tag-general-const-tag-general-1-src-mq3-qcommon-common-ml-1460866942"></a>
### TAG_GENERAL

```ml
const TAG_GENERAL = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L28)

<a id="constant-constant-mq3-qcommon-common-tag-renderer-const-tag-renderer-3-src-mq3-qcommon-common-ml-1383579030"></a>
### TAG_RENDERER

```ml
const TAG_RENDERER = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L30)

<a id="function-function-mq3-qcommon-common-validkey-function-validkey-state-key-src-mq3-qcommon-common-ml-1689131672"></a>
### validKey

```ml
function validKey(state, key)
```

Validate key in qcommon.common; the normal completion returns `state.services.validateKeyFn(state.services.context, key)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`. |
| `key` | `dynamic` | — | Key used in `bytes(key)` and `len(bytes(key))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L421)

<a id="function-function-mq3-qcommon-common-visible-function-visible-text-src-mq3-qcommon-common-ml-1124340281"></a>
### visible

```ml
function visible(text)
```

Compute visible in qcommon.common; the normal completion returns `decode(slice(data, 0, count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L71)

<a id="function-function-mq3-qcommon-common-z-availablememory-function-z-availablememory-state-src-mq3-qcommon-common-ml-937293619"></a>
### Z_AvailableMemory

```ml
function Z_AvailableMemory(state)
```

Return `mq3.qcommon.common.Z_AvailableZoneMemory(state.zone)` from `qcommon.common.Z_AvailableMemory`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `zone`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L221)

<a id="function-function-mq3-qcommon-common-z-availablezonememory-function-z-availablezonememory-zone-src-mq3-qcommon-common-ml-1213818792"></a>
### Z_AvailableZoneMemory

```ml
function Z_AvailableZoneMemory(zone)
```

Compute z available zone memory in qcommon.common; the normal completion returns `(zone.capacity - zone.used)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `zone` | `dynamic` | — | Record exposing `capacity`, `used`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L218)

<a id="function-function-mq3-qcommon-common-z-checkheap-function-z-checkheap-state-src-mq3-qcommon-common-ml-1146204395"></a>
### Z_CheckHeap

```ml
function Z_CheckHeap(state)
```

Compute z check heap in qcommon.common; the normal completion returns `(used == state.zone.used)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `zone`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L276)

<a id="function-function-mq3-qcommon-common-z-clearzone-function-z-clearzone-zone-size-src-mq3-qcommon-common-ml-468800729"></a>
### Z_ClearZone

```ml
function Z_ClearZone(zone, size)
```

Update `zone.capacity`, `zone.used`, `zone.nextHandle`, `zone.allocations` in qcommon.common.

Direct state writes: `zone.capacity`, `zone.used`, `zone.nextHandle`, `zone.allocations`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `zone` | `dynamic` | — | Updated in place: `capacity`, `used`, `nextHandle`, `allocations`. |
| `size` | `dynamic` | — | Size operand used by `Z_ClearZone`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L215)

<a id="function-function-mq3-qcommon-common-z-free-function-z-free-state-value-src-mq3-qcommon-common-ml-2061193678"></a>
### Z_Free

```ml
function Z_Free(state, value)
```

Update `value.freed` in qcommon.common; the normal completion returns `true`.

Direct state writes: `value.freed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `zone`, `smallZone`. |
| `value` | `dynamic` | — | Record exposing `freed`, `size`. Updated in place: `freed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L266)

<a id="function-function-mq3-qcommon-common-z-freetags-function-z-freetags-state-tag-src-mq3-qcommon-common-ml-2037615277"></a>
### Z_FreeTags

```ml
function Z_FreeTags(state, tag)
```

Compute z free tags in qcommon.common; the normal completion returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `zone`. |
| `tag` | `dynamic` | — | Tag used in `(value.tag == tag)` and `(not value.freed and (value.tag == tag))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L273)

<a id="function-function-mq3-qcommon-common-z-logheap-function-z-logheap-state-src-mq3-qcommon-common-ml-530650031"></a>
### Z_LogHeap

```ml
function Z_LogHeap(state)
```

Compute qcommon.common.Z_LogHeap as `[Z_LogZoneHeap(state, state.zone, "MAIN"), Z_LogZoneHeap(state, state.smallZone, "SMALL")]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `zone`, `smallZone`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L284)

<a id="function-function-mq3-qcommon-common-z-logzoneheap-function-z-logzoneheap-state-zone-name-src-mq3-qcommon-common-ml-1797015232"></a>
### Z_LogZoneHeap

```ml
function Z_LogZoneHeap(state, zone, name)
```

Compute z log zone heap in qcommon.common; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `zone` | `dynamic` | — | Record exposing `used`, `capacity`, `allocations`. |
| `name` | `dynamic` | — | Name operand used by `Z_LogZoneHeap`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L281)

<a id="function-function-mq3-qcommon-common-z-malloc-function-z-malloc-state-size-src-mq3-qcommon-common-ml-1743034678"></a>
### Z_Malloc

```ml
function Z_Malloc(state, size)
```

Return `mq3.qcommon.common.Z_MallocDebug(state, size, "", "", 0)` from `qcommon.common.Z_Malloc`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.common.Z_MallocDebug`. |
| `size` | `dynamic` | — | Size passed as `size` to `mq3.qcommon.common.Z_MallocDebug`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L247)

<a id="function-function-mq3-qcommon-common-z-mallocdebug-function-z-mallocdebug-state-size-label-file-line-src-mq3-qcommon-common-ml-989484002"></a>
### Z_MallocDebug

```ml
function Z_MallocDebug(state, size, label, file, line)
```

Return `mq3.qcommon.common.Z_TagMallocDebug(state, size, TAG_GENERAL, label, file, line)` from `qcommon.common.Z_MallocDebug`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.common.Z_TagMallocDebug`. |
| `size` | `dynamic` | — | Size passed as `size` to `mq3.qcommon.common.Z_TagMallocDebug`. |
| `label` | `dynamic` | — | Label passed as `label` to `mq3.qcommon.common.Z_TagMallocDebug`. |
| `file` | `dynamic` | — | File passed as `file` to `mq3.qcommon.common.Z_TagMallocDebug`. |
| `line` | `dynamic` | — | Line passed as `line` to `mq3.qcommon.common.Z_TagMallocDebug`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L243)

<a id="function-function-mq3-qcommon-common-z-tagmalloc-function-z-tagmalloc-state-size-tag-src-mq3-qcommon-common-ml-492338018"></a>
### Z_TagMalloc

```ml
function Z_TagMalloc(state, size, tag)
```

Return `mq3.qcommon.common.Z_TagMallocDebug(state, size, tag, "", "", 0)` from `qcommon.common.Z_TagMalloc`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.qcommon.common.Z_TagMallocDebug`. |
| `size` | `dynamic` | — | Size passed as `size` to `mq3.qcommon.common.Z_TagMallocDebug`. |
| `tag` | `dynamic` | — | Tag passed as `tag` to `mq3.qcommon.common.Z_TagMallocDebug`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L236)

<a id="function-function-mq3-qcommon-common-z-tagmallocdebug-function-z-tagmallocdebug-state-size-tag-label-file-line-src-mq3-qcommon-common-ml-2025716620"></a>
### Z_TagMallocDebug

```ml
function Z_TagMallocDebug(state, size, tag, label, file, line)
```

Compute z tag malloc debug in qcommon.common; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `zone`. |
| `size` | `dynamic` | — | Initial `size` field stored in the returned or constructed `mq3.qcommon.common.Allocation` record. |
| `tag` | `dynamic` | — | Initial `tag` field stored in the returned or constructed `mq3.qcommon.common.Allocation` record. |
| `label` | `dynamic` | — | Initial `label` field stored in the returned or constructed `mq3.qcommon.common.Allocation` record. |
| `file` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `line` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L229)

- [mq3.qcommon.common.Zone](Type-mq3-qcommon-common-zone-1187699781.md) — struct
