# `src/mq3/botlib/aas_debug.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_debug`](Package-mq3-botlib-aas-debug-320098219.md)

Reachable from entry: **no**

## Imports

- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-botlib-aas-debug-aas-clearshowndebuglines-function-aas-clearshowndebuglines-state-src-mq3-botlib-aas-debug-ml-675416467"></a>
### AAS_ClearShownDebugLines

```ml
function AAS_ClearShownDebugLines(state)
```

AAS_ClearShownDebugLines

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `lines` and `visible`. May update `state.lines[index]` and `state.visible[index]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L150)

<a id="function-function-mq3-botlib-aas-debug-aas-clearshownpolygons-function-aas-clearshownpolygons-state-src-mq3-botlib-aas-debug-ml-1241843815"></a>
### AAS_ClearShownPolygons

```ml
function AAS_ClearShownPolygons(state)
```

AAS_ClearShownPolygons

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `polygons`. May update `state.polygons[index]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L141)

<a id="function-function-mq3-botlib-aas-debug-aas-debugline-function-aas-debugline-state-start-finish-color-src-mq3-botlib-aas-debug-ml-2107033215"></a>
### AAS_DebugLine

```ml
function AAS_DebugLine(state, start, finish, color)
```

AAS_DebugLine

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `lines`, `visible` and `numDebugLines`. May update `state.lines[index]`, `state.visible[index]` and `state.numDebugLines` in place. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `color` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.color`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L156)

<a id="function-function-mq3-botlib-aas-debug-aas-drawarrow-function-aas-drawarrow-state-start-finish-linecolor-arrowcolor-src-mq3-botlib-aas-debug-ml-1424404421"></a>
### AAS_DrawArrow

```ml
function AAS_DrawArrow(state, start, finish, lineColor, arrowColor)
```

AAS_DrawArrow

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `lines`, `visible` and `numDebugLines`. May update `state.lines[index]`, `state.visible[index]` and `state.numDebugLines` in place. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `lineColor` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.color`. |
| `arrowColor` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.color`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L266)

<a id="function-function-mq3-botlib-aas-debug-aas-drawcross-function-aas-drawcross-state-origin-size-color-src-mq3-botlib-aas-debug-ml-2120740973"></a>
### AAS_DrawCross

```ml
function AAS_DrawCross(state, origin, size, color)
```

AAS_DrawCross

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `lines`, `visible` and `numDebugLines`. May update `state.lines[index]`, `state.visible[index]` and `state.numDebugLines` in place. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `color` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.color`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L254)

<a id="function-function-mq3-botlib-aas-debug-aas-drawpermanentcross-function-aas-drawpermanentcross-state-origin-size-color-src-mq3-botlib-aas-debug-ml-159165573"></a>
### AAS_DrawPermanentCross

```ml
function AAS_DrawPermanentCross(state, origin, size, color)
```

AAS_DrawPermanentCross

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `lines`, `visible` and `numDebugLines`. May update `state.lines[index]`, `state.visible[index]` and `state.numDebugLines` in place. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `color` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.color`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L173)

<a id="function-function-mq3-botlib-aas-debug-aas-drawplanecross-function-aas-drawplanecross-state-point-normal-dist-typevalue-color-src-mq3-botlib-aas-debug-ml-296533152"></a>
### AAS_DrawPlaneCross

```ml
function AAS_DrawPlaneCross(state, point, normal, dist, typeValue, color)
```

AAS_DrawPlaneCross

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `lines`, `visible` and `numDebugLines`. May update `state.lines[index]`, `state.visible[index]` and `state.numDebugLines` in place. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `normal` | `dynamic` | — | Array or byte sequence accessed at `n1`, `n2` and `n0`. |
| `dist` | `dynamic` | — | Value used by `AAS_DrawPlaneCross` in `start1[n0]=(dist-(start1[n1]*normal[n1]+start1[n2]*normal[n2]))/normal[n0]`. |
| `typeValue` | `dynamic` | — | Value used by `AAS_DrawPlaneCross` in `n0=typeValue%3`. |
| `color` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.color`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L185)

<a id="function-function-mq3-botlib-aas-debug-aas-floodareas-function-aas-floodareas-state-value-origin-src-mq3-botlib-aas-debug-ml-1217342454"></a>
### AAS_FloodAreas

```ml
function AAS_FloodAreas(state, value, origin)
```

AAS_FloodAreas

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `retailActive` and `actions`. May update `state.actions` in place. |
| `value` | `dynamic` | — | Value record; accesses `loaded`, `pointArea`, `areas` and `areaSettings`. |
| `origin` | `dynamic` | — | Not read by this implementation; retained in the `AAS_FloodAreas` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L303)

<a id="function-function-mq3-botlib-aas-debug-aas-floodareas-r-function-aas-floodareas-r-state-value-areanum-cluster-done-src-mq3-botlib-aas-debug-ml-1656363381"></a>
### AAS_FloodAreas_r

```ml
function AAS_FloodAreas_r(state, value, areaNum, cluster, done)
```

AAS_FloodAreas_r

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `retailActive` and `actions`. May update `state.actions` in place. |
| `value` | `dynamic` | — | Value record; accesses `areas`, `areaSettings`, `faceIndex`, `faces` and `reachabilities`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `cluster` | `dynamic` | — | Value passed as argument 4 to `mq3.botlib.aas_debug.AAS_FloodAreas_r`. |
| `done` | `dynamic` | — | Array or byte sequence accessed at `next`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L294)

<a id="function-function-mq3-botlib-aas-debug-aas-permanentline-function-aas-permanentline-state-start-finish-color-src-mq3-botlib-aas-debug-ml-906073193"></a>
### AAS_PermanentLine

```ml
function AAS_PermanentLine(state, start, finish, color)
```

AAS_PermanentLine

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `nextLine`. May update `state.nextLine` in place. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `color` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.color`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L167)

<a id="function-function-mq3-botlib-aas-debug-aas-printtraveltype-function-aas-printtraveltype-traveltype-src-mq3-botlib-aas-debug-ml-331372020"></a>
### AAS_PrintTravelType

```ml
function AAS_PrintTravelType(travelType)
```

AAS_PrintTravelType

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `travelType` | `dynamic` | — | AAS reachability travel-type code. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L257)

<a id="function-function-mq3-botlib-aas-debug-aas-showarea-function-aas-showarea-state-value-areanum-groundfacesonly-src-mq3-botlib-aas-debug-ml-1903634348"></a>
### AAS_ShowArea

```ml
function AAS_ShowArea(state, value, areaNum, groundFacesOnly)
```

AAS_ShowArea

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `retailActive` and `actions`. May update `state.actions` in place. |
| `value` | `dynamic` | — | Value record; accesses `areas`, `faceIndex`, `faces`, `edgeIndex` and `edges` and related fields. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `groundFacesOnly` | `dynamic` | — | Value used by `AAS_ShowArea` in `if not groundFacesOnly or (faceValue.flags&(FACE_GROUND\|FACE_LADDER))!=0 then for offset=0 to faceValue.numEdges...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L235)

<a id="function-function-mq3-botlib-aas-debug-aas-showareapolygons-function-aas-showareapolygons-state-value-areanum-color-groundfacesonly-src-mq3-botlib-aas-debug-ml-363440895"></a>
### AAS_ShowAreaPolygons

```ml
function AAS_ShowAreaPolygons(state, value, areaNum, color, groundFacesOnly)
```

AAS_ShowAreaPolygons

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `retailActive` and `actions`. May update `state.actions` in place. |
| `value` | `dynamic` | — | Value record; accesses `areas`, `faceIndex` and `faces`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `color` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.color`. |
| `groundFacesOnly` | `dynamic` | — | Value used by `AAS_ShowAreaPolygons` in `if not groundFacesOnly or (faceValue.flags&(FACE_GROUND\|FACE_LADDER))!=0 then AAS_ShowFacePolygon(state,value,fa...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L246)

<a id="function-function-mq3-botlib-aas-debug-aas-showboundingbox-function-aas-showboundingbox-state-origin-mins-maxs-src-mq3-botlib-aas-debug-ml-1184995543"></a>
### AAS_ShowBoundingBox

```ml
function AAS_ShowBoundingBox(state, origin, mins, maxs)
```

AAS_ShowBoundingBox

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `lines`, `visible` and `numDebugLines`. May update `state.lines[index]`, `state.visible[index]` and `state.numDebugLines` in place. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L196)

<a id="function-function-mq3-botlib-aas-debug-aas-showface-function-aas-showface-state-value-facenum-src-mq3-botlib-aas-debug-ml-57431919"></a>
### AAS_ShowFace

```ml
function AAS_ShowFace(state, value, faceNum)
```

AAS_ShowFace

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `retailActive` and `actions`. May update `state.actions` in place. |
| `value` | `dynamic` | — | Value record; accesses `faces`, `edgeIndex`, `edges`, `vertexes` and `planes`. |
| `faceNum` | `dynamic` | — | AAS face index. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L206)

<a id="function-function-mq3-botlib-aas-debug-aas-showfacepolygon-function-aas-showfacepolygon-state-value-facenum-color-flip-src-mq3-botlib-aas-debug-ml-1637011079"></a>
### AAS_ShowFacePolygon

```ml
function AAS_ShowFacePolygon(state, value, faceNum, color, flip)
```

AAS_ShowFacePolygon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `retailActive` and `actions`. May update `state.actions` in place. |
| `value` | `dynamic` | — | Value record; accesses `faces`, `edgeIndex`, `edges` and `vertexes`. |
| `faceNum` | `dynamic` | — | AAS face index. |
| `color` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.color`. |
| `flip` | `dynamic` | — | Value used by `AAS_ShowFacePolygon` in `if flip then offset=item.numEdges-1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L225)

<a id="function-function-mq3-botlib-aas-debug-aas-showpolygon-function-aas-showpolygon-state-color-numpoints-points-src-mq3-botlib-aas-debug-ml-591196034"></a>
### AAS_ShowPolygon

```ml
function AAS_ShowPolygon(state, color, numPoints, points)
```

AAS_ShowPolygon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `polygons` and `nextPolygon`. May update `state.nextPolygon` and `state.polygons[index]` in place. |
| `color` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.color`. |
| `numPoints` | `dynamic` | — | Value used by `AAS_ShowPolygon` in `emit(state,"botimport","polygon-create",id,color,points, [numPoints])`. |
| `points` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.points`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L147)

<a id="function-function-mq3-botlib-aas-debug-aas-showreachability-function-aas-showreachability-state-value-reach-src-mq3-botlib-aas-debug-ml-68834443"></a>
### AAS_ShowReachability

```ml
function AAS_ShowReachability(state, value, reach)
```

AAS_ShowReachability

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `retailActive` and `actions`. May update `state.actions` in place. |
| `value` | `dynamic` | — | Value record; accesses `areas`, `faceIndex` and `faces`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `areaNum`, `start`, `finish`, `travelType` and `edgeNum` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L274)

<a id="function-function-mq3-botlib-aas-debug-aas-showreachableareas-function-aas-showreachableareas-state-value-areanum-time-src-mq3-botlib-aas-debug-ml-1220396020"></a>
### AAS_ShowReachableAreas

```ml
function AAS_ShowReachableAreas(state, value, areaNum, time)
```

AAS_ShowReachableAreas

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `lastAreaNum`, `reachIndex`, `lastTime` and `reach`. May update `state.reachIndex`, `state.lastAreaNum` and `state.reach` and additional fields in place. |
| `value` | `dynamic` | — | Value record; accesses `areaSettings` and `reachabilities`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L283)

<a id="function-function-mq3-botlib-aas-debug-absindex-function-absindex-value-src-mq3-botlib-aas-debug-ml-58506731"></a>
### absIndex

```ml
function absIndex(value)
```

Return the absolute value of the numeric argument for aas debug.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `0-value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L118)

- [mq3.botlib.aas_debug.Action](Type-mq3-botlib-aas-debug-action-1720482245.md) — struct
<a id="function-function-mq3-botlib-aas-debug-area-function-area-numfaces-firstface-src-mq3-botlib-aas-debug-ml-746666939"></a>
### area

```ml
function area(numFaces, firstFace)
```

Create a `mq3.botlib.aas_debug.Area` record, initializing `numFaces` from `numFaces` and `firstFace` from `firstFace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numFaces` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Area.numFaces`. |
| `firstFace` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Area.firstFace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L77)

- [mq3.botlib.aas_debug.Area](Type-mq3-botlib-aas-debug-area-1516825746.md) — struct
<a id="constant-constant-mq3-botlib-aas-debug-areacontents-viewportal-const-areacontents-viewportal-512-src-mq3-botlib-aas-debug-ml-844518195"></a>
### AREACONTENTS_VIEWPORTAL

```ml
const AREACONTENTS_VIEWPORTAL = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L17)

<a id="function-function-mq3-botlib-aas-debug-areasettings-function-areasettings-contents-cluster-numreachableareas-firstreachablearea-src-mq3-botlib-aas-debug-ml-1287788603"></a>
### areaSettings

```ml
function areaSettings(contents, cluster, numReachableAreas, firstReachableArea)
```

Create a `mq3.botlib.aas_debug.AreaSettings` record, initializing `contents` from `contents`, `cluster` from `cluster` and `numReachableAreas` from `numReachableAreas`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `contents` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.AreaSettings.contents`. |
| `cluster` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.AreaSettings.cluster`. |
| `numReachableAreas` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.AreaSettings.numReachableAreas`. |
| `firstReachableArea` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.AreaSettings.firstReachableArea`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L83)

- [mq3.botlib.aas_debug.AreaSettings](Type-mq3-botlib-aas-debug-areasettings-1541327639.md) — struct
<a id="function-function-mq3-botlib-aas-debug-claimline-function-claimline-state-src-mq3-botlib-aas-debug-ml-43193463"></a>
### claimLine

```ml
function claimLine(state)
```

Update `state.lines[index]`, `state.visible[index]` and `state.numDebugLines` during `claimLine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `lines`, `visible` and `numDebugLines`. May update `state.lines[index]`, `state.visible[index]` and `state.numDebugLines` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L177)

<a id="function-function-mq3-botlib-aas-debug-copy3-function-copy3-value-src-mq3-botlib-aas-debug-ml-1213909023"></a>
### copy3

```ml
function copy3(value)
```

Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for aas debug.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L111)

<a id="function-function-mq3-botlib-aas-debug-create-function-create-retailactive-src-mq3-botlib-aas-debug-ml-433507505"></a>
### create

```ml
function create(retailActive)
```

Create a `mq3.botlib.aas_debug.State` record, initializing `lines` as `array(MAX_DEBUGLINES,0)`, `visible` as `array(MAX_DEBUGLINES,false)` and `polygons` as `array(MAX_DEBUGPOLYGONS,0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L108)

<a id="function-function-mq3-botlib-aas-debug-createline-function-createline-state-src-mq3-botlib-aas-debug-ml-1654752831"></a>
### createLine

```ml
function createLine(state)
```

Record or dispatch `"botimport"` actions in `createLine`. Return paths include `id`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `nextLine`. May update `state.nextLine` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L130)

<a id="function-function-mq3-botlib-aas-debug-edge-function-edge-a-b-src-mq3-botlib-aas-debug-ml-1964394975"></a>
### edge

```ml
function edge(a, b)
```

Create a `mq3.botlib.aas_debug.Edge` record, initializing `vertices` as `[a,b]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Operand used to evaluate the returned expression `Edge([a,b])`. |
| `b` | `dynamic` | — | Operand used to evaluate the returned expression `Edge([a,b])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L61)

- [mq3.botlib.aas_debug.Edge](Type-mq3-botlib-aas-debug-edge-528609626.md) — struct
<a id="function-function-mq3-botlib-aas-debug-emit-function-emit-state-boundary-kind-id-color-points-values-src-mq3-botlib-aas-debug-ml-141833408"></a>
### emit

```ml
function emit(state, boundary, kind, id, color, points, values)
```

Set `state.actions` to `state.actions+[action]` in `mq3.botlib.aas_debug.emit`. Return paths include `action`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `retailActive` and `actions`. May update `state.actions` in place. |
| `boundary` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.boundary`. |
| `kind` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.kind`. |
| `id` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.id`. |
| `color` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.color`. |
| `points` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.points`. |
| `values` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.values`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L127)

<a id="function-function-mq3-botlib-aas-debug-face-function-face-planenum-flags-numedges-firstedge-frontarea-backarea-src-mq3-botlib-aas-debug-ml-1894548762"></a>
### face

```ml
function face(planeNum, flags, numEdges, firstEdge, frontArea, backArea)
```

Create a `mq3.botlib.aas_debug.Face` record, initializing `planeNum` from `planeNum`, `flags` from `flags` and `numEdges` from `numEdges`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `planeNum` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Face.planeNum`. |
| `flags` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Face.flags`. |
| `numEdges` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Face.numEdges`. |
| `firstEdge` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Face.firstEdge`. |
| `frontArea` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Face.frontArea`. |
| `backArea` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Face.backArea`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L69)

- [mq3.botlib.aas_debug.Face](Type-mq3-botlib-aas-debug-face-1428232246.md) — struct
<a id="constant-constant-mq3-botlib-aas-debug-face-ground-const-face-ground-4-src-mq3-botlib-aas-debug-ml-1487960439"></a>
### FACE_GROUND

```ml
const FACE_GROUND = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L15)

<a id="constant-constant-mq3-botlib-aas-debug-face-ladder-const-face-ladder-2-src-mq3-botlib-aas-debug-ml-221874849"></a>
### FACE_LADDER

```ml
const FACE_LADDER = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L16)

<a id="constant-constant-mq3-botlib-aas-debug-linecolor-blue-const-linecolor-blue-3-src-mq3-botlib-aas-debug-ml-1329058048"></a>
### LINECOLOR_BLUE

```ml
const LINECOLOR_BLUE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L13)

<a id="constant-constant-mq3-botlib-aas-debug-linecolor-green-const-linecolor-green-2-src-mq3-botlib-aas-debug-ml-1859202409"></a>
### LINECOLOR_GREEN

```ml
const LINECOLOR_GREEN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L12)

<a id="constant-constant-mq3-botlib-aas-debug-linecolor-none-const-linecolor-none-1-src-mq3-botlib-aas-debug-ml-386312381"></a>
### LINECOLOR_NONE

```ml
const LINECOLOR_NONE = -1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L10)

<a id="constant-constant-mq3-botlib-aas-debug-linecolor-red-const-linecolor-red-1-src-mq3-botlib-aas-debug-ml-1973913788"></a>
### LINECOLOR_RED

```ml
const LINECOLOR_RED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L11)

<a id="constant-constant-mq3-botlib-aas-debug-linecolor-yellow-const-linecolor-yellow-4-src-mq3-botlib-aas-debug-ml-473634229"></a>
### LINECOLOR_YELLOW

```ml
const LINECOLOR_YELLOW = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L14)

<a id="constant-constant-mq3-botlib-aas-debug-max-debuglines-const-max-debuglines-1024-src-mq3-botlib-aas-debug-ml-1495875794"></a>
### MAX_DEBUGLINES

```ml
const MAX_DEBUGLINES = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L8)

<a id="constant-constant-mq3-botlib-aas-debug-max-debugpolygons-const-max-debugpolygons-8192-src-mq3-botlib-aas-debug-ml-300092197"></a>
### MAX_DEBUGPOLYGONS

```ml
const MAX_DEBUGPOLYGONS = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L9)

<a id="function-function-mq3-botlib-aas-debug-plane-function-plane-normal-dist-src-mq3-botlib-aas-debug-ml-1158031775"></a>
### plane

```ml
function plane(normal, dist)
```

Create a `mq3.botlib.aas_debug.Plane` record, initializing `normal` from `normal` and `dist` from `dist`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Plane.normal`. |
| `dist` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Plane.dist`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L73)

- [mq3.botlib.aas_debug.Plane](Type-mq3-botlib-aas-debug-plane-1355552775.md) — struct
<a id="function-function-mq3-botlib-aas-debug-reachability-function-reachability-areanum-facenum-edgenum-start-finish-traveltype-traveltime-src-mq3-botlib-aas-debug-ml-375437905"></a>
### reachability

```ml
function reachability(areaNum, faceNum, edgeNum, start, finish, travelType, travelTime)
```

Create a `mq3.botlib.aas_debug.Reachability` record, initializing `areaNum` from `areaNum`, `faceNum` from `faceNum` and `edgeNum` from `edgeNum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `faceNum` | `dynamic` | — | AAS face index. |
| `edgeNum` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Reachability.edgeNum`. |
| `start` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Reachability.start`. |
| `finish` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Reachability.finish`. |
| `travelType` | `dynamic` | — | AAS reachability travel-type code. |
| `travelTime` | `dynamic` | — | AAS travel-time value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L92)

- [mq3.botlib.aas_debug.Reachability](Type-mq3-botlib-aas-debug-reachability-1287693228.md) — struct
<a id="function-function-mq3-botlib-aas-debug-showline-function-showline-state-id-start-finish-color-src-mq3-botlib-aas-debug-ml-930446882"></a>
### showLine

```ml
function showLine(state, id, start, finish, color)
```

Record or dispatch `"botimport"` actions in `showLine`. Return paths include `id`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS debug state; accesses `retailActive` and `actions`. May update `state.actions` in place. |
| `id` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.id`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `color` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.Action.color`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L137)

- [mq3.botlib.aas_debug.State](Type-mq3-botlib-aas-debug-state-1941901200.md) — struct
<a id="function-function-mq3-botlib-aas-debug-subtract3-function-subtract3-a-b-src-mq3-botlib-aas-debug-ml-897137113"></a>
### subtract3

```ml
function subtract3(a, b)
```

Return a new array `[a[0]-b[0],a[1]-b[1],a[2]-b[2]]` for `subtract3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L115)

<a id="constant-constant-mq3-botlib-aas-debug-travel-barrierjump-const-travel-barrierjump-4-src-mq3-botlib-aas-debug-ml-1773517617"></a>
### TRAVEL_BARRIERJUMP

```ml
const TRAVEL_BARRIERJUMP = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L22)

<a id="constant-constant-mq3-botlib-aas-debug-travel-bfgjump-const-travel-bfgjump-13-src-mq3-botlib-aas-debug-ml-667334191"></a>
### TRAVEL_BFGJUMP

```ml
const TRAVEL_BFGJUMP = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L31)

<a id="constant-constant-mq3-botlib-aas-debug-travel-crouch-const-travel-crouch-3-src-mq3-botlib-aas-debug-ml-812533078"></a>
### TRAVEL_CROUCH

```ml
const TRAVEL_CROUCH = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L21)

<a id="constant-constant-mq3-botlib-aas-debug-travel-doublejump-const-travel-doublejump-15-src-mq3-botlib-aas-debug-ml-34318231"></a>
### TRAVEL_DOUBLEJUMP

```ml
const TRAVEL_DOUBLEJUMP = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L33)

<a id="constant-constant-mq3-botlib-aas-debug-travel-elevator-const-travel-elevator-11-src-mq3-botlib-aas-debug-ml-1619030187"></a>
### TRAVEL_ELEVATOR

```ml
const TRAVEL_ELEVATOR = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L29)

<a id="constant-constant-mq3-botlib-aas-debug-travel-funcbob-const-travel-funcbob-19-src-mq3-botlib-aas-debug-ml-1384403341"></a>
### TRAVEL_FUNCBOB

```ml
const TRAVEL_FUNCBOB = 19
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L37)

<a id="constant-constant-mq3-botlib-aas-debug-travel-grapplehook-const-travel-grapplehook-14-src-mq3-botlib-aas-debug-ml-2138822160"></a>
### TRAVEL_GRAPPLEHOOK

```ml
const TRAVEL_GRAPPLEHOOK = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L32)

<a id="constant-constant-mq3-botlib-aas-debug-travel-invalid-const-travel-invalid-1-src-mq3-botlib-aas-debug-ml-1737058618"></a>
### TRAVEL_INVALID

```ml
const TRAVEL_INVALID = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L19)

<a id="constant-constant-mq3-botlib-aas-debug-travel-jump-const-travel-jump-5-src-mq3-botlib-aas-debug-ml-1145844512"></a>
### TRAVEL_JUMP

```ml
const TRAVEL_JUMP = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L23)

<a id="constant-constant-mq3-botlib-aas-debug-travel-jumppad-const-travel-jumppad-18-src-mq3-botlib-aas-debug-ml-708089650"></a>
### TRAVEL_JUMPPAD

```ml
const TRAVEL_JUMPPAD = 18
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L36)

<a id="constant-constant-mq3-botlib-aas-debug-travel-ladder-const-travel-ladder-6-src-mq3-botlib-aas-debug-ml-198558189"></a>
### TRAVEL_LADDER

```ml
const TRAVEL_LADDER = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L24)

<a id="constant-constant-mq3-botlib-aas-debug-travel-rampjump-const-travel-rampjump-16-src-mq3-botlib-aas-debug-ml-1153158494"></a>
### TRAVEL_RAMPJUMP

```ml
const TRAVEL_RAMPJUMP = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L34)

<a id="constant-constant-mq3-botlib-aas-debug-travel-rocketjump-const-travel-rocketjump-12-src-mq3-botlib-aas-debug-ml-762313026"></a>
### TRAVEL_ROCKETJUMP

```ml
const TRAVEL_ROCKETJUMP = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L30)

<a id="constant-constant-mq3-botlib-aas-debug-travel-strafejump-const-travel-strafejump-17-src-mq3-botlib-aas-debug-ml-1442803313"></a>
### TRAVEL_STRAFEJUMP

```ml
const TRAVEL_STRAFEJUMP = 17
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L35)

<a id="constant-constant-mq3-botlib-aas-debug-travel-swim-const-travel-swim-8-src-mq3-botlib-aas-debug-ml-900706211"></a>
### TRAVEL_SWIM

```ml
const TRAVEL_SWIM = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L26)

<a id="constant-constant-mq3-botlib-aas-debug-travel-teleport-const-travel-teleport-10-src-mq3-botlib-aas-debug-ml-1266217292"></a>
### TRAVEL_TELEPORT

```ml
const TRAVEL_TELEPORT = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L28)

<a id="constant-constant-mq3-botlib-aas-debug-travel-walk-const-travel-walk-2-src-mq3-botlib-aas-debug-ml-1172745313"></a>
### TRAVEL_WALK

```ml
const TRAVEL_WALK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L20)

<a id="constant-constant-mq3-botlib-aas-debug-travel-walkoffledge-const-travel-walkoffledge-7-src-mq3-botlib-aas-debug-ml-1457514378"></a>
### TRAVEL_WALKOFFLEDGE

```ml
const TRAVEL_WALKOFFLEDGE = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L25)

<a id="constant-constant-mq3-botlib-aas-debug-travel-waterjump-const-travel-waterjump-9-src-mq3-botlib-aas-debug-ml-1276588170"></a>
### TRAVEL_WATERJUMP

```ml
const TRAVEL_WATERJUMP = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L27)

<a id="constant-constant-mq3-botlib-aas-debug-traveltype-mask-const-traveltype-mask-16777215-src-mq3-botlib-aas-debug-ml-1761181931"></a>
### TRAVELTYPE_MASK

```ml
const TRAVELTYPE_MASK = 16777215
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L18)

<a id="function-function-mq3-botlib-aas-debug-world-function-world-vertexes-edges-edgeindex-faces-faceindex-planes-areas-settings-reaches-pointarea-retailactive-src-mq3-botlib-aas-debug-ml-646758849"></a>
### world

```ml
function world(vertexes, edges, edgeIndex, faces, faceIndex, planes, areas, settings, reaches, pointArea, retailActive)
```

Create a `mq3.botlib.aas_debug.World` record, initializing `vertexes` from `vertexes`, `edges` from `edges` and `edgeIndex` from `edgeIndex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexes` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.World.vertexes`. |
| `edges` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.World.edges`. |
| `edgeIndex` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.World.edgeIndex`. |
| `faces` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.World.faces`. |
| `faceIndex` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.World.faceIndex`. |
| `planes` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.World.planes`. |
| `areas` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.World.areas`. |
| `settings` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.World.areaSettings`. |
| `reaches` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.World.reachabilities`. |
| `pointArea` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_debug.World.pointArea`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_debug.ml#L105)

- [mq3.botlib.aas_debug.World](Type-mq3-botlib-aas-debug-world-1709028061.md) — struct
