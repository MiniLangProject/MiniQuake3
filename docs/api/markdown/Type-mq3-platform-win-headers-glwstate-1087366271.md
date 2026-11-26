# `mq3.platform.win_headers.GLWState`

[Home](README.md) · [Source file](File-src-mq3-platform-win-headers-ml-1370828404.md)

<a id="struct-struct-mq3-platform-win-headers-glwstate-struct-glwstate-src-mq3-platform-win-headers-ml-1135750255"></a>
## GLWState

```ml
struct GLWState
```

Native handles and callbacks are represented by managed host handles.  The field order mirrors the original records; the constants below retain the original 32-bit ABI used by the released Windows executable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L39)

## Members

<a id="field-field-mq3-platform-win-headers-glwstate-allowdisplaydepthchange-allowdisplaydepthchange-src-mq3-platform-win-headers-ml-1168171708"></a>
### allowdisplaydepthchange

```ml
allowdisplaydepthchange
```

Whether fullscreen mode changes may alter desktop color depth.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L49)

<a id="field-field-mq3-platform-win-headers-glwstate-cdsfullscreen-cdsfullscreen-src-mq3-platform-win-headers-ml-1875908012"></a>
### cdsFullscreen

```ml
cdsFullscreen
```

Whether fullscreen rendering used a display-settings mode change.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L59)

<a id="field-field-mq3-platform-win-headers-glwstate-desktopbitspixel-desktopbitspixel-src-mq3-platform-win-headers-ml-2146742668"></a>
### desktopBitsPixel

```ml
desktopBitsPixel
```

Color depth of the desktop before a fullscreen mode change.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L53)

<a id="field-field-mq3-platform-win-headers-glwstate-desktopheight-desktopheight-src-mq3-platform-win-headers-ml-1317176816"></a>
### desktopHeight

```ml
desktopHeight
```

Height of the original desktop display mode, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L57)

<a id="field-field-mq3-platform-win-headers-glwstate-desktopwidth-desktopwidth-src-mq3-platform-win-headers-ml-902191932"></a>
### desktopWidth

```ml
desktopWidth
```

Width of the original desktop display mode, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L55)

<a id="field-field-mq3-platform-win-headers-glwstate-hdc-hdc-src-mq3-platform-win-headers-ml-1210007488"></a>
### hDC

```ml
hDC
```

Windows device-context handle for the rendering window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L43)

<a id="field-field-mq3-platform-win-headers-glwstate-hglrc-hglrc-src-mq3-platform-win-headers-ml-1744354312"></a>
### hGLRC

```ml
hGLRC
```

Windows OpenGL rendering-context handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L45)

<a id="field-field-mq3-platform-win-headers-glwstate-hinstopengl-hinstopengl-src-mq3-platform-win-headers-ml-1684046724"></a>
### hinstOpenGL

```ml
hinstOpenGL
```

Handle of the loaded OpenGL driver library.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L47)

<a id="field-field-mq3-platform-win-headers-glwstate-log-fp-log-fp-src-mq3-platform-win-headers-ml-1532238854"></a>
### log_fp

```ml
log_fp
```

Log file associated with graphics-call tracing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L61)

<a id="field-field-mq3-platform-win-headers-glwstate-pixelformatset-pixelformatset-src-mq3-platform-win-headers-ml-1432805466"></a>
### pixelFormatSet

```ml
pixelFormatSet
```

Whether the rendering window's pixel format has been selected.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L51)

<a id="field-field-mq3-platform-win-headers-glwstate-wndproc-wndproc-src-mq3-platform-win-headers-ml-1735572600"></a>
### wndproc

```ml
wndproc
```

Native window procedure used to handle operating-system messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_headers.ml#L41)
