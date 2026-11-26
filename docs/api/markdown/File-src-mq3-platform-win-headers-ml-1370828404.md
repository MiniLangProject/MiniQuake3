# `src/mq3/platform/win_headers.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.win_headers`](Package-mq3-platform-win-headers-1909416840.md)

Reachable from entry: **no**

## Declarations

<a id="constant-constant-mq3-platform-win-headers-aps-next-command-value-const-aps-next-command-value-40001-src-mq3-platform-win-headers-ml-810291126"></a>
### _APS_NEXT_COMMAND_VALUE

```ml
const _APS_NEXT_COMMAND_VALUE = 40001
```

Next command identifier reserved by the Windows resource editor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L30)

<a id="constant-constant-mq3-platform-win-headers-aps-next-control-value-const-aps-next-control-value-1005-src-mq3-platform-win-headers-ml-1141572371"></a>
### _APS_NEXT_CONTROL_VALUE

```ml
const _APS_NEXT_CONTROL_VALUE = 1005
```

Next control identifier reserved by the Windows resource editor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L32)

<a id="constant-constant-mq3-platform-win-headers-aps-next-resource-value-const-aps-next-resource-value-132-src-mq3-platform-win-headers-ml-2137418265"></a>
### _APS_NEXT_RESOURCE_VALUE

```ml
const _APS_NEXT_RESOURCE_VALUE = 132
```

Next resource identifier reserved by the Windows resource editor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L28)

<a id="constant-constant-mq3-platform-win-headers-aps-next-symed-value-const-aps-next-symed-value-101-src-mq3-platform-win-headers-ml-850993697"></a>
### _APS_NEXT_SYMED_VALUE

```ml
const _APS_NEXT_SYMED_VALUE = 101
```

Next symbol identifier reserved by the Windows resource editor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L34)

<a id="constant-constant-mq3-platform-win-headers-aps-no-mfc-const-aps-no-mfc-1-src-mq3-platform-win-headers-ml-1348518578"></a>
### _APS_NO_MFC

```ml
const _APS_NO_MFC = 1
```

Resource-editor flag indicating that the resource file does not use MFC.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L26)

<a id="function-function-mq3-platform-win-headers-createglwstate-function-createglwstate-src-mq3-platform-win-headers-ml-925605170"></a>
### createGLWState

```ml
function createGLWState()
```

Constructs `mq3.platform.win_headers.GLWState` with `wndproc` = `void`, `hDC` = `void`, `hGLRC` = `void`, `hinstOpenGL` = `void` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L106)

<a id="function-function-mq3-platform-win-headers-createwinvars-function-createwinvars-src-mq3-platform-win-headers-ml-1261099122"></a>
### createWinVars

```ml
function createWinVars()
```

Constructs `mq3.platform.win_headers.WinVars` with `reflib_library` = `void`, `reflib_active` = `false`, `hWnd` = `void`, `hInstance` = `void` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L110)

<a id="constant-constant-mq3-platform-win-headers-directinput-version-const-directinput-version-768-src-mq3-platform-win-headers-ml-265979630"></a>
### DIRECTINPUT_VERSION

```ml
const DIRECTINPUT_VERSION = 768
```

DirectInput API version used by the native Windows declarations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L9)

<a id="constant-constant-mq3-platform-win-headers-directsound-version-const-directsound-version-768-src-mq3-platform-win-headers-ml-2081827470"></a>
### DIRECTSOUND_VERSION

```ml
const DIRECTSOUND_VERSION = 768
```

DirectSound API version used by the native Windows declarations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L7)

- [mq3.platform.win_headers.GLWState](Type-mq3-platform-win-headers-glwstate-1087366271.md) — struct
<a id="constant-constant-mq3-platform-win-headers-glwstate-x86-size-const-glwstate-x86-size-44-src-mq3-platform-win-headers-ml-535853529"></a>
### GLWSTATE_X86_SIZE

```ml
const GLWSTATE_X86_SIZE = 44
```

Byte size of the legacy 32-bit Windows graphics-window state ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L84)

<a id="function-function-mq3-platform-win-headers-glwstatefieldnames-function-glwstatefieldnames-src-mq3-platform-win-headers-ml-1111318422"></a>
### glwStateFieldNames

```ml
function glwStateFieldNames()
```

Lists the 11 declared names for `mq3.platform.win_headers.glwStateFieldNames`, including `wndproc`, `hDC`, `hGLRC`, `hinstOpenGL`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L91)

<a id="function-function-mq3-platform-win-headers-glwstatex86offsets-function-glwstatex86offsets-src-mq3-platform-win-headers-ml-1137499630"></a>
### glwStateX86Offsets

```ml
function glwStateX86Offsets()
```

Returns `[0,4,8,12,16,20,24,28,32,36,40]` for `mq3.platform.win_headers.glwStateX86Offsets`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L93)

<a id="constant-constant-mq3-platform-win-headers-idb-bitmap1-const-idb-bitmap1-1-src-mq3-platform-win-headers-ml-930198538"></a>
### IDB_BITMAP1

```ml
const IDB_BITMAP1 = 1
```

Windows resource identifier for the first embedded bitmap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L16)

<a id="constant-constant-mq3-platform-win-headers-idb-bitmap2-const-idb-bitmap2-128-src-mq3-platform-win-headers-ml-1429077452"></a>
### IDB_BITMAP2

```ml
const IDB_BITMAP2 = 128
```

Windows resource identifier for the second embedded bitmap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L18)

<a id="constant-constant-mq3-platform-win-headers-idc-cursor1-const-idc-cursor1-129-src-mq3-platform-win-headers-ml-317618031"></a>
### IDC_CURSOR1

```ml
const IDC_CURSOR1 = 129
```

Windows resource identifier for the first embedded cursor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L20)

<a id="constant-constant-mq3-platform-win-headers-idc-cursor2-const-idc-cursor2-130-src-mq3-platform-win-headers-ml-44642149"></a>
### IDC_CURSOR2

```ml
const IDC_CURSOR2 = 130
```

Windows resource identifier for the second embedded cursor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L22)

<a id="constant-constant-mq3-platform-win-headers-idc-cursor3-const-idc-cursor3-131-src-mq3-platform-win-headers-ml-1544205030"></a>
### IDC_CURSOR3

```ml
const IDC_CURSOR3 = 131
```

Windows resource identifier for the third embedded cursor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L24)

<a id="constant-constant-mq3-platform-win-headers-idi-icon1-const-idi-icon1-1-src-mq3-platform-win-headers-ml-1554977634"></a>
### IDI_ICON1

```ml
const IDI_ICON1 = 1
```

Windows resource identifier for the application icon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L14)

<a id="constant-constant-mq3-platform-win-headers-ids-string1-const-ids-string1-1-src-mq3-platform-win-headers-ml-1193491490"></a>
### IDS_STRING1

```ml
const IDS_STRING1 = 1
```

Windows resource identifier for the primary string-table entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L12)

<a id="constant-constant-mq3-platform-win-headers-osversioninfoa-x86-size-const-osversioninfoa-x86-size-148-src-mq3-platform-win-headers-ml-443688174"></a>
### OSVERSIONINFOA_X86_SIZE

```ml
const OSVERSIONINFOA_X86_SIZE = 148
```

Byte size of the 32-bit ANSI Windows version-information structure.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L88)

<a id="function-function-mq3-platform-win-headers-resourcemacronames-function-resourcemacronames-src-mq3-platform-win-headers-ml-1302118746"></a>
### resourceMacroNames

```ml
function resourceMacroNames()
```

Lists the 12 declared names for `mq3.platform.win_headers.resourceMacroNames`, including `IDS_STRING1`, `IDI_ICON1`, `IDB_BITMAP1`, `IDB_BITMAP2`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L101)

<a id="function-function-mq3-platform-win-headers-versionmacronames-function-versionmacronames-src-mq3-platform-win-headers-ml-115312094"></a>
### versionMacroNames

```ml
function versionMacroNames()
```

Lists the 2 declared names for `mq3.platform.win_headers.versionMacroNames`, including `DIRECTSOUND_VERSION`, `DIRECTINPUT_VERSION`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L103)

<a id="function-function-mq3-platform-win-headers-winlocalfunctionnames-function-winlocalfunctionnames-src-mq3-platform-win-headers-ml-1310857256"></a>
### winLocalFunctionNames

```ml
function winLocalFunctionNames()
```

Lists the 17 declared names for `mq3.platform.win_headers.winLocalFunctionNames`, including `IN_MouseEvent`, `Sys_QueEvent`, `Sys_CreateConsole`, `Sys_DestroyConsole`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L99)

- [mq3.platform.win_headers.WinVars](Type-mq3-platform-win-headers-winvars-1793140258.md) — struct
<a id="constant-constant-mq3-platform-win-headers-winvars-x86-size-const-winvars-x86-size-176-src-mq3-platform-win-headers-ml-1513613179"></a>
### WINVARS_X86_SIZE

```ml
const WINVARS_X86_SIZE = 176
```

Byte size of the legacy 32-bit Windows application-state ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L86)

<a id="function-function-mq3-platform-win-headers-winvarsfieldnames-function-winvarsfieldnames-src-mq3-platform-win-headers-ml-206500222"></a>
### winVarsFieldNames

```ml
function winVarsFieldNames()
```

Lists the 8 declared names for `mq3.platform.win_headers.winVarsFieldNames`, including `reflib_library`, `reflib_active`, `hWnd`, `hInstance`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L95)

<a id="function-function-mq3-platform-win-headers-winvarsx86offsets-function-winvarsx86offsets-src-mq3-platform-win-headers-ml-717476406"></a>
### winVarsX86Offsets

```ml
function winVarsX86Offsets()
```

Returns `[0,4,8,12,16,20,24,172]` for `mq3.platform.win_headers.winVarsX86Offsets`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L97)
