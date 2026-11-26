# `src/mq3/client/ui_preferences.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_preferences`](Package-mq3-client-ui-preferences-1869164470.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-client-ui-preferences-cache-function-cache-src-mq3-client-ui-preferences-ml-1535853692"></a>
### cache

```ml
function cache()
```

Preferences_Cache


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L134)

<a id="function-function-mq3-client-ui-preferences-clamp-function-clamp-value-low-high-src-mq3-client-ui-preferences-ml-577242643"></a>
### clamp

```ml
function clamp(value, low, high)
```

Clamps `value` to the inclusive bounds `low` and `high` for UI preferences.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<low`, `value>high` before the calculation continues. |
| `low` | `dynamic` | — | Lower bound used for comparison or clamping. |
| `high` | `dynamic` | — | Upper bound used for comparison or clamping. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L84)

<a id="function-function-mq3-client-ui-preferences-drawcrosshair-function-drawcrosshair-value-focus-grayed-blink-src-mq3-client-ui-preferences-ml-359995337"></a>
### drawCrosshair

```ml
function drawCrosshair(value, focus, grayed, blink)
```

Crosshair_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.crosshair`. |
| `focus` | `dynamic` | — | Value used by `if grayed then color="disabled" else if focus then color="highlight"`. |
| `grayed` | `dynamic` | — | Value used by `if grayed then color="disabled" else if focus then color="highlight"`. |
| `blink` | `dynamic` | — | Value used by `style="small+pulse" else if blink then color="highlight"`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L126)

<a id="function-function-mq3-client-ui-preferences-event-function-event-value-id-notification-src-mq3-client-ui-preferences-ml-1482222603"></a>
### event

```ml
function event(value, id, notification)
```

Preferences_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI preferences record/storage; this routine assigns `value.crosshair`, `value.cvarWrites`, `value.actions`. |
| `id` | `dynamic` | — | Value used by `if id==ID_CROSSHAIR then value.crosshair=(value.crosshair+1)%10`. |
| `notification` | `dynamic` | — | Value used by `if notification!=QM_ACTIVATED then return value end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L105)

<a id="constant-constant-mq3-client-ui-preferences-id-allowdownload-const-id-allowdownload-137-src-mq3-client-ui-preferences-ml-1723092022"></a>
### ID_ALLOWDOWNLOAD

```ml
const ID_ALLOWDOWNLOAD = 137
```

Menu control identifier routed to the allowdownload action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L29)

<a id="constant-constant-mq3-client-ui-preferences-id-back-const-id-back-138-src-mq3-client-ui-preferences-ml-1770467321"></a>
### ID_BACK

```ml
const ID_BACK = 138
```

Event identifier of the Back control used to leave the gameplay-preferences menu and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L32)

<a id="constant-constant-mq3-client-ui-preferences-id-crosshair-const-id-crosshair-127-src-mq3-client-ui-preferences-ml-1314740575"></a>
### ID_CROSSHAIR

```ml
const ID_CROSSHAIR = 127
```

Menu control identifier routed to the crosshair action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L9)

<a id="constant-constant-mq3-client-ui-preferences-id-drawteamoverlay-const-id-drawteamoverlay-136-src-mq3-client-ui-preferences-ml-1828743159"></a>
### ID_DRAWTEAMOVERLAY

```ml
const ID_DRAWTEAMOVERLAY = 136
```

Menu control identifier routed to the drawteamoverlay action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L27)

<a id="constant-constant-mq3-client-ui-preferences-id-dynamiclights-const-id-dynamiclights-132-src-mq3-client-ui-preferences-ml-1730038553"></a>
### ID_DYNAMICLIGHTS

```ml
const ID_DYNAMICLIGHTS = 132
```

Menu control identifier routed to the dynamiclights action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L19)

<a id="constant-constant-mq3-client-ui-preferences-id-ejectingbrass-const-id-ejectingbrass-130-src-mq3-client-ui-preferences-ml-977204383"></a>
### ID_EJECTINGBRASS

```ml
const ID_EJECTINGBRASS = 130
```

Menu control identifier routed to the ejectingbrass action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L15)

<a id="constant-constant-mq3-client-ui-preferences-id-forcemodel-const-id-forcemodel-135-src-mq3-client-ui-preferences-ml-427721492"></a>
### ID_FORCEMODEL

```ml
const ID_FORCEMODEL = 135
```

Menu control identifier routed to the forcemodel action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L25)

<a id="constant-constant-mq3-client-ui-preferences-id-highqualitysky-const-id-highqualitysky-129-src-mq3-client-ui-preferences-ml-1238413479"></a>
### ID_HIGHQUALITYSKY

```ml
const ID_HIGHQUALITYSKY = 129
```

Menu control identifier routed to the highqualitysky action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L13)

<a id="constant-constant-mq3-client-ui-preferences-id-identifytarget-const-id-identifytarget-133-src-mq3-client-ui-preferences-ml-1798064166"></a>
### ID_IDENTIFYTARGET

```ml
const ID_IDENTIFYTARGET = 133
```

Menu control identifier routed to the identifytarget action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L21)

<a id="constant-constant-mq3-client-ui-preferences-id-simpleitems-const-id-simpleitems-128-src-mq3-client-ui-preferences-ml-137094660"></a>
### ID_SIMPLEITEMS

```ml
const ID_SIMPLEITEMS = 128
```

Menu control identifier routed to the simpleitems action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L11)

<a id="constant-constant-mq3-client-ui-preferences-id-synceveryframe-const-id-synceveryframe-134-src-mq3-client-ui-preferences-ml-225080173"></a>
### ID_SYNCEVERYFRAME

```ml
const ID_SYNCEVERYFRAME = 134
```

Menu control identifier routed to the synceveryframe action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L23)

<a id="constant-constant-mq3-client-ui-preferences-id-wallmarks-const-id-wallmarks-131-src-mq3-client-ui-preferences-ml-728464814"></a>
### ID_WALLMARKS

```ml
const ID_WALLMARKS = 131
```

Menu control identifier routed to the wallmarks action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L17)

<a id="function-function-mq3-client-ui-preferences-init-function-init-value-src-mq3-client-ui-preferences-ml-1915486089"></a>
### init

```ml
function init(value)
```

Preferences_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI preferences record/storage; this routine assigns `value.items`, `value.assets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L141)

<a id="function-function-mq3-client-ui-preferences-open-function-open-value-src-mq3-client-ui-preferences-ml-1686092237"></a>
### open

```ml
function open(value)
```

UI_PreferencesMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI preferences record/storage; this routine assigns `value.actions`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L150)

- [mq3.client.ui_preferences.PreferenceItem](Type-mq3-client-ui-preferences-preferenceitem-2013934726.md) — struct
- [mq3.client.ui_preferences.Preferences](Type-mq3-client-ui-preferences-preferences-546837250.md) — struct
<a id="constant-constant-mq3-client-ui-preferences-qm-activated-const-qm-activated-3-src-mq3-client-ui-preferences-ml-1232514068"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the gameplay-preferences menu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L7)

<a id="function-function-mq3-client-ui-preferences-setmenuitems-function-setmenuitems-crosshair-simpleitems-brasstime-marks-identify-dynamiclights-fastsky-finish-forcemodel-teamoverlay-allowdownload-src-mq3-client-ui-preferences-ml-1670963060"></a>
### setMenuItems

```ml
function setMenuItems(crosshair, simpleItems, brassTime, marks, identify, dynamicLights, fastSky, finish, forceModel, teamOverlay, allowDownload)
```

Preferences_SetMenuItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `crosshair` | `dynamic` | — | Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`. |
| `simpleItems` | `dynamic` | — | Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`. |
| `brassTime` | `dynamic` | — | Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`. |
| `marks` | `dynamic` | — | Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`. |
| `identify` | `dynamic` | — | Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`. |
| `dynamicLights` | `dynamic` | — | Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`. |
| `fastSky` | `dynamic` | — | Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`. |
| `finish` | `dynamic` | — | Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`. |
| `forceModel` | `dynamic` | — | Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`. |
| `teamOverlay` | `dynamic` | — | Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`. |
| `allowDownload` | `dynamic` | — | Value used by `value=Preferences(crosshair%10,simpleItems!=0,fastSky==0,brassTime!=0,marks!=0,dynamicLights!=0,identify!=0,finish!=0,forceModel!=0,clamp(team...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_preferences.ml#L97)
