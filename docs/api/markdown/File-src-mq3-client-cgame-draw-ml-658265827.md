# `src/mq3/client/cgame_draw.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_draw`](Package-mq3-client-cgame-draw-611567635.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-client-cgame-draw-action-function-action-kind-x-y-width-height-text-shader-color-value-client-src-mq3-client-cgame-draw-ml-1463624489"></a>
### action

```ml
function action(kind, x, y, width, height, text, shader, color, value, client)
```

Creates a `mq3.client.cgame_draw.Action` record. Assigns `kind` from `kind`, `x` from `x`, `y` from `y`, `width` from `width`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — | Value used to initialize `Action.kind`. |
| `x` | `dynamic` | — | Value used to initialize `Action.x`. |
| `y` | `dynamic` | — | Value used to initialize `Action.y`. |
| `width` | `dynamic` | — | Value used to initialize `Action.width`. |
| `height` | `dynamic` | — | Value used to initialize `Action.height`. |
| `text` | `dynamic` | — | Value used to initialize `Action.text`. |
| `shader` | `dynamic` | — | Value used to initialize `Action.shader`. |
| `color` | `dynamic` | — | Value used to initialize `Action.color`. |
| `value` | `dynamic` | — | Value used to initialize `Action.value`. |
| `client` | `dynamic` | — | Value used to initialize `Action.client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L339)

- [mq3.client.cgame_draw.Action](Type-mq3-client-cgame-draw-action-1204758205.md) — struct
<a id="function-function-mq3-client-cgame-draw-addlagometerframeinfo-function-addlagometerframeinfo-value-src-mq3-client-cgame-draw-ml-376739945"></a>
### addLagometerFrameInfo

```ml
function addLagometerFrameInfo(value)
```

CG_AddLagometerFrameInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game draw record/storage; this routine assigns `value.lag.frameSamples`, `value.lag.frameSamples[value.lag.frameCount%LAG_SAMPLES]`, `value.lag.frameCount`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L643)

<a id="function-function-mq3-client-cgame-draw-addlagometersnapshotinfo-function-addlagometersnapshotinfo-value-ping-flags-present-src-mq3-client-cgame-draw-ml-1341373943"></a>
### addLagometerSnapshotInfo

```ml
function addLagometerSnapshotInfo(value, ping, flags, present)
```

CG_AddLagometerSnapshotInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game draw record/storage; this routine assigns `value.lag.snapshotSamples`, `value.lag.snapshotFlags`, `value.lag.snapshotSamples[slot]`, `value.lag.snapshotFlags[slot]` and additional values. |
| `ping` | `dynamic` | — | Value used by `sample=ping`. |
| `flags` | `dynamic` | — | Value used by `flags=0 end if`. |
| `present` | `dynamic` | — | Value used by `if not present then sample=-1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L649)

<a id="constant-constant-mq3-client-cgame-draw-attacker-head-time-const-attacker-head-time-10000-src-mq3-client-cgame-draw-ml-1964275422"></a>
### ATTACKER_HEAD_TIME

```ml
const ATTACKER_HEAD_TIME = 10000
```

Milliseconds for which the latest attacker's head icon is displayed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L67)

<a id="constant-constant-mq3-client-cgame-draw-bigchar-height-const-bigchar-height-16-src-mq3-client-cgame-draw-ml-1709975204"></a>
### BIGCHAR_HEIGHT

```ml
const BIGCHAR_HEIGHT = 16
```

Bigchar font metric controlling height in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L53)

<a id="constant-constant-mq3-client-cgame-draw-bigchar-width-const-bigchar-width-16-src-mq3-client-cgame-draw-ml-1710069878"></a>
### BIGCHAR_WIDTH

```ml
const BIGCHAR_WIDTH = 16
```

Bigchar font metric controlling width in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L51)

<a id="function-function-mq3-client-cgame-draw-centerprint-function-centerprint-value-text-y-charwidth-src-mq3-client-cgame-draw-ml-52624607"></a>
### centerPrint

```ml
function centerPrint(value, text, y, charWidth)
```

CG_CenterPrint

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game draw record/storage; this routine assigns `value.centerPrint`, `value.centerPrintTime`, `value.centerPrintY`, `value.centerPrintCharWidth` and additional values. |
| `text` | `dynamic` | — | Value assigned to `value.centerPrint`. |
| `y` | `dynamic` | — | Value assigned to `value.centerPrintY`. |
| `charWidth` | `dynamic` | — | Value assigned to `value.centerPrintCharWidth`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L669)

<a id="function-function-mq3-client-cgame-draw-clamp-function-clamp-value-low-high-src-mq3-client-cgame-draw-ml-1641474921"></a>
### clamp

```ml
function clamp(value, low, high)
```

Clamps `value` to the inclusive bounds `low` and `high` for client game draw.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<low`, `value>high` before the calculation continues. |
| `low` | `dynamic` | — | Lower bound used for comparison or clamping. |
| `high` | `dynamic` | — | Upper bound used for comparison or clamping. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L369)

<a id="function-function-mq3-client-cgame-draw-clear-function-clear-value-src-mq3-client-cgame-draw-ml-1117025595"></a>
### clear

```ml
function clear(value)
```

Updates `value.actions` during client game draw `clear`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game draw record/storage; this routine assigns `value.actions`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L361)

<a id="function-function-mq3-client-cgame-draw-client-function-client-name-team-src-mq3-client-cgame-draw-ml-1656745088"></a>
### client

```ml
function client(name, team)
```

Creates a `mq3.client.cgame_draw.Client` record. Assigns `name` from `name`, `team` from `team`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value used to initialize `Client.name`. |
| `team` | `dynamic` | — | Value used to initialize `Client.team`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L348)

- [mq3.client.cgame_draw.Client](Type-mq3-client-cgame-draw-client-255942216.md) — struct
<a id="function-function-mq3-client-cgame-draw-colorhealth-function-colorhealth-health-armor-src-mq3-client-cgame-draw-ml-537516291"></a>
### colorHealth

```ml
function colorHealth(health, armor)
```

Calls `mq3.compat.numeric.trunc32` from client game draw `colorHealth`. The final path returns `[1.0,g,b,1.0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `health` | `dynamic` | — | Value used by `if health<=0 then return [0.0,0.0,0.0,1.0] end if`. |
| `armor` | `dynamic` | — | Value used by `count=armor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L373)

<a id="function-function-mq3-client-cgame-draw-draw2dframe-function-draw2dframe-value-trace-retailactive-src-mq3-client-cgame-draw-ml-1778631291"></a>
### draw2DFrame

```ml
function draw2DFrame(value, trace, retailActive)
```

CG_Draw2D

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game draw record/storage; this routine assigns `value.scoreBoardShowing`. |
| `trace` | `dynamic` | — | Value used by `drawCrosshairNames(value,trace,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L736)

<a id="function-function-mq3-client-cgame-draw-draw3dmodel-function-draw3dmodel-value-x-y-w-h-model-skin-origin-angles-retailactive-src-mq3-client-cgame-draw-ml-1807334442"></a>
### draw3DModel

```ml
function draw3DModel(value, x, y, w, h, model, skin, origin, angles, retailActive)
```

CG_Draw3DModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.drawIcons`, `value.draw3dIcons`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `draw3DModel`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `draw3DModel`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `draw3DModel`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `draw3DModel`. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this client game draw operation. |
| `skin` | `dynamic` | — | Accepted for compatibility with `draw3DModel`; the current implementation does not read it. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `angles` | `dynamic` | — | Value used by `return publish(value,action("model",x,y,w,h,str(origin)+"\|"+str(angles),model,void,0,-1),retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L495)

<a id="function-function-mq3-client-cgame-draw-drawactive-function-drawactive-value-stereoview-hassnapshot-trace-retailactive-src-mq3-client-cgame-draw-ml-1103714308"></a>
### drawActive

```ml
function drawActive(value, stereoView, hasSnapshot, trace, retailActive)
```

CG_DrawActive

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.team`, `value.pmFlags`, `value.stereoSeparation`, `value.refX` and additional values. |
| `stereoView` | `dynamic` | — | Value used by `if stereoView==1 then separation=-value.stereoSeparation/2.0 else if stereoView==2 then separation=value.stereoSeparation/2.0 end if`. |
| `hasSnapshot` | `dynamic` | — | Value used by `if not hasSnapshot then publish(value,action("information",0,0,640,480,"","",void,0,-1),retailActive)`. |
| `trace` | `dynamic` | — | Value used by `draw2DFrame(value,trace,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L756)

<a id="function-function-mq3-client-cgame-draw-drawammowarning-function-drawammowarning-value-enabled-retailactive-src-mq3-client-cgame-draw-ml-2077451729"></a>
### drawAmmoWarning

```ml
function drawAmmoWarning(value, enabled, retailActive)
```

CG_DrawAmmoWarning

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.lowAmmoWarning`. |
| `enabled` | `dynamic` | — | Value used by `if not enabled or value.lowAmmoWarning==0 then return false end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L717)

<a id="function-function-mq3-client-cgame-draw-drawattacker-function-drawattacker-value-y-retailactive-src-mq3-client-cgame-draw-ml-539271779"></a>
### drawAttacker

```ml
function drawAttacker(value, y, retailActive)
```

CG_DrawAttacker

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game draw record/storage; this routine assigns `value.attackerTime`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawAttacker`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L550)

<a id="function-function-mq3-client-cgame-draw-drawcenterstring-function-drawcenterstring-value-centertime-retailactive-src-mq3-client-cgame-draw-ml-261518048"></a>
### drawCenterString

```ml
function drawCenterString(value, centertime, retailActive)
```

CG_DrawCenterString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.centerPrintTime`, `value.centerPrint`, `value.centerPrintY`, `value.centerPrintLines` and additional values. |
| `centertime` | `dynamic` | — | Value used by `alpha=fadeAlpha(value,value.centerPrintTime,n.trunc32(1000*centertime))`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L674)

<a id="function-function-mq3-client-cgame-draw-drawcrosshair-function-drawcrosshair-value-retailactive-src-mq3-client-cgame-draw-ml-1329456004"></a>
### drawCrosshair

```ml
function drawCrosshair(value, retailActive)
```

CG_DrawCrosshair

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.drawCrosshair`, `value.team`, `value.renderingThirdPerson`, `value.crosshairSize` and additional values. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L678)

<a id="function-function-mq3-client-cgame-draw-drawcrosshairnames-function-drawcrosshairnames-value-trace-retailactive-src-mq3-client-cgame-draw-ml-1778584617"></a>
### drawCrosshairNames

```ml
function drawCrosshairNames(value, trace, retailActive)
```

CG_DrawCrosshairNames

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.drawCrosshair`, `value.drawCrosshairNames`, `value.renderingThirdPerson`, `value.crosshairClientTime` and additional values. |
| `trace` | `dynamic` | — | Value used by `scanForCrosshairEntity(value,trace)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L687)

<a id="function-function-mq3-client-cgame-draw-drawdisconnect-function-drawdisconnect-value-commandtime-currentcmdtime-retailactive-src-mq3-client-cgame-draw-ml-513330022"></a>
### drawDisconnect

```ml
function drawDisconnect(value, commandTime, currentCmdTime, retailActive)
```

CG_DrawDisconnect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.time`. |
| `commandTime` | `dynamic` | — | Value used by `if commandTime<=currentCmdTime then return false end if`. |
| `currentCmdTime` | `dynamic` | — | Value used by `if commandTime<=currentCmdTime then return false end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L655)

<a id="function-function-mq3-client-cgame-draw-drawfield-function-drawfield-value-x-y-width-number-retailactive-src-mq3-client-cgame-draw-ml-521484224"></a>
### drawField

```ml
function drawField(value, x, y, width, number, retailActive)
```

CG_DrawField

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `result=result+[publish(value,action("number",x,y,16,24,"",str(frame),void,frame,-1),retailActive)]`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawField`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawField`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawField`. |
| `number` | `dynamic` | — | Value used by `number=clamp(number,low,high)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L480)

<a id="function-function-mq3-client-cgame-draw-drawflagmodel-function-drawflagmodel-value-x-y-w-h-team-force2d-retailactive-src-mq3-client-cgame-draw-ml-1748405440"></a>
### drawFlagModel

```ml
function drawFlagModel(value, x, y, w, h, team, force2D, retailActive)
```

CG_DrawFlagModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.draw3dIcons`, `value.drawIcons`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawFlagModel`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawFlagModel`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `drawFlagModel`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `drawFlagModel`. |
| `team` | `dynamic` | — | Value used by `if team!=TEAM_RED and team!=TEAM_BLUE and team!=TEAM_FREE then return void end if`. |
| `force2D` | `dynamic` | — | Value used by `if not force2D and value.draw3dIcons then return draw3DModel(value,x,y,w,h,name+"-flag-model","",[90.0,0.0,0.0],[0.0,0.0,0.0],retailActive) en...`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L515)

<a id="function-function-mq3-client-cgame-draw-drawfollow-function-drawfollow-value-retailactive-src-mq3-client-cgame-draw-ml-1812923680"></a>
### drawFollow

```ml
function drawFollow(value, retailActive)
```

CG_DrawFollow

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.pmFlags`, `value.clientNum`, `value.clients`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L712)

<a id="function-function-mq3-client-cgame-draw-drawfps-function-drawfps-value-y-milliseconds-retailactive-src-mq3-client-cgame-draw-ml-797014159"></a>
### drawFPS

```ml
function drawFPS(value, y, milliseconds, retailActive)
```

CG_DrawFPS

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game draw record/storage; this routine assigns `value.frameTime`, `value.previousFrameTimes[slot]`, `value.fpsIndex`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawFPS`. |
| `milliseconds` | `dynamic` | — | Time interval in milliseconds. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L561)

<a id="function-function-mq3-client-cgame-draw-drawhead-function-drawhead-value-x-y-w-h-clientnum-angles-retailactive-src-mq3-client-cgame-draw-ml-355120101"></a>
### drawHead

```ml
function drawHead(value, x, y, w, h, clientNum, angles, retailActive)
```

CG_DrawHead

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.clients`, `value.draw3dIcons`, `value.drawIcons`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawHead`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawHead`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `drawHead`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `drawHead`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |
| `angles` | `dynamic` | — | Value used by `if value.draw3dIcons and ci.headModel!="" then draw3DModel(value,x,y,w,h,ci.headModel,ci.headSkin,[70.0,0.0,0.0],angles,retailActive) else if...`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L505)

<a id="function-function-mq3-client-cgame-draw-drawholdableitem-function-drawholdableitem-value-icon-retailactive-src-mq3-client-cgame-draw-ml-1767152541"></a>
### drawHoldableItem

```ml
function drawHoldableItem(value, icon, retailActive)
```

CG_DrawHoldableItem

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `return drawPic(value,640-ICON_SIZE,480-ICON_SIZE,ICON_SIZE,ICON_SIZE,icon,void,retailActive)`. |
| `icon` | `dynamic` | — | Value used by `if icon=="" then return void end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L626)

<a id="function-function-mq3-client-cgame-draw-drawintermission-function-drawintermission-value-centertime-retailactive-src-mq3-client-cgame-draw-ml-684769160"></a>
### drawIntermission

```ml
function drawIntermission(value, centertime, retailActive)
```

CG_DrawIntermission

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game draw record/storage; this routine assigns `value.scoreBoardShowing`. |
| `centertime` | `dynamic` | — | Value used by `if value.gametype==GT_SINGLE_PLAYER then return drawCenterString(value,centertime,retailActive) end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L708)

<a id="function-function-mq3-client-cgame-draw-drawlagometer-function-drawlagometer-value-enabled-commandtime-currentcmdtime-retailactive-src-mq3-client-cgame-draw-ml-2124869425"></a>
### drawLagometer

```ml
function drawLagometer(value, enabled, commandTime, currentCmdTime, retailActive)
```

CG_DrawLagometer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.lag.frameSamples`, `value.lag.snapshotSamples`, `value.noPredict`, `value.synchronous`. |
| `enabled` | `dynamic` | — | Value used by `if not enabled then return drawDisconnect(value,commandTime,currentCmdTime,retailActive) end if`. |
| `commandTime` | `dynamic` | — | Value used by `if not enabled then return drawDisconnect(value,commandTime,currentCmdTime,retailActive) end if`. |
| `currentCmdTime` | `dynamic` | — | Value used by `if not enabled then return drawDisconnect(value,commandTime,currentCmdTime,retailActive) end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L662)

<a id="function-function-mq3-client-cgame-draw-drawlowerleft-function-drawlowerleft-value-itemname-itemicon-pickuptime-retailactive-src-mq3-client-cgame-draw-ml-1003551099"></a>
### drawLowerLeft

```ml
function drawLowerLeft(value, itemName, itemIcon, pickupTime, retailActive)
```

CG_DrawLowerLeft

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.cgame_draw.drawPickupItem`. |
| `itemName` | `dynamic` | — | Argument 3 of `mq3.client.cgame_draw.drawPickupItem`. |
| `itemIcon` | `dynamic` | — | Argument 4 of `mq3.client.cgame_draw.drawPickupItem`. |
| `pickupTime` | `dynamic` | — | Argument 5 of `mq3.client.cgame_draw.drawPickupItem`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_draw.drawPickupItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L617)

<a id="function-function-mq3-client-cgame-draw-drawlowerright-function-drawlowerright-value-score1-score2-retailactive-src-mq3-client-cgame-draw-ml-1472100257"></a>
### drawLowerRight

```ml
function drawLowerRight(value, score1, score2, retailActive)
```

CG_DrawLowerRight

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `y=drawScores(value,y,score1,score2,retailActive)`. |
| `score1` | `dynamic` | — | Value used by `y=drawScores(value,y,score1,score2,retailActive)`. |
| `score2` | `dynamic` | — | Value used by `y=drawScores(value,y,score1,score2,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L602)

<a id="function-function-mq3-client-cgame-draw-drawpersistantpowerup-function-drawpersistantpowerup-value-icon-retailactive-src-mq3-client-cgame-draw-ml-272182603"></a>
### drawPersistantPowerup

```ml
function drawPersistantPowerup(value, icon, retailActive)
```

CG_DrawPersistantPowerup

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `return drawPic(value,640-ICON_SIZE,480-ICON_SIZE*2,ICON_SIZE,ICON_SIZE,icon,void,retailActive)`. |
| `icon` | `dynamic` | — | Value used by `if icon=="" then return void end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L631)

<a id="function-function-mq3-client-cgame-draw-drawpic-function-drawpic-value-x-y-w-h-shader-color-retailactive-src-mq3-client-cgame-draw-ml-665871232"></a>
### drawPic

```ml
function drawPic(value, x, y, w, h, shader, color, retailActive)
```

Adapts `mq3.client.cgame_draw.publish` to client game draw `drawPic`, returning its result for `value, action("pic",x,y,w,h,"",shader,color,0,-1), retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.cgame_draw.publish`. |
| `x` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("pic",x,y,w,h,"",shader,color,0,-1)`. |
| `y` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("pic",x,y,w,h,"",shader,color,0,-1)`. |
| `w` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("pic",x,y,w,h,"",shader,color,0,-1)`. |
| `h` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("pic",x,y,w,h,"",shader,color,0,-1)`. |
| `shader` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("pic",x,y,w,h,"",shader,color,0,-1)`. |
| `color` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("pic",x,y,w,h,"",shader,color,0,-1)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_draw.publish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L397)

<a id="function-function-mq3-client-cgame-draw-drawpickupitem-function-drawpickupitem-value-y-itemname-itemicon-pickuptime-retailactive-src-mq3-client-cgame-draw-ml-2116903660"></a>
### drawPickupItem

```ml
function drawPickupItem(value, y, itemName, itemIcon, pickupTime, retailActive)
```

CG_DrawPickupItem

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `alpha=fadeAlpha(value,pickupTime,3000)`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawPickupItem`. |
| `itemName` | `dynamic` | — | Value used by `drawText(value,48,y+8,itemName,16,[1.0,1.0,1.0,alpha],retailActive)`. |
| `itemIcon` | `dynamic` | — | Value used by `drawPic(value,8,y,32,32,itemIcon,[1.0,1.0,1.0,alpha],retailActive)`. |
| `pickupTime` | `dynamic` | — | Value used by `alpha=fadeAlpha(value,pickupTime,3000)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L610)

<a id="function-function-mq3-client-cgame-draw-drawpowerups-function-drawpowerups-value-y-retailactive-src-mq3-client-cgame-draw-ml-1948264811"></a>
### drawPowerups

```ml
function drawPowerups(value, y, retailActive)
```

CG_DrawPowerups

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.powerups`, `value.time`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawPowerups`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L596)

<a id="function-function-mq3-client-cgame-draw-drawproxwarning-function-drawproxwarning-value-ticking-proxtick-retailactive-src-mq3-client-cgame-draw-ml-974243677"></a>
### drawProxWarning

```ml
function drawProxWarning(value, ticking, proxTick, retailActive)
```

CG_DrawProxWarning

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `drawText(value,320-printableLength(text)*8,80,text,16,[1.0,0.0,0.0,1.0],retailActive)`. |
| `ticking` | `dynamic` | — | Value used by `if not ticking then return false end if`. |
| `proxTick` | `dynamic` | — | Value used by `if proxTick!=0 then text="INTERNAL COMBUSTION IN: "+str(proxTick) end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L723)

<a id="function-function-mq3-client-cgame-draw-drawreward-function-drawreward-value-rewardtime-rewardcount-rewardshader-rewardsound-retailactive-src-mq3-client-cgame-draw-ml-1267597860"></a>
### drawReward

```ml
function drawReward(value, rewardTime, rewardCount, rewardShader, rewardSound, retailActive)
```

CG_DrawReward

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `alpha=fadeAlpha(value,rewardTime,3000)`. |
| `rewardTime` | `dynamic` | — | Value used by `alpha=fadeAlpha(value,rewardTime,3000)`. |
| `rewardCount` | `dynamic` | — | Value used by `if rewardCount>=10 then drawPic(value,320-32,56,64,64,rewardShader,[1.0,1.0,1.0,alpha],retailActive)`. |
| `rewardShader` | `dynamic` | — | Value used by `if rewardCount>=10 then drawPic(value,320-32,56,64,64,rewardShader,[1.0,1.0,1.0,alpha],retailActive)`. |
| `rewardSound` | `dynamic` | — | Accepted for compatibility with `drawReward`; the current implementation does not read it. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L639)

<a id="function-function-mq3-client-cgame-draw-drawscoreboard-function-drawscoreboard-value-retailactive-src-mq3-client-cgame-draw-ml-1080761028"></a>
### drawScoreboard

```ml
function drawScoreboard(value, retailActive)
```

CG_DrawScoreboard

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.showScores`, `value.pmType`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L703)

<a id="function-function-mq3-client-cgame-draw-drawscores-function-drawscores-value-y-score1-score2-retailactive-src-mq3-client-cgame-draw-ml-558466218"></a>
### drawScores

```ml
function drawScores(value, y, score1, score2, retailActive)
```

CG_DrawScores

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.gametype`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawScores`. |
| `score1` | `dynamic` | — | Value used by `drawText(value,560,y,str(score1),16,[1.0,0.0,0.0,0.33],retailActive) else drawText(value,600,y,str(score1),16,void,retailActive) end if`. |
| `score2` | `dynamic` | — | Value used by `if value.gametype>=GT_TEAM then drawText(value,600,y,str(score2),16,[0.0,0.0,1.0,0.33],retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L591)

<a id="function-function-mq3-client-cgame-draw-drawsnapshot-function-drawsnapshot-value-y-retailactive-src-mq3-client-cgame-draw-ml-1001431087"></a>
### drawSnapshot

```ml
function drawSnapshot(value, y, retailActive)
```

CG_DrawSnapshot

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.serverTime`, `value.latestSnapshotNum`, `value.serverCommandSequence`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawSnapshot`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L555)

<a id="function-function-mq3-client-cgame-draw-drawspectator-function-drawspectator-value-retailactive-src-mq3-client-cgame-draw-ml-708669958"></a>
### drawSpectator

```ml
function drawSpectator(value, retailActive)
```

CG_DrawSpectator

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.gametype`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L691)

<a id="function-function-mq3-client-cgame-draw-drawstatusbar-function-drawstatusbar-value-retailactive-src-mq3-client-cgame-draw-ml-665236070"></a>
### drawStatusBar

```ml
function drawStatusBar(value, retailActive)
```

CG_DrawStatusBar

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.drawStatus`, `value.team`, `value.weapon`, `value.ammo` and additional values. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L542)

<a id="function-function-mq3-client-cgame-draw-drawstatusbarflag-function-drawstatusbarflag-value-x-team-retailactive-src-mq3-client-cgame-draw-ml-1102559987"></a>
### drawStatusBarFlag

```ml
function drawStatusBarFlag(value, x, team, retailActive)
```

CG_DrawStatusBarFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.cgame_draw.drawFlagModel`. |
| `x` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.drawFlagModel`. |
| `team` | `dynamic` | — | Argument 6 of `mq3.client.cgame_draw.drawFlagModel`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_draw.drawFlagModel`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L528)

<a id="function-function-mq3-client-cgame-draw-drawstatusbarhead-function-drawstatusbarhead-value-x-damagetime-damagex-retailactive-src-mq3-client-cgame-draw-ml-1834358821"></a>
### drawStatusBarHead

```ml
function drawStatusBarHead(value, x, damageTime, damageX, retailActive)
```

CG_DrawStatusBarHead

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.time`, `value.clientNum`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawStatusBarHead`. |
| `damageTime` | `dynamic` | — | Value used by `if damageTime!=0 and value.time-damageTime<500 then frac=(value.time-damageTime)/500.0`. |
| `damageX` | `dynamic` | — | Value used by `x=x-n.trunc32((size-60)*(0.5+damageX*0.5)) end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L522)

<a id="function-function-mq3-client-cgame-draw-drawteambackground-function-drawteambackground-value-x-y-w-h-alpha-team-retailactive-src-mq3-client-cgame-draw-ml-69611821"></a>
### drawTeamBackground

```ml
function drawTeamBackground(value, x, y, w, h, alpha, team, retailActive)
```

CG_DrawTeamBackground

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `return drawPic(value,x,y,w,h,"team-status",color,retailActive)`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawTeamBackground`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawTeamBackground`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `drawTeamBackground`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `drawTeamBackground`. |
| `alpha` | `dynamic` | — | Opacity or blend weight used by the visual effect. |
| `team` | `dynamic` | — | Value used by `if team!=TEAM_RED and team!=TEAM_BLUE then return void end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L538)

<a id="function-function-mq3-client-cgame-draw-drawteaminfo-function-drawteaminfo-value-retailactive-src-mq3-client-cgame-draw-ml-1061803684"></a>
### drawTeamInfo

```ml
function drawTeamInfo(value, retailActive)
```

CG_DrawTeamInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.cgame_draw.drawTeamOverlay`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_draw.drawTeamOverlay`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L621)

<a id="function-function-mq3-client-cgame-draw-drawteamoverlay-function-drawteamoverlay-value-y-right-upper-retailactive-src-mq3-client-cgame-draw-ml-424567019"></a>
### drawTeamOverlay

```ml
function drawTeamOverlay(value, y, right, upper, retailActive)
```

CG_DrawTeamOverlay

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.team`, `value.sortedTeamPlayers`, `value.clients`, `value.locations`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawTeamOverlay`. |
| `right` | `dynamic` | — | Value used by `if right then x=640-width end if`. |
| `upper` | `dynamic` | — | Value used by `if not upper then y=y-height end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L573)

<a id="function-function-mq3-client-cgame-draw-drawteamvote-function-drawteamvote-value-retailactive-src-mq3-client-cgame-draw-ml-863718204"></a>
### drawTeamVote

```ml
function drawTeamVote(value, retailActive)
```

CG_DrawTeamVote

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game draw record/storage; this routine assigns `value.teamVoteModified[offset]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L699)

<a id="function-function-mq3-client-cgame-draw-drawtext-function-drawtext-value-x-y-text-size-color-retailactive-src-mq3-client-cgame-draw-ml-282281068"></a>
### drawText

```ml
function drawText(value, x, y, text, size, color, retailActive)
```

Adapts `mq3.client.cgame_draw.publish` to client game draw `drawText`, returning its result for `value, action("text",x,y,printableLength(text)*size,n.trunc32(size*1.5),text,"",color,size,-1), retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.cgame_draw.publish`. |
| `x` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("text",x,y,printableLength(text)*size,n.trunc32(size*1.5),text,"",color,size,-1)`. |
| `y` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("text",x,y,printableLength(text)*size,n.trunc32(size*1.5),text,"",color,size,-1)`. |
| `text` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("text",x,y,printableLength(text)*size,n.trunc32(size*1.5),text,"",color,size,-1)`. |
| `size` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("text",x,y,printableLength(text)*size,n.trunc32(size*1.5),text,"",color,size,-1)`. |
| `color` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("text",x,y,printableLength(text)*size,n.trunc32(size*1.5),text,"",color,size,-1)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_draw.publish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L387)

<a id="function-function-mq3-client-cgame-draw-drawtimedmenus-function-drawtimedmenus-value-retailactive-src-mq3-client-cgame-draw-ml-506258128"></a>
### drawTimedMenus

```ml
function drawTimedMenus(value, retailActive)
```

CG_DrawTimedMenus

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game draw record/storage; this routine assigns `value.voiceTime`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L731)

<a id="function-function-mq3-client-cgame-draw-drawtimer-function-drawtimer-value-y-retailactive-src-mq3-client-cgame-draw-ml-875145741"></a>
### drawTimer

```ml
function drawTimer(value, y, retailActive)
```

CG_DrawTimer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.time`, `value.levelStartTime`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawTimer`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L566)

<a id="function-function-mq3-client-cgame-draw-drawtourneyscoreboard-function-drawtourneyscoreboard-value-retailactive-src-mq3-client-cgame-draw-ml-910785524"></a>
### drawTourneyScoreboard

```ml
function drawTourneyScoreboard(value, retailActive)
```

CG_DrawTourneyScoreboard

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `publish(value,action("tourney-scoreboard",0,0,640,480,"","",void,0,-1),retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L749)

<a id="function-function-mq3-client-cgame-draw-drawupperright-function-drawupperright-value-milliseconds-retailactive-src-mq3-client-cgame-draw-ml-2126227642"></a>
### drawUpperRight

```ml
function drawUpperRight(value, milliseconds, retailActive)
```

CG_DrawUpperRight

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.gametype`. |
| `milliseconds` | `dynamic` | — | Time interval in milliseconds. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L583)

<a id="function-function-mq3-client-cgame-draw-drawvote-function-drawvote-value-retailactive-src-mq3-client-cgame-draw-ml-394075668"></a>
### drawVote

```ml
function drawVote(value, retailActive)
```

CG_DrawVote

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game draw record/storage; this routine assigns `value.voteModified`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L695)

<a id="function-function-mq3-client-cgame-draw-drawwarmup-function-drawwarmup-value-retailactive-src-mq3-client-cgame-draw-ml-1906095276"></a>
### drawWarmup

```ml
function drawWarmup(value, retailActive)
```

CG_DrawWarmup

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game draw record/storage; this routine assigns `value.warmupCount`, `value.warmup`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L727)

<a id="constant-constant-mq3-client-cgame-draw-fade-time-const-fade-time-200-src-mq3-client-cgame-draw-ml-1891827379"></a>
### FADE_TIME

```ml
const FADE_TIME = 200
```

Duration in milliseconds of the standard CGame presentation fade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L49)

<a id="function-function-mq3-client-cgame-draw-fadealpha-function-fadealpha-value-start-total-src-mq3-client-cgame-draw-ml-784739827"></a>
### fadeAlpha

```ml
function fadeAlpha(value, start, total)
```

Evaluates client game draw `fadeAlpha` and returns `0.0`, `(total-t)/FADE_TIME`, `1.0` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.time`. |
| `start` | `dynamic` | — | Value tested by `start==0` before the calculation continues. |
| `total` | `dynamic` | — | Value used by `if t<0 or t>=total then return 0.0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L378)

<a id="constant-constant-mq3-client-cgame-draw-giant-height-const-giant-height-48-src-mq3-client-cgame-draw-ml-508199019"></a>
### GIANT_HEIGHT

```ml
const GIANT_HEIGHT = 48
```

Height of a giant-font character in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L57)

<a id="constant-constant-mq3-client-cgame-draw-giant-width-const-giant-width-32-src-mq3-client-cgame-draw-ml-1658261324"></a>
### GIANT_WIDTH

```ml
const GIANT_WIDTH = 32
```

Width of a giant-font character in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L55)

- [mq3.client.cgame_draw.Glyph](Type-mq3-client-cgame-draw-glyph-2074225799.md) — struct
<a id="constant-constant-mq3-client-cgame-draw-gt-ctf-const-gt-ctf-4-src-mq3-client-cgame-draw-ml-1242809909"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Native game-type value for capture the flag, used when choosing team, tournament, and single-player HUD presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L31)

<a id="constant-constant-mq3-client-cgame-draw-gt-ffa-const-gt-ffa-0-src-mq3-client-cgame-draw-ml-22151233"></a>
### GT_FFA

```ml
const GT_FFA = 0
```

Native game-type identifier selecting free-for-all deathmatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L19)

<a id="constant-constant-mq3-client-cgame-draw-gt-single-player-const-gt-single-player-2-src-mq3-client-cgame-draw-ml-1903452941"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```

Native game-type value for single-player arena progression, used when choosing team, tournament, and single-player HUD presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L25)

<a id="constant-constant-mq3-client-cgame-draw-gt-team-const-gt-team-3-src-mq3-client-cgame-draw-ml-708610706"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Native game-type value for team deathmatch, used when choosing team, tournament, and single-player HUD presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L28)

<a id="constant-constant-mq3-client-cgame-draw-gt-tournament-const-gt-tournament-1-src-mq3-client-cgame-draw-ml-511968384"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```

Native game-type value for one-on-one tournament play, used when choosing team, tournament, and single-player HUD presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L22)

<a id="constant-constant-mq3-client-cgame-draw-icon-size-const-icon-size-48-src-mq3-client-cgame-draw-ml-2079988175"></a>
### ICON_SIZE

```ml
const ICON_SIZE = 48
```

Default square HUD icon size in virtual screen coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L63)

<a id="constant-constant-mq3-client-cgame-draw-item-blob-time-const-item-blob-time-200-src-mq3-client-cgame-draw-ml-964137875"></a>
### ITEM_BLOB_TIME

```ml
const ITEM_BLOB_TIME = 200
```

Duration in milliseconds of the pickup-icon emphasis effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L65)

<a id="constant-constant-mq3-client-cgame-draw-lag-samples-const-lag-samples-128-src-mq3-client-cgame-draw-ml-1008355790"></a>
### LAG_SAMPLES

```ml
const LAG_SAMPLES = 128
```

Number of frame or packet samples retained by the lagometer history.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L45)

<a id="function-function-mq3-client-cgame-draw-lagometer-function-lagometer-src-mq3-client-cgame-draw-ml-340910942"></a>
### lagometer

```ml
function lagometer()
```

Creates a `mq3.client.cgame_draw.Lagometer` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L354)

- [mq3.client.cgame_draw.Lagometer](Type-mq3-client-cgame-draw-lagometer-1572914679.md) — struct
<a id="constant-constant-mq3-client-cgame-draw-max-clients-const-max-clients-64-src-mq3-client-cgame-draw-ml-488723977"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```

Capacity limit for the clients collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L41)

<a id="constant-constant-mq3-client-cgame-draw-max-locations-const-max-locations-64-src-mq3-client-cgame-draw-ml-1541394337"></a>
### MAX_LOCATIONS

```ml
const MAX_LOCATIONS = 64
```

Capacity limit for the locations collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L43)

<a id="constant-constant-mq3-client-cgame-draw-pm-intermission-const-pm-intermission-5-src-mq3-client-cgame-draw-ml-1209839204"></a>
### PM_INTERMISSION

```ml
const PM_INTERMISSION = 5
```

Player-movement mode selecting intermission input and physics behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L33)

<a id="constant-constant-mq3-client-cgame-draw-pmf-follow-const-pmf-follow-4096-src-mq3-client-cgame-draw-ml-2026695574"></a>
### PMF_FOLLOW

```ml
const PMF_FOLLOW = 4096
```

Player-movement state flag indicating follow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L35)

<a id="constant-constant-mq3-client-cgame-draw-pmf-scoreboard-const-pmf-scoreboard-8192-src-mq3-client-cgame-draw-ml-1707477489"></a>
### PMF_SCOREBOARD

```ml
const PMF_SCOREBOARD = 8192
```

Player-movement state flag indicating scoreboard.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L37)

<a id="function-function-mq3-client-cgame-draw-powerup-function-powerup-expires-icon-src-mq3-client-cgame-draw-ml-285432637"></a>
### powerup

```ml
function powerup(expires, icon)
```

Creates a `mq3.client.cgame_draw.Powerup` record. Assigns `expires` from `expires`, `icon` from `icon`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `expires` | `dynamic` | — | Value used to initialize `Powerup.expires`. |
| `icon` | `dynamic` | — | Value used to initialize `Powerup.icon`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L352)

- [mq3.client.cgame_draw.Powerup](Type-mq3-client-cgame-draw-powerup-677849029.md) — struct
<a id="function-function-mq3-client-cgame-draw-printablelength-function-printablelength-text-src-mq3-client-cgame-draw-ml-284129015"></a>
### printableLength

```ml
function printableLength(text)
```

Evaluates client game draw `printableLength` and returns `count` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `printableLength` in the client game draw path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L364)

<a id="function-function-mq3-client-cgame-draw-publish-function-publish-state-command-retailactive-src-mq3-client-cgame-draw-ml-1104847579"></a>
### publish

```ml
function publish(state, command, retailActive)
```

Updates `command.dispatched`, `state.actions`, `state.emitted`, `state.suppressed` during client game draw `publish`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game draw record/storage; this routine assigns `state.actions`, `state.emitted`, `state.suppressed`. |
| `command` | `dynamic` | — | Mutable client game draw record/storage; this routine assigns `command.dispatched`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L344)

<a id="function-function-mq3-client-cgame-draw-scanforcrosshairentity-function-scanforcrosshairentity-value-trace-src-mq3-client-cgame-draw-ml-751014508"></a>
### scanForCrosshairEntity

```ml
function scanForCrosshairEntity(value, trace)
```

CG_ScanForCrosshairEntity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game draw record/storage; this routine assigns `value.crosshairClientNum`, `value.crosshairClientTime`. |
| `trace` | `dynamic` | — | Record read through `trace.entityNum`, `trace.fog`, `trace.invisible`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L682)

<a id="constant-constant-mq3-client-cgame-draw-snapflag-rate-delayed-const-snapflag-rate-delayed-1-src-mq3-client-cgame-draw-ml-1339160196"></a>
### SNAPFLAG_RATE_DELAYED

```ml
const SNAPFLAG_RATE_DELAYED = 1
```

Snapshot flag indicating that rate limiting delayed the snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L39)

<a id="function-function-mq3-client-cgame-draw-state-function-state-src-mq3-client-cgame-draw-ml-695311296"></a>
### state

```ml
function state()
```

Creates a `mq3.client.cgame_draw.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L356)

- [mq3.client.cgame_draw.State](Type-mq3-client-cgame-draw-state-1790363816.md) — struct
<a id="constant-constant-mq3-client-cgame-draw-team-blue-const-team-blue-2-src-mq3-client-cgame-draw-ml-790549327"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```

Native team identifier for blue, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L15)

<a id="constant-constant-mq3-client-cgame-draw-team-free-const-team-free-0-src-mq3-client-cgame-draw-ml-840232769"></a>
### TEAM_FREE

```ml
const TEAM_FREE = 0
```

Native team identifier for free, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L11)

<a id="constant-constant-mq3-client-cgame-draw-team-red-const-team-red-1-src-mq3-client-cgame-draw-ml-811640460"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```

Native team identifier for red, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L13)

<a id="constant-constant-mq3-client-cgame-draw-team-spectator-const-team-spectator-3-src-mq3-client-cgame-draw-ml-2106377002"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```

Native team identifier for spectator, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L17)

<a id="function-function-mq3-client-cgame-draw-textheight-function-textheight-text-scale-limit-glyphs-glyphscale-src-mq3-client-cgame-draw-ml-1873873651"></a>
### textHeight

```ml
function textHeight(text, scale, limit, glyphs, glyphScale)
```

CG_Text_Height

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `textHeight` in the client game draw path. |
| `scale` | `dynamic` | — | Value used by `return n.trunc32(height*scale*glyphScale)`. |
| `limit` | `dynamic` | — | Upper limit applied while collecting or rendering the result. |
| `glyphs` | `dynamic` | — | Sequence read at `glyphs[data[index]`. |
| `glyphScale` | `dynamic` | — | Value used by `return n.trunc32(height*scale*glyphScale)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L421)

<a id="function-function-mq3-client-cgame-draw-textpaint-function-textpaint-value-x-y-scale-color-text-adjust-limit-style-glyphs-glyphscale-retailactive-src-mq3-client-cgame-draw-ml-1460931127"></a>
### textPaint

```ml
function textPaint(value, x, y, scale, color, text, adjust, limit, style, glyphs, glyphScale, retailActive)
```

CG_Text_Paint

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `if data[index]==94 and index+1<len(data) and data[index+1]!=94 then publish(value,action("set-color",0,0,0,0,"","",color,data[index+1],-1),ret...`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `textPaint`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `textPaint`. |
| `scale` | `dynamic` | — | Value used by `useScale=scale*glyphScale`. |
| `color` | `dynamic` | — | Color value used by the client game draw drawing or interpolation operation. |
| `text` | `dynamic` | — | Text consumed or emitted by `textPaint` in the client game draw path. |
| `adjust` | `dynamic` | — | Value used by `x=x+n.trunc32(glyph.xSkip*useScale+adjust)`. |
| `limit` | `dynamic` | — | Upper limit applied while collecting or rendering the result. |
| `style` | `dynamic` | — | Value used by `if style==1 or style==2 then ofs=1`. |
| `glyphs` | `dynamic` | — | Sequence read at `glyphs[data[index]`. |
| `glyphScale` | `dynamic` | — | Value used by `useScale=scale*glyphScale`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L458)

<a id="function-function-mq3-client-cgame-draw-textpaintchar-function-textpaintchar-value-x-y-width-height-scale-s-t-s2-t2-shader-retailactive-src-mq3-client-cgame-draw-ml-1417190871"></a>
### textPaintChar

```ml
function textPaintChar(value, x, y, width, height, scale, s, t, s2, t2, shader, retailActive)
```

CG_Text_PaintChar

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.client.cgame_draw.publish`. |
| `x` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`. |
| `y` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`. |
| `width` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`. |
| `height` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`. |
| `scale` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`. |
| `s` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`. |
| `t` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`. |
| `s2` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`. |
| `t2` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`. |
| `shader` | `dynamic` | — | Argument 2 of `mq3.client.cgame_draw.publish`; passed as `action("glyph",x,y,n.trunc32(width*scale),n.trunc32(height*scale),str(s)+","+str(t)+","+str(s2)+","+str(t2),shader,void,0,-1)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_draw.publish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L444)

<a id="function-function-mq3-client-cgame-draw-textwidth-function-textwidth-text-scale-limit-glyphs-glyphscale-src-mq3-client-cgame-draw-ml-687302853"></a>
### textWidth

```ml
function textWidth(text, scale, limit, glyphs, glyphScale)
```

CG_Text_Width

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `textWidth` in the client game draw path. |
| `scale` | `dynamic` | — | Value used by `return n.trunc32(width*scale*glyphScale)`. |
| `limit` | `dynamic` | — | Upper limit applied while collecting or rendering the result. |
| `glyphs` | `dynamic` | — | Sequence read at `glyphs[data[index]`. |
| `glyphScale` | `dynamic` | — | Value used by `return n.trunc32(width*scale*glyphScale)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L405)

<a id="constant-constant-mq3-client-cgame-draw-tinychar-height-const-tinychar-height-8-src-mq3-client-cgame-draw-ml-395234753"></a>
### TINYCHAR_HEIGHT

```ml
const TINYCHAR_HEIGHT = 8
```

Tinychar font metric controlling height in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L61)

<a id="constant-constant-mq3-client-cgame-draw-tinychar-width-const-tinychar-width-8-src-mq3-client-cgame-draw-ml-731760785"></a>
### TINYCHAR_WIDTH

```ml
const TINYCHAR_WIDTH = 8
```

Tinychar font metric controlling width in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L59)

- [mq3.client.cgame_draw.TraceResult](Type-mq3-client-cgame-draw-traceresult-1778805101.md) — struct
<a id="constant-constant-mq3-client-cgame-draw-vote-time-const-vote-time-30000-src-mq3-client-cgame-draw-ml-327002058"></a>
### VOTE_TIME

```ml
const VOTE_TIME = 30000
```

Duration in milliseconds of a server or team vote.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L47)
