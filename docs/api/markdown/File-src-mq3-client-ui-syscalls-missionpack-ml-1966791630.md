# `src/mq3/client/ui_syscalls_missionpack.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_syscalls_missionpack`](Package-mq3-client-ui-syscalls-missionpack-1517898158.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-client-ui-syscalls-missionpack-callvoid-function-callvoid-state-opcode-arguments-src-mq3-client-ui-syscalls-missionpack-ml-1978935421"></a>
### callVoid

```ml
function callVoid(state, opcode, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `opcode` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L115)

<a id="function-function-mq3-client-ui-syscalls-missionpack-dllentry-function-dllentry-syscallptr-context-src-mq3-client-ui-syscalls-missionpack-ml-784372018"></a>
### dllEntry

```ml
function dllEntry(syscallptr, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `syscallptr` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L104)

<a id="function-function-mq3-client-ui-syscalls-missionpack-invoke-function-invoke-state-opcode-arguments-src-mq3-client-ui-syscalls-missionpack-ml-1566701121"></a>
### invoke

```ml
function invoke(state, opcode, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `opcode` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L109)

<a id="function-function-mq3-client-ui-syscalls-missionpack-passfloat-function-passfloat-x-src-mq3-client-ui-syscalls-missionpack-ml-1834682972"></a>
### PASSFLOAT

```ml
function PASSFLOAT(x)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L117)

- [mq3.client.ui_syscalls_missionpack.State](Type-mq3-client-ui-syscalls-missionpack-state-1696984629.md) — struct
<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-argc-function-trap-argc-state-src-mq3-client-ui-syscalls-missionpack-ml-1584027283"></a>
### trap_Argc

```ml
function trap_Argc(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L133)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-argv-function-trap-argv-state-index-buffer-bufferlength-src-mq3-client-ui-syscalls-missionpack-ml-496819107"></a>
### trap_Argv

```ml
function trap_Argv(state, index, buffer, bufferLength)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `bufferLength` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L134)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cin-drawcinematic-function-trap-cin-drawcinematic-state-handle-src-mq3-client-ui-syscalls-missionpack-ml-644879787"></a>
### trap_CIN_DrawCinematic

```ml
function trap_CIN_DrawCinematic(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L214)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cin-playcinematic-function-trap-cin-playcinematic-state-name-x-y-w-h-bits-src-mq3-client-ui-syscalls-missionpack-ml-2023971800"></a>
### trap_CIN_PlayCinematic

```ml
function trap_CIN_PlayCinematic(state, name, x, y, w, h, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L211)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cin-runcinematic-function-trap-cin-runcinematic-state-handle-src-mq3-client-ui-syscalls-missionpack-ml-1655183273"></a>
### trap_CIN_RunCinematic

```ml
function trap_CIN_RunCinematic(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L213)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cin-setextents-function-trap-cin-setextents-state-handle-x-y-w-h-src-mq3-client-ui-syscalls-missionpack-ml-289157819"></a>
### trap_CIN_SetExtents

```ml
function trap_CIN_SetExtents(state, handle, x, y, w, h)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L215)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cin-stopcinematic-function-trap-cin-stopcinematic-state-handle-src-mq3-client-ui-syscalls-missionpack-ml-707022759"></a>
### trap_CIN_StopCinematic

```ml
function trap_CIN_StopCinematic(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L212)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cm-lerptag-function-trap-cm-lerptag-state-tag-model-startframe-endframe-frac-tagname-src-mq3-client-ui-syscalls-missionpack-ml-1002333852"></a>
### trap_CM_LerpTag

```ml
function trap_CM_LerpTag(state, tag, model, startFrame, endFrame, frac, tagName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `tag` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `startFrame` | `dynamic` | — |  |
| `endFrame` | `dynamic` | — |  |
| `frac` | `dynamic` | — |  |
| `tagName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L159)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cmd-executetext-function-trap-cmd-executetext-state-execwhen-text-src-mq3-client-ui-syscalls-missionpack-ml-94257967"></a>
### trap_Cmd_ExecuteText

```ml
function trap_Cmd_ExecuteText(state, execWhen, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `execWhen` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L135)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cvar-create-function-trap-cvar-create-state-varname-varvalue-flags-src-mq3-client-ui-syscalls-missionpack-ml-555442004"></a>
### trap_Cvar_Create

```ml
function trap_Cvar_Create(state, varName, varValue, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `varName` | `dynamic` | — |  |
| `varValue` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L130)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cvar-infostringbuffer-function-trap-cvar-infostringbuffer-state-bit-buffer-bufsize-src-mq3-client-ui-syscalls-missionpack-ml-814298468"></a>
### trap_Cvar_InfoStringBuffer

```ml
function trap_Cvar_InfoStringBuffer(state, bit, buffer, bufsize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bit` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `bufsize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L131)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cvar-register-function-trap-cvar-register-state-cvar-varname-value-flags-src-mq3-client-ui-syscalls-missionpack-ml-2066539891"></a>
### trap_Cvar_Register

```ml
function trap_Cvar_Register(state, cvar, varName, value, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cvar` | `dynamic` | — |  |
| `varName` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L123)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cvar-reset-function-trap-cvar-reset-state-name-src-mq3-client-ui-syscalls-missionpack-ml-2084521592"></a>
### trap_Cvar_Reset

```ml
function trap_Cvar_Reset(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L129)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cvar-set-function-trap-cvar-set-state-varname-value-src-mq3-client-ui-syscalls-missionpack-ml-1844923358"></a>
### trap_Cvar_Set

```ml
function trap_Cvar_Set(state, varName, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `varName` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L125)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cvar-setvalue-function-trap-cvar-setvalue-state-varname-value-src-mq3-client-ui-syscalls-missionpack-ml-1191582076"></a>
### trap_Cvar_SetValue

```ml
function trap_Cvar_SetValue(state, varName, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `varName` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L128)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cvar-update-function-trap-cvar-update-state-cvar-src-mq3-client-ui-syscalls-missionpack-ml-2107908871"></a>
### trap_Cvar_Update

```ml
function trap_Cvar_Update(state, cvar)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cvar` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L124)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cvar-variablestringbuffer-function-trap-cvar-variablestringbuffer-state-varname-buffer-bufsize-src-mq3-client-ui-syscalls-missionpack-ml-1926139061"></a>
### trap_Cvar_VariableStringBuffer

```ml
function trap_Cvar_VariableStringBuffer(state, varName, buffer, bufsize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `varName` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `bufsize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L127)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-cvar-variablevalue-function-trap-cvar-variablevalue-state-varname-src-mq3-client-ui-syscalls-missionpack-ml-448703457"></a>
### trap_Cvar_VariableValue

```ml
function trap_Cvar_VariableValue(state, varName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `varName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L126)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-error-function-trap-error-state-string-src-mq3-client-ui-syscalls-missionpack-ml-367164062"></a>
### trap_Error

```ml
function trap_Error(state, string)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `string` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L120)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-fs-fclosefile-function-trap-fs-fclosefile-state-handle-src-mq3-client-ui-syscalls-missionpack-ml-1709768271"></a>
### trap_FS_FCloseFile

```ml
function trap_FS_FCloseFile(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L140)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-fs-fopenfile-function-trap-fs-fopenfile-state-qpath-handle-mode-src-mq3-client-ui-syscalls-missionpack-ml-1439407368"></a>
### trap_FS_FOpenFile

```ml
function trap_FS_FOpenFile(state, qpath, handle, mode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `qpath` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L137)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-fs-getfilelist-function-trap-fs-getfilelist-state-path-extension-listbuf-bufsize-src-mq3-client-ui-syscalls-missionpack-ml-2057824134"></a>
### trap_FS_GetFileList

```ml
function trap_FS_GetFileList(state, path, extension, listbuf, bufsize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |
| `listbuf` | `dynamic` | — |  |
| `bufsize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L141)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-fs-read-function-trap-fs-read-state-buffer-length-handle-src-mq3-client-ui-syscalls-missionpack-ml-1312168777"></a>
### trap_FS_Read

```ml
function trap_FS_Read(state, buffer, length, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L138)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-fs-seek-function-trap-fs-seek-state-handle-offset-origin-src-mq3-client-ui-syscalls-missionpack-ml-1207812652"></a>
### trap_FS_Seek

```ml
function trap_FS_Seek(state, handle, offset, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L142)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-fs-write-function-trap-fs-write-state-buffer-length-handle-src-mq3-client-ui-syscalls-missionpack-ml-170096727"></a>
### trap_FS_Write

```ml
function trap_FS_Write(state, buffer, length, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L139)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-getcdkey-function-trap-getcdkey-state-buffer-buflen-src-mq3-client-ui-syscalls-missionpack-ml-509781103"></a>
### trap_GetCDKey

```ml
function trap_GetCDKey(state, buffer, buflen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `buflen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L201)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-getclientstate-function-trap-getclientstate-state-clientstate-src-mq3-client-ui-syscalls-missionpack-ml-533466551"></a>
### trap_GetClientState

```ml
function trap_GetClientState(state, clientState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L177)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-getclipboarddata-function-trap-getclipboarddata-state-buffer-bufsize-src-mq3-client-ui-syscalls-missionpack-ml-1438215961"></a>
### trap_GetClipboardData

```ml
function trap_GetClipboardData(state, buffer, bufsize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `bufsize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L176)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-getconfigstring-function-trap-getconfigstring-state-index-buffer-bufsize-src-mq3-client-ui-syscalls-missionpack-ml-703764827"></a>
### trap_GetConfigString

```ml
function trap_GetConfigString(state, index, buffer, bufsize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `bufsize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L179)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-getglconfig-function-trap-getglconfig-state-glconfig-src-mq3-client-ui-syscalls-missionpack-ml-1737145406"></a>
### trap_GetGlconfig

```ml
function trap_GetGlconfig(state, glconfig)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `glconfig` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L178)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-key-clearstates-function-trap-key-clearstates-state-src-mq3-client-ui-syscalls-missionpack-ml-1607181741"></a>
### trap_Key_ClearStates

```ml
function trap_Key_ClearStates(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L172)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-key-getbindingbuf-function-trap-key-getbindingbuf-state-keynum-buffer-buflen-src-mq3-client-ui-syscalls-missionpack-ml-2139954176"></a>
### trap_Key_GetBindingBuf

```ml
function trap_Key_GetBindingBuf(state, keynum, buffer, buflen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `keynum` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `buflen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L167)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-key-getcatcher-function-trap-key-getcatcher-state-src-mq3-client-ui-syscalls-missionpack-ml-1595182613"></a>
### trap_Key_GetCatcher

```ml
function trap_Key_GetCatcher(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L173)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-key-getoverstrikemode-function-trap-key-getoverstrikemode-state-src-mq3-client-ui-syscalls-missionpack-ml-1501896649"></a>
### trap_Key_GetOverstrikeMode

```ml
function trap_Key_GetOverstrikeMode(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L170)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-key-isdown-function-trap-key-isdown-state-keynum-src-mq3-client-ui-syscalls-missionpack-ml-986155658"></a>
### trap_Key_IsDown

```ml
function trap_Key_IsDown(state, keynum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `keynum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L169)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-key-keynumtostringbuf-function-trap-key-keynumtostringbuf-state-keynum-buffer-buflen-src-mq3-client-ui-syscalls-missionpack-ml-659496800"></a>
### trap_Key_KeynumToStringBuf

```ml
function trap_Key_KeynumToStringBuf(state, keynum, buffer, buflen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `keynum` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `buflen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L166)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-key-setbinding-function-trap-key-setbinding-state-keynum-binding-src-mq3-client-ui-syscalls-missionpack-ml-1833234243"></a>
### trap_Key_SetBinding

```ml
function trap_Key_SetBinding(state, keynum, binding)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `keynum` | `dynamic` | — |  |
| `binding` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L168)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-key-setcatcher-function-trap-key-setcatcher-state-catcher-src-mq3-client-ui-syscalls-missionpack-ml-1647670223"></a>
### trap_Key_SetCatcher

```ml
function trap_Key_SetCatcher(state, catcher)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `catcher` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L174)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-key-setoverstrikemode-function-trap-key-setoverstrikemode-state-value-src-mq3-client-ui-syscalls-missionpack-ml-971823388"></a>
### trap_Key_SetOverstrikeMode

```ml
function trap_Key_SetOverstrikeMode(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L171)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-addserver-function-trap-lan-addserver-state-source-name-address-src-mq3-client-ui-syscalls-missionpack-ml-1011866429"></a>
### trap_LAN_AddServer

```ml
function trap_LAN_AddServer(state, source, name, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L196)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-clearping-function-trap-lan-clearping-state-index-src-mq3-client-ui-syscalls-missionpack-ml-576129903"></a>
### trap_LAN_ClearPing

```ml
function trap_LAN_ClearPing(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L190)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-compareservers-function-trap-lan-compareservers-state-source-sortkey-sortdir-first-second-src-mq3-client-ui-syscalls-missionpack-ml-1472519556"></a>
### trap_LAN_CompareServers

```ml
function trap_LAN_CompareServers(state, source, sortKey, sortDir, first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `sortKey` | `dynamic` | — |  |
| `sortDir` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L198)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-getping-function-trap-lan-getping-state-index-buffer-buflen-pingtime-src-mq3-client-ui-syscalls-missionpack-ml-537092310"></a>
### trap_LAN_GetPing

```ml
function trap_LAN_GetPing(state, index, buffer, buflen, pingtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `buflen` | `dynamic` | — |  |
| `pingtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L191)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-getpinginfo-function-trap-lan-getpinginfo-state-index-buffer-buflen-src-mq3-client-ui-syscalls-missionpack-ml-1930826097"></a>
### trap_LAN_GetPingInfo

```ml
function trap_LAN_GetPingInfo(state, index, buffer, buflen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `buflen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L192)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-getpingqueuecount-function-trap-lan-getpingqueuecount-state-src-mq3-client-ui-syscalls-missionpack-ml-2067243229"></a>
### trap_LAN_GetPingQueueCount

```ml
function trap_LAN_GetPingQueueCount(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L185)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-getserveraddressstring-function-trap-lan-getserveraddressstring-state-source-index-buffer-buflen-src-mq3-client-ui-syscalls-missionpack-ml-605731484"></a>
### trap_LAN_GetServerAddressString

```ml
function trap_LAN_GetServerAddressString(state, source, index, buffer, buflen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `buflen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L182)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-getservercount-function-trap-lan-getservercount-state-source-src-mq3-client-ui-syscalls-missionpack-ml-1154491734"></a>
### trap_LAN_GetServerCount

```ml
function trap_LAN_GetServerCount(state, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L181)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-getserverinfo-function-trap-lan-getserverinfo-state-source-index-buffer-buflen-src-mq3-client-ui-syscalls-missionpack-ml-692961956"></a>
### trap_LAN_GetServerInfo

```ml
function trap_LAN_GetServerInfo(state, source, index, buffer, buflen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `buflen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L183)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-getserverping-function-trap-lan-getserverping-state-source-index-src-mq3-client-ui-syscalls-missionpack-ml-157703550"></a>
### trap_LAN_GetServerPing

```ml
function trap_LAN_GetServerPing(state, source, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L184)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-loadcachedservers-function-trap-lan-loadcachedservers-state-src-mq3-client-ui-syscalls-missionpack-ml-992822989"></a>
### trap_LAN_LoadCachedServers

```ml
function trap_LAN_LoadCachedServers(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L188)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-markservervisible-function-trap-lan-markservervisible-state-source-index-visible-src-mq3-client-ui-syscalls-missionpack-ml-83759980"></a>
### trap_LAN_MarkServerVisible

```ml
function trap_LAN_MarkServerVisible(state, source, index, visible)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `visible` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L193)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-removeserver-function-trap-lan-removeserver-state-source-address-src-mq3-client-ui-syscalls-missionpack-ml-397962464"></a>
### trap_LAN_RemoveServer

```ml
function trap_LAN_RemoveServer(state, source, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L197)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-resetpings-function-trap-lan-resetpings-state-index-src-mq3-client-ui-syscalls-missionpack-ml-227246531"></a>
### trap_LAN_ResetPings

```ml
function trap_LAN_ResetPings(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L189)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-savecachedservers-function-trap-lan-savecachedservers-state-src-mq3-client-ui-syscalls-missionpack-ml-1500794181"></a>
### trap_LAN_SaveCachedServers

```ml
function trap_LAN_SaveCachedServers(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L187)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-serverisvisible-function-trap-lan-serverisvisible-state-source-index-src-mq3-client-ui-syscalls-missionpack-ml-227973142"></a>
### trap_LAN_ServerIsVisible

```ml
function trap_LAN_ServerIsVisible(state, source, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L194)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-serverstatus-function-trap-lan-serverstatus-state-address-status-maxlen-src-mq3-client-ui-syscalls-missionpack-ml-824638864"></a>
### trap_LAN_ServerStatus

```ml
function trap_LAN_ServerStatus(state, address, status, maxLen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |
| `maxLen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L186)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-lan-updatevisiblepings-function-trap-lan-updatevisiblepings-state-source-src-mq3-client-ui-syscalls-missionpack-ml-2128126510"></a>
### trap_LAN_UpdateVisiblePings

```ml
function trap_LAN_UpdateVisiblePings(state, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L195)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-memoryremaining-function-trap-memoryremaining-state-src-mq3-client-ui-syscalls-missionpack-ml-1120210257"></a>
### trap_MemoryRemaining

```ml
function trap_MemoryRemaining(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L200)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-milliseconds-function-trap-milliseconds-state-src-mq3-client-ui-syscalls-missionpack-ml-591327165"></a>
### trap_Milliseconds

```ml
function trap_Milliseconds(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L121)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-pc-addglobaldefine-function-trap-pc-addglobaldefine-state-define-src-mq3-client-ui-syscalls-missionpack-ml-1426517774"></a>
### trap_PC_AddGlobalDefine

```ml
function trap_PC_AddGlobalDefine(state, define)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `define` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L204)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-pc-freesource-function-trap-pc-freesource-state-handle-src-mq3-client-ui-syscalls-missionpack-ml-1672551027"></a>
### trap_PC_FreeSource

```ml
function trap_PC_FreeSource(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L206)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-pc-loadsource-function-trap-pc-loadsource-state-filename-src-mq3-client-ui-syscalls-missionpack-ml-38799322"></a>
### trap_PC_LoadSource

```ml
function trap_PC_LoadSource(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L205)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-pc-readtoken-function-trap-pc-readtoken-state-handle-token-src-mq3-client-ui-syscalls-missionpack-ml-1770892456"></a>
### trap_PC_ReadToken

```ml
function trap_PC_ReadToken(state, handle, token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L207)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-pc-sourcefileandline-function-trap-pc-sourcefileandline-state-handle-filename-line-src-mq3-client-ui-syscalls-missionpack-ml-947631958"></a>
### trap_PC_SourceFileAndLine

```ml
function trap_PC_SourceFileAndLine(state, handle, filename, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L208)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-print-function-trap-print-state-string-src-mq3-client-ui-syscalls-missionpack-ml-1482282246"></a>
### trap_Print

```ml
function trap_Print(state, string)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `string` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L119)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-r-addlighttoscene-function-trap-r-addlighttoscene-state-origin-intensity-r-g-b-src-mq3-client-ui-syscalls-missionpack-ml-1646328963"></a>
### trap_R_AddLightToScene

```ml
function trap_R_AddLightToScene(state, origin, intensity, r, g, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `intensity` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `g` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L151)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-r-addpolytoscene-function-trap-r-addpolytoscene-state-shader-numverts-verts-src-mq3-client-ui-syscalls-missionpack-ml-1128645812"></a>
### trap_R_AddPolyToScene

```ml
function trap_R_AddPolyToScene(state, shader, numVerts, verts)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `numVerts` | `dynamic` | — |  |
| `verts` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L150)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-r-addrefentitytoscene-function-trap-r-addrefentitytoscene-state-entity-src-mq3-client-ui-syscalls-missionpack-ml-998011456"></a>
### trap_R_AddRefEntityToScene

```ml
function trap_R_AddRefEntityToScene(state, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L149)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-r-clearscene-function-trap-r-clearscene-state-src-mq3-client-ui-syscalls-missionpack-ml-1258017401"></a>
### trap_R_ClearScene

```ml
function trap_R_ClearScene(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L148)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-r-drawstretchpic-function-trap-r-drawstretchpic-state-x-y-w-h-s1-t1-s2-t2-shader-src-mq3-client-ui-syscalls-missionpack-ml-1265991658"></a>
### trap_R_DrawStretchPic

```ml
function trap_R_DrawStretchPic(state, x, y, w, h, s1, t1, s2, t2, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `s1` | `dynamic` | — |  |
| `t1` | `dynamic` | — |  |
| `s2` | `dynamic` | — |  |
| `t2` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L154)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-r-modelbounds-function-trap-r-modelbounds-state-model-mins-maxs-src-mq3-client-ui-syscalls-missionpack-ml-261202838"></a>
### trap_R_ModelBounds

```ml
function trap_R_ModelBounds(state, model, mins, maxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L155)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-r-registerfont-function-trap-r-registerfont-state-fontname-pointsize-font-src-mq3-client-ui-syscalls-missionpack-ml-783258633"></a>
### trap_R_RegisterFont

```ml
function trap_R_RegisterFont(state, fontName, pointSize, font)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `fontName` | `dynamic` | — |  |
| `pointSize` | `dynamic` | — |  |
| `font` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L146)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-r-registermodel-function-trap-r-registermodel-state-name-src-mq3-client-ui-syscalls-missionpack-ml-1317650620"></a>
### trap_R_RegisterModel

```ml
function trap_R_RegisterModel(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L144)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-r-registershadernomip-function-trap-r-registershadernomip-state-name-src-mq3-client-ui-syscalls-missionpack-ml-995549200"></a>
### trap_R_RegisterShaderNoMip

```ml
function trap_R_RegisterShaderNoMip(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L147)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-r-registerskin-function-trap-r-registerskin-state-name-src-mq3-client-ui-syscalls-missionpack-ml-1128038802"></a>
### trap_R_RegisterSkin

```ml
function trap_R_RegisterSkin(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L145)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-r-remapshader-function-trap-r-remapshader-state-oldshader-newshader-timeoffset-src-mq3-client-ui-syscalls-missionpack-ml-982608222"></a>
### trap_R_RemapShader

```ml
function trap_R_RemapShader(state, oldShader, newShader, timeOffset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `oldShader` | `dynamic` | — |  |
| `newShader` | `dynamic` | — |  |
| `timeOffset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L156)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-r-renderscene-function-trap-r-renderscene-state-refdef-src-mq3-client-ui-syscalls-missionpack-ml-61132737"></a>
### trap_R_RenderScene

```ml
function trap_R_RenderScene(state, refdef)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L152)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-r-setcolor-function-trap-r-setcolor-state-rgba-src-mq3-client-ui-syscalls-missionpack-ml-897118883"></a>
### trap_R_SetColor

```ml
function trap_R_SetColor(state, rgba)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rgba` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L153)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-realtime-function-trap-realtime-state-qtime-src-mq3-client-ui-syscalls-missionpack-ml-426173511"></a>
### trap_RealTime

```ml
function trap_RealTime(state, qtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `qtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L210)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-s-registersound-function-trap-s-registersound-state-sample-compressed-src-mq3-client-ui-syscalls-missionpack-ml-868489916"></a>
### trap_S_RegisterSound

```ml
function trap_S_RegisterSound(state, sample, compressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sample` | `dynamic` | — |  |
| `compressed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L162)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-s-startbackgroundtrack-function-trap-s-startbackgroundtrack-state-intro-loopname-src-mq3-client-ui-syscalls-missionpack-ml-230462144"></a>
### trap_S_StartBackgroundTrack

```ml
function trap_S_StartBackgroundTrack(state, intro, loopName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `intro` | `dynamic` | — |  |
| `loopName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L164)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-s-startlocalsound-function-trap-s-startlocalsound-state-sfx-channelnum-src-mq3-client-ui-syscalls-missionpack-ml-1768364481"></a>
### trap_S_StartLocalSound

```ml
function trap_S_StartLocalSound(state, sfx, channelNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sfx` | `dynamic` | — |  |
| `channelNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L161)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-s-stopbackgroundtrack-function-trap-s-stopbackgroundtrack-state-src-mq3-client-ui-syscalls-missionpack-ml-539547353"></a>
### trap_S_StopBackgroundTrack

```ml
function trap_S_StopBackgroundTrack(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L163)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-setcdkey-function-trap-setcdkey-state-buffer-src-mq3-client-ui-syscalls-missionpack-ml-1507685439"></a>
### trap_SetCDKey

```ml
function trap_SetCDKey(state, buffer)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L202)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-setpbclstatus-function-trap-setpbclstatus-state-status-src-mq3-client-ui-syscalls-missionpack-ml-851223219"></a>
### trap_SetPbClStatus

```ml
function trap_SetPbClStatus(state, status)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L217)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-updatescreen-function-trap-updatescreen-state-src-mq3-client-ui-syscalls-missionpack-ml-481499031"></a>
### trap_UpdateScreen

```ml
function trap_UpdateScreen(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L157)

<a id="function-function-mq3-client-ui-syscalls-missionpack-trap-verifycdkey-function-trap-verifycdkey-state-key-checksum-src-mq3-client-ui-syscalls-missionpack-ml-1478808531"></a>
### trap_VerifyCDKey

```ml
function trap_VerifyCDKey(state, key, checksum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `checksum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L216)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-argc-const-ui-argc-10-src-mq3-client-ui-syscalls-missionpack-ml-1428007968"></a>
### UI_ARGC

```ml
const UI_ARGC = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L23)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-argv-const-ui-argv-11-src-mq3-client-ui-syscalls-missionpack-ml-1758815267"></a>
### UI_ARGV

```ml
const UI_ARGV = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L24)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cin-drawcinematic-const-ui-cin-drawcinematic-78-src-mq3-client-ui-syscalls-missionpack-ml-501677170"></a>
### UI_CIN_DRAWCINEMATIC

```ml
const UI_CIN_DRAWCINEMATIC = 78
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L91)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cin-playcinematic-const-ui-cin-playcinematic-75-src-mq3-client-ui-syscalls-missionpack-ml-960644341"></a>
### UI_CIN_PLAYCINEMATIC

```ml
const UI_CIN_PLAYCINEMATIC = 75
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L88)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cin-runcinematic-const-ui-cin-runcinematic-77-src-mq3-client-ui-syscalls-missionpack-ml-329433847"></a>
### UI_CIN_RUNCINEMATIC

```ml
const UI_CIN_RUNCINEMATIC = 77
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L90)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cin-setextents-const-ui-cin-setextents-79-src-mq3-client-ui-syscalls-missionpack-ml-25391505"></a>
### UI_CIN_SETEXTENTS

```ml
const UI_CIN_SETEXTENTS = 79
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L92)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cin-stopcinematic-const-ui-cin-stopcinematic-76-src-mq3-client-ui-syscalls-missionpack-ml-919980828"></a>
### UI_CIN_STOPCINEMATIC

```ml
const UI_CIN_STOPCINEMATIC = 76
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L89)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cm-lerptag-const-ui-cm-lerptag-29-src-mq3-client-ui-syscalls-missionpack-ml-1684443408"></a>
### UI_CM_LERPTAG

```ml
const UI_CM_LERPTAG = 29
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L42)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cm-loadmodel-const-ui-cm-loadmodel-30-src-mq3-client-ui-syscalls-missionpack-ml-1271513902"></a>
### UI_CM_LOADMODEL

```ml
const UI_CM_LOADMODEL = 30
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L43)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cmd-executetext-const-ui-cmd-executetext-12-src-mq3-client-ui-syscalls-missionpack-ml-976565188"></a>
### UI_CMD_EXECUTETEXT

```ml
const UI_CMD_EXECUTETEXT = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L25)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cvar-create-const-ui-cvar-create-8-src-mq3-client-ui-syscalls-missionpack-ml-954914671"></a>
### UI_CVAR_CREATE

```ml
const UI_CVAR_CREATE = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L21)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cvar-infostringbuffer-const-ui-cvar-infostringbuffer-9-src-mq3-client-ui-syscalls-missionpack-ml-1252102182"></a>
### UI_CVAR_INFOSTRINGBUFFER

```ml
const UI_CVAR_INFOSTRINGBUFFER = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L22)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cvar-register-const-ui-cvar-register-50-src-mq3-client-ui-syscalls-missionpack-ml-160392664"></a>
### UI_CVAR_REGISTER

```ml
const UI_CVAR_REGISTER = 50
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L63)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cvar-reset-const-ui-cvar-reset-7-src-mq3-client-ui-syscalls-missionpack-ml-64523928"></a>
### UI_CVAR_RESET

```ml
const UI_CVAR_RESET = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L20)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cvar-set-const-ui-cvar-set-3-src-mq3-client-ui-syscalls-missionpack-ml-132427916"></a>
### UI_CVAR_SET

```ml
const UI_CVAR_SET = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L16)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cvar-setvalue-const-ui-cvar-setvalue-6-src-mq3-client-ui-syscalls-missionpack-ml-1101129311"></a>
### UI_CVAR_SETVALUE

```ml
const UI_CVAR_SETVALUE = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L19)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cvar-update-const-ui-cvar-update-51-src-mq3-client-ui-syscalls-missionpack-ml-345881175"></a>
### UI_CVAR_UPDATE

```ml
const UI_CVAR_UPDATE = 51
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L64)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cvar-variablestringbuffer-const-ui-cvar-variablestringbuffer-5-src-mq3-client-ui-syscalls-missionpack-ml-1156918082"></a>
### UI_CVAR_VARIABLESTRINGBUFFER

```ml
const UI_CVAR_VARIABLESTRINGBUFFER = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L18)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-cvar-variablevalue-const-ui-cvar-variablevalue-4-src-mq3-client-ui-syscalls-missionpack-ml-2003590549"></a>
### UI_CVAR_VARIABLEVALUE

```ml
const UI_CVAR_VARIABLEVALUE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L17)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-error-const-ui-error-0-src-mq3-client-ui-syscalls-missionpack-ml-1113383837"></a>
### UI_ERROR

```ml
const UI_ERROR = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L13)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-fs-fclosefile-const-ui-fs-fclosefile-16-src-mq3-client-ui-syscalls-missionpack-ml-231316914"></a>
### UI_FS_FCLOSEFILE

```ml
const UI_FS_FCLOSEFILE = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L29)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-fs-fopenfile-const-ui-fs-fopenfile-13-src-mq3-client-ui-syscalls-missionpack-ml-1395580125"></a>
### UI_FS_FOPENFILE

```ml
const UI_FS_FOPENFILE = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L26)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-fs-getfilelist-const-ui-fs-getfilelist-17-src-mq3-client-ui-syscalls-missionpack-ml-167133809"></a>
### UI_FS_GETFILELIST

```ml
const UI_FS_GETFILELIST = 17
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L30)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-fs-read-const-ui-fs-read-14-src-mq3-client-ui-syscalls-missionpack-ml-1273745488"></a>
### UI_FS_READ

```ml
const UI_FS_READ = 14
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L27)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-fs-seek-const-ui-fs-seek-86-src-mq3-client-ui-syscalls-missionpack-ml-974664251"></a>
### UI_FS_SEEK

```ml
const UI_FS_SEEK = 86
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L99)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-fs-write-const-ui-fs-write-15-src-mq3-client-ui-syscalls-missionpack-ml-920839511"></a>
### UI_FS_WRITE

```ml
const UI_FS_WRITE = 15
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L28)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-get-cdkey-const-ui-get-cdkey-53-src-mq3-client-ui-syscalls-missionpack-ml-558986759"></a>
### UI_GET_CDKEY

```ml
const UI_GET_CDKEY = 53
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L66)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-getclientstate-const-ui-getclientstate-44-src-mq3-client-ui-syscalls-missionpack-ml-1918060389"></a>
### UI_GETCLIENTSTATE

```ml
const UI_GETCLIENTSTATE = 44
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L57)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-getclipboarddata-const-ui-getclipboarddata-42-src-mq3-client-ui-syscalls-missionpack-ml-800663331"></a>
### UI_GETCLIPBOARDDATA

```ml
const UI_GETCLIPBOARDDATA = 42
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L55)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-getconfigstring-const-ui-getconfigstring-45-src-mq3-client-ui-syscalls-missionpack-ml-201843728"></a>
### UI_GETCONFIGSTRING

```ml
const UI_GETCONFIGSTRING = 45
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L58)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-getglconfig-const-ui-getglconfig-43-src-mq3-client-ui-syscalls-missionpack-ml-1769364326"></a>
### UI_GETGLCONFIG

```ml
const UI_GETGLCONFIG = 43
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L56)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-key-clearstates-const-ui-key-clearstates-39-src-mq3-client-ui-syscalls-missionpack-ml-590811123"></a>
### UI_KEY_CLEARSTATES

```ml
const UI_KEY_CLEARSTATES = 39
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L52)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-key-getbindingbuf-const-ui-key-getbindingbuf-34-src-mq3-client-ui-syscalls-missionpack-ml-458693070"></a>
### UI_KEY_GETBINDINGBUF

```ml
const UI_KEY_GETBINDINGBUF = 34
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L47)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-key-getcatcher-const-ui-key-getcatcher-40-src-mq3-client-ui-syscalls-missionpack-ml-493331273"></a>
### UI_KEY_GETCATCHER

```ml
const UI_KEY_GETCATCHER = 40
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L53)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-key-getoverstrikemode-const-ui-key-getoverstrikemode-37-src-mq3-client-ui-syscalls-missionpack-ml-153824245"></a>
### UI_KEY_GETOVERSTRIKEMODE

```ml
const UI_KEY_GETOVERSTRIKEMODE = 37
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L50)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-key-isdown-const-ui-key-isdown-36-src-mq3-client-ui-syscalls-missionpack-ml-970093316"></a>
### UI_KEY_ISDOWN

```ml
const UI_KEY_ISDOWN = 36
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L49)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-key-keynumtostringbuf-const-ui-key-keynumtostringbuf-33-src-mq3-client-ui-syscalls-missionpack-ml-2128321471"></a>
### UI_KEY_KEYNUMTOSTRINGBUF

```ml
const UI_KEY_KEYNUMTOSTRINGBUF = 33
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L46)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-key-setbinding-const-ui-key-setbinding-35-src-mq3-client-ui-syscalls-missionpack-ml-495286117"></a>
### UI_KEY_SETBINDING

```ml
const UI_KEY_SETBINDING = 35
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L48)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-key-setcatcher-const-ui-key-setcatcher-41-src-mq3-client-ui-syscalls-missionpack-ml-819250258"></a>
### UI_KEY_SETCATCHER

```ml
const UI_KEY_SETCATCHER = 41
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L54)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-key-setoverstrikemode-const-ui-key-setoverstrikemode-38-src-mq3-client-ui-syscalls-missionpack-ml-1957385872"></a>
### UI_KEY_SETOVERSTRIKEMODE

```ml
const UI_KEY_SETOVERSTRIKEMODE = 38
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L51)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-addserver-const-ui-lan-addserver-73-src-mq3-client-ui-syscalls-missionpack-ml-476426167"></a>
### UI_LAN_ADDSERVER

```ml
const UI_LAN_ADDSERVER = 73
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L86)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-clearping-const-ui-lan-clearping-47-src-mq3-client-ui-syscalls-missionpack-ml-2049935458"></a>
### UI_LAN_CLEARPING

```ml
const UI_LAN_CLEARPING = 47
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L60)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-compareservers-const-ui-lan-compareservers-85-src-mq3-client-ui-syscalls-missionpack-ml-540543122"></a>
### UI_LAN_COMPARESERVERS

```ml
const UI_LAN_COMPARESERVERS = 85
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L98)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-getping-const-ui-lan-getping-48-src-mq3-client-ui-syscalls-missionpack-ml-2003796181"></a>
### UI_LAN_GETPING

```ml
const UI_LAN_GETPING = 48
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L61)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-getpinginfo-const-ui-lan-getpinginfo-49-src-mq3-client-ui-syscalls-missionpack-ml-4206286"></a>
### UI_LAN_GETPINGINFO

```ml
const UI_LAN_GETPINGINFO = 49
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L62)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-getpingqueuecount-const-ui-lan-getpingqueuecount-46-src-mq3-client-ui-syscalls-missionpack-ml-1009156199"></a>
### UI_LAN_GETPINGQUEUECOUNT

```ml
const UI_LAN_GETPINGQUEUECOUNT = 46
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L59)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-getserveraddressstring-const-ui-lan-getserveraddressstring-66-src-mq3-client-ui-syscalls-missionpack-ml-105765513"></a>
### UI_LAN_GETSERVERADDRESSSTRING

```ml
const UI_LAN_GETSERVERADDRESSSTRING = 66
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L79)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-getservercount-const-ui-lan-getservercount-65-src-mq3-client-ui-syscalls-missionpack-ml-1953806116"></a>
### UI_LAN_GETSERVERCOUNT

```ml
const UI_LAN_GETSERVERCOUNT = 65
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L78)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-getserverinfo-const-ui-lan-getserverinfo-67-src-mq3-client-ui-syscalls-missionpack-ml-1121615336"></a>
### UI_LAN_GETSERVERINFO

```ml
const UI_LAN_GETSERVERINFO = 67
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L80)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-getserverping-const-ui-lan-getserverping-83-src-mq3-client-ui-syscalls-missionpack-ml-901783910"></a>
### UI_LAN_GETSERVERPING

```ml
const UI_LAN_GETSERVERPING = 83
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L96)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-loadcachedservers-const-ui-lan-loadcachedservers-71-src-mq3-client-ui-syscalls-missionpack-ml-313959337"></a>
### UI_LAN_LOADCACHEDSERVERS

```ml
const UI_LAN_LOADCACHEDSERVERS = 71
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L84)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-markservervisible-const-ui-lan-markservervisible-68-src-mq3-client-ui-syscalls-missionpack-ml-1876388327"></a>
### UI_LAN_MARKSERVERVISIBLE

```ml
const UI_LAN_MARKSERVERVISIBLE = 68
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L81)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-removeserver-const-ui-lan-removeserver-74-src-mq3-client-ui-syscalls-missionpack-ml-495835854"></a>
### UI_LAN_REMOVESERVER

```ml
const UI_LAN_REMOVESERVER = 74
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L87)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-resetpings-const-ui-lan-resetpings-70-src-mq3-client-ui-syscalls-missionpack-ml-862456938"></a>
### UI_LAN_RESETPINGS

```ml
const UI_LAN_RESETPINGS = 70
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L83)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-savecachedservers-const-ui-lan-savecachedservers-72-src-mq3-client-ui-syscalls-missionpack-ml-1792398774"></a>
### UI_LAN_SAVECACHEDSERVERS

```ml
const UI_LAN_SAVECACHEDSERVERS = 72
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L85)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-serverisvisible-const-ui-lan-serverisvisible-84-src-mq3-client-ui-syscalls-missionpack-ml-1870731815"></a>
### UI_LAN_SERVERISVISIBLE

```ml
const UI_LAN_SERVERISVISIBLE = 84
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L97)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-serverstatus-const-ui-lan-serverstatus-82-src-mq3-client-ui-syscalls-missionpack-ml-1461150667"></a>
### UI_LAN_SERVERSTATUS

```ml
const UI_LAN_SERVERSTATUS = 82
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L95)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-lan-updatevisiblepings-const-ui-lan-updatevisiblepings-69-src-mq3-client-ui-syscalls-missionpack-ml-1084252608"></a>
### UI_LAN_UPDATEVISIBLEPINGS

```ml
const UI_LAN_UPDATEVISIBLEPINGS = 69
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L82)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-memory-remaining-const-ui-memory-remaining-52-src-mq3-client-ui-syscalls-missionpack-ml-65290122"></a>
### UI_MEMORY_REMAINING

```ml
const UI_MEMORY_REMAINING = 52
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L65)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-milliseconds-const-ui-milliseconds-2-src-mq3-client-ui-syscalls-missionpack-ml-184404611"></a>
### UI_MILLISECONDS

```ml
const UI_MILLISECONDS = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L15)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-pc-add-global-define-const-ui-pc-add-global-define-57-src-mq3-client-ui-syscalls-missionpack-ml-955900225"></a>
### UI_PC_ADD_GLOBAL_DEFINE

```ml
const UI_PC_ADD_GLOBAL_DEFINE = 57
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L70)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-pc-free-source-const-ui-pc-free-source-59-src-mq3-client-ui-syscalls-missionpack-ml-211300031"></a>
### UI_PC_FREE_SOURCE

```ml
const UI_PC_FREE_SOURCE = 59
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L72)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-pc-load-source-const-ui-pc-load-source-58-src-mq3-client-ui-syscalls-missionpack-ml-607662424"></a>
### UI_PC_LOAD_SOURCE

```ml
const UI_PC_LOAD_SOURCE = 58
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L71)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-pc-read-token-const-ui-pc-read-token-60-src-mq3-client-ui-syscalls-missionpack-ml-2088352687"></a>
### UI_PC_READ_TOKEN

```ml
const UI_PC_READ_TOKEN = 60
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L73)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-pc-source-file-and-line-const-ui-pc-source-file-and-line-61-src-mq3-client-ui-syscalls-missionpack-ml-2114273866"></a>
### UI_PC_SOURCE_FILE_AND_LINE

```ml
const UI_PC_SOURCE_FILE_AND_LINE = 61
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L74)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-print-const-ui-print-1-src-mq3-client-ui-syscalls-missionpack-ml-642418804"></a>
### UI_PRINT

```ml
const UI_PRINT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L14)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-r-addlighttoscene-const-ui-r-addlighttoscene-24-src-mq3-client-ui-syscalls-missionpack-ml-1714450217"></a>
### UI_R_ADDLIGHTTOSCENE

```ml
const UI_R_ADDLIGHTTOSCENE = 24
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L37)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-r-addpolytoscene-const-ui-r-addpolytoscene-23-src-mq3-client-ui-syscalls-missionpack-ml-761054566"></a>
### UI_R_ADDPOLYTOSCENE

```ml
const UI_R_ADDPOLYTOSCENE = 23
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L36)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-r-addrefentitytoscene-const-ui-r-addrefentitytoscene-22-src-mq3-client-ui-syscalls-missionpack-ml-766472539"></a>
### UI_R_ADDREFENTITYTOSCENE

```ml
const UI_R_ADDREFENTITYTOSCENE = 22
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L35)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-r-clearscene-const-ui-r-clearscene-21-src-mq3-client-ui-syscalls-missionpack-ml-2047895844"></a>
### UI_R_CLEARSCENE

```ml
const UI_R_CLEARSCENE = 21
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L34)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-r-drawstretchpic-const-ui-r-drawstretchpic-27-src-mq3-client-ui-syscalls-missionpack-ml-1495023226"></a>
### UI_R_DRAWSTRETCHPIC

```ml
const UI_R_DRAWSTRETCHPIC = 27
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L40)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-r-modelbounds-const-ui-r-modelbounds-56-src-mq3-client-ui-syscalls-missionpack-ml-1097378560"></a>
### UI_R_MODELBOUNDS

```ml
const UI_R_MODELBOUNDS = 56
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L69)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-r-registerfont-const-ui-r-registerfont-55-src-mq3-client-ui-syscalls-missionpack-ml-750674303"></a>
### UI_R_REGISTERFONT

```ml
const UI_R_REGISTERFONT = 55
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L68)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-r-registermodel-const-ui-r-registermodel-18-src-mq3-client-ui-syscalls-missionpack-ml-257119338"></a>
### UI_R_REGISTERMODEL

```ml
const UI_R_REGISTERMODEL = 18
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L31)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-r-registershadernomip-const-ui-r-registershadernomip-20-src-mq3-client-ui-syscalls-missionpack-ml-704151011"></a>
### UI_R_REGISTERSHADERNOMIP

```ml
const UI_R_REGISTERSHADERNOMIP = 20
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L33)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-r-registerskin-const-ui-r-registerskin-19-src-mq3-client-ui-syscalls-missionpack-ml-1170725075"></a>
### UI_R_REGISTERSKIN

```ml
const UI_R_REGISTERSKIN = 19
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L32)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-r-remap-shader-const-ui-r-remap-shader-80-src-mq3-client-ui-syscalls-missionpack-ml-1236733293"></a>
### UI_R_REMAP_SHADER

```ml
const UI_R_REMAP_SHADER = 80
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L93)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-r-renderscene-const-ui-r-renderscene-25-src-mq3-client-ui-syscalls-missionpack-ml-41129530"></a>
### UI_R_RENDERSCENE

```ml
const UI_R_RENDERSCENE = 25
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L38)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-r-setcolor-const-ui-r-setcolor-26-src-mq3-client-ui-syscalls-missionpack-ml-306722281"></a>
### UI_R_SETCOLOR

```ml
const UI_R_SETCOLOR = 26
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L39)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-real-time-const-ui-real-time-64-src-mq3-client-ui-syscalls-missionpack-ml-2129098011"></a>
### UI_REAL_TIME

```ml
const UI_REAL_TIME = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L77)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-s-registersound-const-ui-s-registersound-31-src-mq3-client-ui-syscalls-missionpack-ml-1448977577"></a>
### UI_S_REGISTERSOUND

```ml
const UI_S_REGISTERSOUND = 31
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L44)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-s-startbackgroundtrack-const-ui-s-startbackgroundtrack-63-src-mq3-client-ui-syscalls-missionpack-ml-2143501614"></a>
### UI_S_STARTBACKGROUNDTRACK

```ml
const UI_S_STARTBACKGROUNDTRACK = 63
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L76)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-s-startlocalsound-const-ui-s-startlocalsound-32-src-mq3-client-ui-syscalls-missionpack-ml-1109873684"></a>
### UI_S_STARTLOCALSOUND

```ml
const UI_S_STARTLOCALSOUND = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L45)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-s-stopbackgroundtrack-const-ui-s-stopbackgroundtrack-62-src-mq3-client-ui-syscalls-missionpack-ml-913642355"></a>
### UI_S_STOPBACKGROUNDTRACK

```ml
const UI_S_STOPBACKGROUNDTRACK = 62
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L75)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-set-cdkey-const-ui-set-cdkey-54-src-mq3-client-ui-syscalls-missionpack-ml-476638118"></a>
### UI_SET_CDKEY

```ml
const UI_SET_CDKEY = 54
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L67)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-set-pbclstatus-const-ui-set-pbclstatus-87-src-mq3-client-ui-syscalls-missionpack-ml-145176644"></a>
### UI_SET_PBCLSTATUS

```ml
const UI_SET_PBCLSTATUS = 87
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L100)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-updatescreen-const-ui-updatescreen-28-src-mq3-client-ui-syscalls-missionpack-ml-523046807"></a>
### UI_UPDATESCREEN

```ml
const UI_UPDATESCREEN = 28
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L41)

<a id="constant-constant-mq3-client-ui-syscalls-missionpack-ui-verify-cdkey-const-ui-verify-cdkey-81-src-mq3-client-ui-syscalls-missionpack-ml-1137759838"></a>
### UI_VERIFY_CDKEY

```ml
const UI_VERIFY_CDKEY = 81
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_syscalls_missionpack.ml#L94)
