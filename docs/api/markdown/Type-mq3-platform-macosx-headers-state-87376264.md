# `mq3.platform.macosx_headers.State`

[Home](README.md) · [Source file](File-src-mq3-platform-macosx-headers-ml-2137775307.md)

<a id="struct-struct-mq3-platform-macosx-headers-state-struct-state-src-mq3-platform-macosx-headers-ml-1141387219"></a>
## State

```ml
struct State
```

Data record for `mq3.platform.macosx_headers.State`; groups `mouseInitialized`, `mouseDelta`, `notifications`, `bannerVisible`, `terminateRequested`, `quakeFrames`, and 21 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L68)

## Members

<a id="field-field-mq3-platform-macosx-headers-state-bannervisible-bannervisible-src-mq3-platform-macosx-headers-ml-112320230"></a>
### bannerVisible

```ml
bannerVisible
```

Whether the platform startup banner is visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L76)

<a id="field-field-mq3-platform-macosx-headers-state-cglcontext-cglcontext-src-mq3-platform-macosx-headers-ml-1716111020"></a>
### cglContext

```ml
cglContext
```

Native macOS OpenGL context handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L106)

<a id="field-field-mq3-platform-macosx-headers-state-clipboard-clipboard-src-mq3-platform-macosx-headers-ml-780269626"></a>
### clipboard

```ml
clipboard
```

Text currently available through the platform clipboard adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L82)

<a id="field-field-mq3-platform-macosx-headers-state-context-context-src-mq3-platform-macosx-headers-ml-734941106"></a>
### context

```ml
context
```

Native NSOpenGL context retained alongside its CGL context handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L104)

<a id="field-field-mq3-platform-macosx-headers-state-contextcurrent-contextcurrent-src-mq3-platform-macosx-headers-ml-699744626"></a>
### contextCurrent

```ml
contextCurrent
```

Whether the graphics context is current on the calling thread.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L108)

<a id="field-field-mq3-platform-macosx-headers-state-display-display-src-mq3-platform-macosx-headers-ml-1371825474"></a>
### display

```ml
display
```

Display identifier used for video and gamma operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L98)

<a id="field-field-mq3-platform-macosx-headers-state-displaymodes-displaymodes-src-mq3-platform-macosx-headers-ml-634294634"></a>
### displayModes

```ml
displayModes
```

Display modes enumerated from the native video subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L84)

<a id="field-field-mq3-platform-macosx-headers-state-events-events-src-mq3-platform-macosx-headers-ml-1763429220"></a>
### events

```ml
events
```

Pending input or system events awaiting delivery.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L102)

<a id="field-field-mq3-platform-macosx-headers-state-fadeddisplays-fadeddisplays-src-mq3-platform-macosx-headers-ml-1982388362"></a>
### fadedDisplays

```ml
fadedDisplays
```

Displays currently affected by a fade transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L88)

<a id="field-field-mq3-platform-macosx-headers-state-fadefraction-fadefraction-src-mq3-platform-macosx-headers-ml-959534902"></a>
### fadeFraction

```ml
fadeFraction
```

Interpolation fraction of the current display fade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L92)

<a id="field-field-mq3-platform-macosx-headers-state-gammatables-gammatables-src-mq3-platform-macosx-headers-ml-549744734"></a>
### gammaTables

```ml
gammaTables
```

Saved or current gamma ramps indexed by display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L90)

<a id="field-field-mq3-platform-macosx-headers-state-hidden-hidden-src-mq3-platform-macosx-headers-ml-423302546"></a>
### hidden

```ml
hidden
```

Whether the native window or application is hidden.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L100)

<a id="field-field-mq3-platform-macosx-headers-state-inputinitialized-inputinitialized-src-mq3-platform-macosx-headers-ml-593930218"></a>
### inputInitialized

```ml
inputInitialized
```

Whether native input processing has initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L94)

<a id="field-field-mq3-platform-macosx-headers-state-mousedelta-mousedelta-src-mq3-platform-macosx-headers-ml-1961823964"></a>
### mouseDelta

```ml
mouseDelta
```

Accumulated relative mouse movement waiting for the next frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L72)

<a id="field-field-mq3-platform-macosx-headers-state-mouseinitialized-mouseinitialized-src-mq3-platform-macosx-headers-ml-973018016"></a>
### mouseInitialized

```ml
mouseInitialized
```

Whether the native mouse subsystem has initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L70)

<a id="field-field-mq3-platform-macosx-headers-state-mouserect-mouserect-src-mq3-platform-macosx-headers-ml-904076770"></a>
### mouseRect

```ml
mouseRect
```

Rectangle to which native mouse movement is constrained.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L96)

<a id="field-field-mq3-platform-macosx-headers-state-notifications-notifications-src-mq3-platform-macosx-headers-ml-426389942"></a>
### notifications

```ml
notifications
```

Native input or display notifications registered by the platform layer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L74)

<a id="field-field-mq3-platform-macosx-headers-state-pausecount-pausecount-src-mq3-platform-macosx-headers-ml-309320700"></a>
### pauseCount

```ml
pauseCount
```

Number of nested platform pause requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L110)

<a id="field-field-mq3-platform-macosx-headers-state-qglbeginstarted-qglbeginstarted-src-mq3-platform-macosx-headers-ml-1824415466"></a>
### qglBeginStarted

```ml
qglBeginStarted
```

Whether an immediate-mode graphics primitive is open.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L116)

<a id="field-field-mq3-platform-macosx-headers-state-qglcalls-qglcalls-src-mq3-platform-macosx-headers-ml-975301244"></a>
### qglCalls

```ml
qglCalls
```

Graphics calls recorded by the platform OpenGL adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L112)

<a id="field-field-mq3-platform-macosx-headers-state-qglerrors-qglerrors-src-mq3-platform-macosx-headers-ml-1248892082"></a>
### qglErrors

```ml
qglErrors
```

Errors recorded while dispatching graphics calls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L114)

<a id="field-field-mq3-platform-macosx-headers-state-quakeframes-quakeframes-src-mq3-platform-macosx-headers-ml-935999934"></a>
### quakeFrames

```ml
quakeFrames
```

Number of engine frame callbacks processed by the platform layer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L80)

<a id="field-field-mq3-platform-macosx-headers-state-stretchedmodes-stretchedmodes-src-mq3-platform-macosx-headers-ml-1662081490"></a>
### stretchedModes

```ml
stretchedModes
```

Display modes configured to stretch the rendering surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L86)

<a id="field-field-mq3-platform-macosx-headers-state-terminaterequested-terminaterequested-src-mq3-platform-macosx-headers-ml-593543532"></a>
### terminateRequested

```ml
terminateRequested
```

Whether the native application requested termination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L78)

<a id="field-field-mq3-platform-macosx-headers-state-timers-timers-src-mq3-platform-macosx-headers-ml-330210978"></a>
### timers

```ml
timers
```

Named timing measurements collected by the platform adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L118)

<a id="field-field-mq3-platform-macosx-headers-state-timerstack-timerstack-src-mq3-platform-macosx-headers-ml-710695948"></a>
### timerStack

```ml
timerStack
```

Stack of currently active timing scopes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L120)

<a id="field-field-mq3-platform-macosx-headers-state-timerstamps-timerstamps-src-mq3-platform-macosx-headers-ml-496133050"></a>
### timerStamps

```ml
timerStamps
```

Clock samples associated with the timing measurements.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L122)
