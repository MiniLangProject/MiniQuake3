# `mq3.platform.win_wndproc_runtime.Runtime`

[Home](README.md) · [Source file](File-src-mq3-platform-win-wndproc-runtime-ml-1500188850.md)

<a id="struct-struct-mq3-platform-win-wndproc-runtime-runtime-struct-runtime-src-mq3-platform-win-wndproc-runtime-ml-669934865"></a>
## Runtime

```ml
struct Runtime
```

Data record for `mq3.platform.win_wndproc_runtime.Runtime`; groups `activeApp`, `isMinimized`, `fullscreen`, `altTabDisabled`, `windowCreated`, `inputActive`, and 9 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L164)

## Members

<a id="field-field-mq3-platform-win-wndproc-runtime-runtime-activeapp-activeapp-src-mq3-platform-win-wndproc-runtime-ml-723856345"></a>
### activeApp

```ml
activeApp
```

Whether the application currently owns foreground input focus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L166)

<a id="field-field-mq3-platform-win-wndproc-runtime-runtime-alttabdisabled-alttabdisabled-src-mq3-platform-win-wndproc-runtime-ml-783347517"></a>
### altTabDisabled

```ml
altTabDisabled
```

Whether task switching is disabled while the window is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L172)

<a id="field-field-mq3-platform-win-wndproc-runtime-runtime-clearstatecount-clearstatecount-src-mq3-platform-win-wndproc-runtime-ml-1633922521"></a>
### clearStateCount

```ml
clearStateCount
```

Number of times held input state was cleared after focus changes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L192)

<a id="field-field-mq3-platform-win-wndproc-runtime-runtime-events-events-src-mq3-platform-win-wndproc-runtime-ml-2123097183"></a>
### events

```ml
events
```

Pending input or system events awaiting delivery.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L194)

<a id="field-field-mq3-platform-win-wndproc-runtime-runtime-fullscreen-fullscreen-src-mq3-platform-win-wndproc-runtime-ml-400117627"></a>
### fullscreen

```ml
fullscreen
```

Whether the selected video mode occupies the full display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L170)

<a id="field-field-mq3-platform-win-wndproc-runtime-runtime-inputactive-inputactive-src-mq3-platform-win-wndproc-runtime-ml-882707317"></a>
### inputActive

```ml
inputActive
```

Whether keyboard and mouse events are currently routed into the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L176)

<a id="field-field-mq3-platform-win-wndproc-runtime-runtime-isminimized-isminimized-src-mq3-platform-win-wndproc-runtime-ml-1875028377"></a>
### isMinimized

```ml
isMinimized
```

Whether the native application window is minimized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L168)

<a id="field-field-mq3-platform-win-wndproc-runtime-runtime-logitechflip-logitechflip-src-mq3-platform-win-wndproc-runtime-ml-1741781829"></a>
### logitechFlip

```ml
logitechFlip
```

Whether the legacy Logitech wheel-direction workaround is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L184)

<a id="field-field-mq3-platform-win-wndproc-runtime-runtime-mousebuttons-mousebuttons-src-mq3-platform-win-wndproc-runtime-ml-788960417"></a>
### mouseButtons

```ml
mouseButtons
```

Mouse-button mask translated from the current window message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L182)

<a id="field-field-mq3-platform-win-wndproc-runtime-runtime-quitrequested-quitrequested-src-mq3-platform-win-wndproc-runtime-ml-217879321"></a>
### quitRequested

```ml
quitRequested
```

Whether application shutdown has been requested.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L186)

<a id="field-field-mq3-platform-win-wndproc-runtime-runtime-soundactivations-soundactivations-src-mq3-platform-win-wndproc-runtime-ml-1621946689"></a>
### soundActivations

```ml
soundActivations
```

Number of sound activation changes caused by window focus updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L190)

<a id="field-field-mq3-platform-win-wndproc-runtime-runtime-videorestart-videorestart-src-mq3-platform-win-wndproc-runtime-ml-107075581"></a>
### videoRestart

```ml
videoRestart
```

Whether a native window event requested video subsystem restart.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L188)

<a id="field-field-mq3-platform-win-wndproc-runtime-runtime-vidx-vidx-src-mq3-platform-win-wndproc-runtime-ml-327946195"></a>
### vidX

```ml
vidX
```

Horizontal desktop position of the game window, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L178)

<a id="field-field-mq3-platform-win-wndproc-runtime-runtime-vidy-vidy-src-mq3-platform-win-wndproc-runtime-ml-2021775229"></a>
### vidY

```ml
vidY
```

Vertical desktop position of the game window, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L180)

<a id="field-field-mq3-platform-win-wndproc-runtime-runtime-windowcreated-windowcreated-src-mq3-platform-win-wndproc-runtime-ml-717787125"></a>
### windowCreated

```ml
windowCreated
```

Whether the application window has been created.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_wndproc_runtime.ml#L174)
