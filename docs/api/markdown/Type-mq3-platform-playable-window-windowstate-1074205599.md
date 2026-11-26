# `mq3.platform.playable_window.WindowState`

[Home](README.md) · [Source file](File-src-mq3-platform-playable-window-ml-933960264.md)

<a id="struct-struct-mq3-platform-playable-window-windowstate-struct-windowstate-src-mq3-platform-playable-window-ml-1078862343"></a>
## WindowState

```ml
struct WindowState
```

Data record for `mq3.platform.playable_window.WindowState`; groups `active`, `minimized`, `x`, `y`, `fullscreen`, `altTabDisabled`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L633)

## Members

<a id="field-field-mq3-platform-playable-window-windowstate-active-active-src-mq3-platform-playable-window-ml-913618268"></a>
### active

```ml
active
```

Whether this object is currently active and accepts processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L635)

<a id="field-field-mq3-platform-playable-window-windowstate-alttabdisabled-alttabdisabled-src-mq3-platform-playable-window-ml-285699856"></a>
### altTabDisabled

```ml
altTabDisabled
```

Whether task switching is disabled while the window is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L645)

<a id="field-field-mq3-platform-playable-window-windowstate-fullscreen-fullscreen-src-mq3-platform-playable-window-ml-1243651198"></a>
### fullscreen

```ml
fullscreen
```

Whether the selected video mode occupies the full display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L643)

<a id="field-field-mq3-platform-playable-window-windowstate-minimized-minimized-src-mq3-platform-playable-window-ml-1753975224"></a>
### minimized

```ml
minimized
```

Whether the application window is minimized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L637)

<a id="field-field-mq3-platform-playable-window-windowstate-soundactivationserial-soundactivationserial-src-mq3-platform-playable-window-ml-1647963780"></a>
### soundActivationSerial

```ml
soundActivationSerial
```

Generation incremented whenever window activation changes sound playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L647)

<a id="field-field-mq3-platform-playable-window-windowstate-x-x-src-mq3-platform-playable-window-ml-999579200"></a>
### x

```ml
x
```

Horizontal position of the native window, in desktop coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L639)

<a id="field-field-mq3-platform-playable-window-windowstate-y-y-src-mq3-platform-playable-window-ml-854276340"></a>
### y

```ml
y
```

Vertical position of the native window, in desktop coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_window.ml#L641)
