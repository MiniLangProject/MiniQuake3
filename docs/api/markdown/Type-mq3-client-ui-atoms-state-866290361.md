# `mq3.client.ui_atoms.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-atoms-ml-614034284.md)

<a id="struct-struct-mq3-client-ui-atoms-state-struct-state-src-mq3-client-ui-atoms-ml-1114918445"></a>
## State

```ml
struct State
```

Stores UI atoms state, including `scale`, `bias`, `vidWidth`, `vidHeight`, `realtime`, `frametime` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L83)

## Members

<a id="field-field-mq3-client-ui-atoms-state-actions-actions-src-mq3-client-ui-atoms-ml-607547906"></a>
### actions

```ml
actions
```

Host requests queued while drawing base-game UI primitives and changing the active menu stack, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L118)

<a id="field-field-mq3-client-ui-atoms-state-activemenu-activemenu-src-mq3-client-ui-atoms-ml-47959908"></a>
### activeMenu

```ml
activeMenu
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `UI_PushMenu` and `UI_PopMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L110)

<a id="field-field-mq3-client-ui-atoms-state-args-args-src-mq3-client-ui-atoms-ml-1030064768"></a>
### args

```ml
args
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_Argv` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L121)

<a id="field-field-mq3-client-ui-atoms-state-bias-bias-src-mq3-client-ui-atoms-ml-1496397460"></a>
### bias

```ml
bias
```

Horizontal adjustment used when centering the virtual UI on a wider display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L88)

<a id="field-field-mq3-client-ui-atoms-state-cachenames-cachenames-src-mq3-client-ui-atoms-ml-1173878890"></a>
### cacheNames

```ml
cacheNames
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_Cache_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L129)

<a id="field-field-mq3-client-ui-atoms-state-cursorshader-cursorshader-src-mq3-client-ui-atoms-ml-485214640"></a>
### cursorShader

```ml
cursorShader
```

Shader resource selected for cursor rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L137)

<a id="field-field-mq3-client-ui-atoms-state-cursorx-cursorx-src-mq3-client-ui-atoms-ml-1106870806"></a>
### cursorx

```ml
cursorx
```

Horizontal position of the UI pointer in the menu coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L100)

<a id="field-field-mq3-client-ui-atoms-state-cursory-cursory-src-mq3-client-ui-atoms-ml-837543882"></a>
### cursory

```ml
cursory
```

Vertical position of the UI pointer in the menu coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L102)

<a id="field-field-mq3-client-ui-atoms-state-cvars-cvars-src-mq3-client-ui-atoms-ml-72274570"></a>
### cvars

```ml
cvars
```

Configuration-variable values exposed to the native UI implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L123)

<a id="field-field-mq3-client-ui-atoms-state-entersound-entersound-src-mq3-client-ui-atoms-ml-1566873816"></a>
### enterSound

```ml
enterSound
```

Sound resource selected for the enter event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L115)

<a id="field-field-mq3-client-ui-atoms-state-firstdraw-firstdraw-src-mq3-client-ui-atoms-ml-259957450"></a>
### firstdraw

```ml
firstdraw
```

When constructing this record, `create` supplies `false` for this member. Used by `UI_PushMenu` and `UI_PopMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L113)

<a id="field-field-mq3-client-ui-atoms-state-frametime-frametime-src-mq3-client-ui-atoms-ml-707587582"></a>
### frametime

```ml
frametime
```

Elapsed client time in milliseconds since the preceding frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L98)

<a id="field-field-mq3-client-ui-atoms-state-keycatcher-keycatcher-src-mq3-client-ui-atoms-ml-1607131992"></a>
### keyCatcher

```ml
keyCatcher
```

Input-capture bitmask selecting which client subsystem currently receives key events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L104)

<a id="field-field-mq3-client-ui-atoms-state-mainstate-mainstate-src-mq3-client-ui-atoms-ml-1055323606"></a>
### mainState

```ml
mainState
```

When constructing this record, `create` supplies `uiMain.create(retailActive)` for this member. Used by `emit` and `UI_Init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L126)

<a id="field-field-mq3-client-ui-atoms-state-menubacknologoshader-menubacknologoshader-src-mq3-client-ui-atoms-ml-1036569476"></a>
### menuBackNoLogoShader

```ml
menuBackNoLogoShader
```

Shader resource selected for menu back no logo rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L135)

<a id="field-field-mq3-client-ui-atoms-state-menubackshader-menubackshader-src-mq3-client-ui-atoms-ml-1274515672"></a>
### menuBackShader

```ml
menuBackShader
```

Shader resource selected for menu back rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L133)

<a id="field-field-mq3-client-ui-atoms-state-realtime-realtime-src-mq3-client-ui-atoms-ml-213006856"></a>
### realtime

```ml
realtime
```

Current base-game UI clock in milliseconds used by menu animation and feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L96)

<a id="field-field-mq3-client-ui-atoms-state-scale-scale-src-mq3-client-ui-atoms-ml-1275258454"></a>
### scale

```ml
scale
```

When constructing this record, `create` supplies `1.0` for this member. Used by `UI_DrawBannerString2` and `UI_DrawProportionalString2` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L86)

<a id="field-field-mq3-client-ui-atoms-state-stack-stack-src-mq3-client-ui-atoms-ml-1016765562"></a>
### stack

```ml
stack
```

When constructing this record, `create` supplies an empty list for this member. Used by `UI_PushMenu` and `UI_PopMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L107)

<a id="field-field-mq3-client-ui-atoms-state-vidheight-vidheight-src-mq3-client-ui-atoms-ml-34578662"></a>
### vidHeight

```ml
vidHeight
```

When constructing this record, `create` supplies `480` for this member. Used by `UI_Init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L94)

<a id="field-field-mq3-client-ui-atoms-state-vidwidth-vidwidth-src-mq3-client-ui-atoms-ml-1543336708"></a>
### vidWidth

```ml
vidWidth
```

When constructing this record, `create` supplies `640` for this member. Used by `UI_Init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L91)

<a id="field-field-mq3-client-ui-atoms-state-whiteshader-whiteshader-src-mq3-client-ui-atoms-ml-1630866178"></a>
### whiteShader

```ml
whiteShader
```

Shader resource selected for white rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L131)
