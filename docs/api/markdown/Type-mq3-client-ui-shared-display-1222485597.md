# `mq3.client.ui_shared.Display`

[Home](README.md) · [Source file](File-src-mq3-client-ui-shared-ml-1094733975.md)

<a id="struct-struct-mq3-client-ui-shared-display-struct-display-src-mq3-client-ui-shared-ml-2130804433"></a>
## Display

```ml
struct Display
```

Stores UI shared display record, including `menus`, `focus`, `capture`, `cursorx`, `cursory`, `scaleX` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L400)

## Members

<a id="field-field-mq3-client-ui-shared-display-actions-actions-src-mq3-client-ui-shared-ml-1667038105"></a>
### actions

```ml
actions
```

Host requests queued while evaluating menu scripts, registering resources, and issuing widget draw requests, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L425)

<a id="field-field-mq3-client-ui-shared-display-assets-assets-src-mq3-client-ui-shared-ml-1004087155"></a>
### assets

```ml
assets
```

Registered shader, font, sound, and other display resources shared by scripted Missionpack widgets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L432)

<a id="field-field-mq3-client-ui-shared-display-bias-bias-src-mq3-client-ui-shared-ml-256062687"></a>
### bias

```ml
bias
```

Horizontal adjustment used when centering the virtual UI on a wider display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L416)

<a id="field-field-mq3-client-ui-shared-display-bindings-bindings-src-mq3-client-ui-shared-ml-909265301"></a>
### bindings

```ml
bindings
```

Key-to-command associations available to the UI controls editor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L429)

<a id="field-field-mq3-client-ui-shared-display-capture-capture-src-mq3-client-ui-shared-ml-1573910381"></a>
### capture

```ml
capture
```

Item currently capturing pointer motion or a drag operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L406)

<a id="field-field-mq3-client-ui-shared-display-cursorx-cursorx-src-mq3-client-ui-shared-ml-908500877"></a>
### cursorx

```ml
cursorx
```

Horizontal position of the UI pointer in the menu coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L408)

<a id="field-field-mq3-client-ui-shared-display-cursory-cursory-src-mq3-client-ui-shared-ml-2080696897"></a>
### cursory

```ml
cursory
```

Vertical position of the UI pointer in the menu coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L410)

<a id="field-field-mq3-client-ui-shared-display-cvars-cvars-src-mq3-client-ui-shared-ml-1962354433"></a>
### cvars

```ml
cvars
```

Configuration-variable values exposed to the native UI implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L427)

<a id="field-field-mq3-client-ui-shared-display-focus-focus-src-mq3-client-ui-shared-ml-901142877"></a>
### focus

```ml
focus
```

Menu or item currently owning keyboard focus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L404)

<a id="field-field-mq3-client-ui-shared-display-frametime-frametime-src-mq3-client-ui-shared-ml-1384869717"></a>
### frameTime

```ml
frameTime
```

Elapsed UI frame-time slot retained alongside the absolute realtime clock.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L420)

<a id="field-field-mq3-client-ui-shared-display-keybindpending-keybindpending-src-mq3-client-ui-shared-ml-1688025363"></a>
### keyBindPending

```ml
keyBindPending
```

True while the UI is waiting for a key to assign to a binding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L422)

<a id="field-field-mq3-client-ui-shared-display-memory-memory-src-mq3-client-ui-shared-ml-1158257159"></a>
### memory

```ml
memory
```

Bounded storage used for menu strings and parsed UI allocations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L434)

<a id="field-field-mq3-client-ui-shared-display-menus-menus-src-mq3-client-ui-shared-ml-876347813"></a>
### menus

```ml
menus
```

Parsed menus available for activation and display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L402)

<a id="field-field-mq3-client-ui-shared-display-realtime-realtime-src-mq3-client-ui-shared-ml-960297635"></a>
### realtime

```ml
realtime
```

UI display clock in milliseconds used to advance window fades, orbiting, and transitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L418)

<a id="field-field-mq3-client-ui-shared-display-retailactive-retailactive-src-mq3-client-ui-shared-ml-873990983"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the scripted Missionpack menu runtime, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L437)

<a id="field-field-mq3-client-ui-shared-display-scalex-scalex-src-mq3-client-ui-shared-ml-1601580553"></a>
### scaleX

```ml
scaleX
```

Horizontal scale used to transform virtual UI coordinates to the actual display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L412)

<a id="field-field-mq3-client-ui-shared-display-scaley-scaley-src-mq3-client-ui-shared-ml-173226207"></a>
### scaleY

```ml
scaleY
```

Vertical scale used to transform virtual UI coordinates to the actual display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_shared.ml#L414)
