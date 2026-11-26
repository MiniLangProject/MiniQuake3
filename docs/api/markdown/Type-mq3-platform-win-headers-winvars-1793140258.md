# `mq3.platform.win_headers.WinVars`

[Home](README.md) · [Source file](File-src-mq3-platform-win-headers-ml-1370828404.md)

<a id="struct-struct-mq3-platform-win-headers-winvars-struct-winvars-src-mq3-platform-win-headers-ml-351262253"></a>
## WinVars

```ml
struct WinVars
```

Data record for `mq3.platform.win_headers.WinVars`; groups `reflib_library`, `reflib_active`, `hWnd`, `hInstance`, `activeApp`, `isMinimized`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L64)

## Members

<a id="field-field-mq3-platform-win-headers-winvars-activeapp-activeapp-src-mq3-platform-win-headers-ml-1116040081"></a>
### activeApp

```ml
activeApp
```

Whether the application currently owns foreground input focus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L74)

<a id="field-field-mq3-platform-win-headers-winvars-hinstance-hinstance-src-mq3-platform-win-headers-ml-594024185"></a>
### hInstance

```ml
hInstance
```

Windows instance handle of the running application.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L72)

<a id="field-field-mq3-platform-win-headers-winvars-hwnd-hwnd-src-mq3-platform-win-headers-ml-918718955"></a>
### hWnd

```ml
hWnd
```

Native Windows handle of the application window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L70)

<a id="field-field-mq3-platform-win-headers-winvars-isminimized-isminimized-src-mq3-platform-win-headers-ml-706846161"></a>
### isMinimized

```ml
isMinimized
```

Whether the native application window is minimized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L76)

<a id="field-field-mq3-platform-win-headers-winvars-osversion-osversion-src-mq3-platform-win-headers-ml-1897735125"></a>
### osversion

```ml
osversion
```

Operating-system version data used by Windows compatibility checks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L78)

<a id="field-field-mq3-platform-win-headers-winvars-reflib-active-reflib-active-src-mq3-platform-win-headers-ml-438369689"></a>
### reflib_active

```ml
reflib_active
```

Whether the loaded renderer library is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L68)

<a id="field-field-mq3-platform-win-headers-winvars-reflib-library-reflib-library-src-mq3-platform-win-headers-ml-1195199941"></a>
### reflib_library

```ml
reflib_library
```

Handle of the loaded renderer library.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L66)

<a id="field-field-mq3-platform-win-headers-winvars-sysmsgtime-sysmsgtime-src-mq3-platform-win-headers-ml-450907347"></a>
### sysMsgTime

```ml
sysMsgTime
```

Timestamp of the current Windows message, retained for input event timing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L80)
