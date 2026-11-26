# `mq3.client.ui_atoms_missionpack.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-atoms-missionpack-ml-2145955256.md)

<a id="struct-struct-mq3-client-ui-atoms-missionpack-state-struct-state-src-mq3-client-ui-atoms-missionpack-ml-1853499109"></a>
## State

```ml
struct State
```

Stores UI atoms missionpack state, including `syscalls`, `xscale`, `yscale`, `realtime`, `frametime`, `cursorx` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L79)

## Members

<a id="field-field-mq3-client-ui-atoms-missionpack-state-actions-actions-src-mq3-client-ui-atoms-missionpack-ml-1142467718"></a>
### actions

```ml
actions
```

Host requests queued while updating postgame cvars, cached score files, and Missionpack UI state, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L113)

<a id="field-field-mq3-client-ui-atoms-missionpack-state-cursorx-cursorx-src-mq3-client-ui-atoms-missionpack-ml-1897161018"></a>
### cursorx

```ml
cursorx
```

Horizontal position of the UI pointer in the menu coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L94)

<a id="field-field-mq3-client-ui-atoms-missionpack-state-cursory-cursory-src-mq3-client-ui-atoms-missionpack-ml-113642238"></a>
### cursory

```ml
cursory
```

Vertical position of the UI pointer in the menu coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L96)

<a id="field-field-mq3-client-ui-atoms-missionpack-state-demoavailable-demoavailable-src-mq3-client-ui-atoms-missionpack-ml-1527984234"></a>
### demoAvailable

```ml
demoAvailable
```

When constructing this record, `create` supplies `false` for this member. Used by `UI_LoadBestScores` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L101)

<a id="field-field-mq3-client-ui-atoms-missionpack-state-frametime-frametime-src-mq3-client-ui-atoms-missionpack-ml-1014198258"></a>
### frametime

```ml
frametime
```

Elapsed client time in milliseconds since the preceding frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L92)

<a id="field-field-mq3-client-ui-atoms-missionpack-state-internalcontext-internalcontext-src-mq3-client-ui-atoms-missionpack-ml-453962546"></a>
### internalContext

```ml
internalContext
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `setInternalHandler` and `internal` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L119)

<a id="field-field-mq3-client-ui-atoms-missionpack-state-internalfn-internalfn-src-mq3-client-ui-atoms-missionpack-ml-224962868"></a>
### internalFn

```ml
internalFn
```

Host callback for the internal operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L116)

<a id="field-field-mq3-client-ui-atoms-missionpack-state-newbesttime-newbesttime-src-mq3-client-ui-atoms-missionpack-ml-1872352498"></a>
### newBestTime

```ml
newBestTime
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_CalcPostGameStats` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L107)

<a id="field-field-mq3-client-ui-atoms-missionpack-state-newhighscoretime-newhighscoretime-src-mq3-client-ui-atoms-missionpack-ml-757555348"></a>
### newHighScoreTime

```ml
newHighScoreTime
```

When constructing this record, `create` supplies `0` for this member. Used by `UI_CalcPostGameStats` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L104)

<a id="field-field-mq3-client-ui-atoms-missionpack-state-newui-newui-src-mq3-client-ui-atoms-missionpack-ml-823576018"></a>
### newUI

```ml
newUI
```

Compatibility UI-mode flag initialized to false; the present helper paths do not branch on this field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L122)

<a id="field-field-mq3-client-ui-atoms-missionpack-state-realtime-realtime-src-mq3-client-ui-atoms-missionpack-ml-1773549408"></a>
### realtime

```ml
realtime
```

Current mission-pack UI clock in milliseconds used for postgame feedback and display deadlines.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L90)

<a id="field-field-mq3-client-ui-atoms-missionpack-state-syscalls-syscalls-src-mq3-client-ui-atoms-missionpack-ml-544437102"></a>
### syscalls

```ml
syscalls
```

When constructing this record, `create` supplies `syscalls` for this member. Used by `cvarSet` and `Com_Error` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L82)

<a id="field-field-mq3-client-ui-atoms-missionpack-state-timetobeat-timetobeat-src-mq3-client-ui-atoms-missionpack-ml-442006170"></a>
### timeToBeat

```ml
timeToBeat
```

When constructing this record, `create` supplies `array(16,0)` for this member. Used by `UI_CalcPostGameStats` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L110)

<a id="field-field-mq3-client-ui-atoms-missionpack-state-whiteshader-whiteshader-src-mq3-client-ui-atoms-missionpack-ml-1528321334"></a>
### whiteShader

```ml
whiteShader
```

Shader resource selected for white rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L98)

<a id="field-field-mq3-client-ui-atoms-missionpack-state-xscale-xscale-src-mq3-client-ui-atoms-missionpack-ml-8306774"></a>
### xscale

```ml
xscale
```

When constructing this record, `create` supplies `1.0` for this member. Used by `setDisplayContext` and `UI_AdjustFrom640` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L85)

<a id="field-field-mq3-client-ui-atoms-missionpack-state-yscale-yscale-src-mq3-client-ui-atoms-missionpack-ml-134968988"></a>
### yscale

```ml
yscale
```

When constructing this record, `create` supplies `1.0` for this member. Used by `setDisplayContext` and `UI_AdjustFrom640` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms_missionpack.ml#L88)
