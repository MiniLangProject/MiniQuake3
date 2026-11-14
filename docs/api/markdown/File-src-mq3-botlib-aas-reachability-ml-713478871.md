# `src/mq3/botlib/aas_reachability.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_reachability`](Package-mq3-botlib-aas-reachability-1278585819.md)

Reachable from entry: **no**

## Imports

- `mq3/botlib/aas_routing.ml` as `routing` → [src/mq3/botlib/aas_routing.ml](File-src-mq3-botlib-aas-routing-ml-230871418.md)
- `mq3/botlib/aas_runtime.ml` as `runtime` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/aas.ml` as `aas` → [src/mq3/format/aas.ml](File-src-mq3-format-aas-ml-835678928.md)

## Declarations

<a id="function-function-mq3-botlib-aas-reachability-aas-allocreachability-function-aas-allocreachability-world-src-mq3-botlib-aas-reachability-ml-97958584"></a>
### AAS_AllocReachability

```ml
function AAS_AllocReachability(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L85)

<a id="function-function-mq3-botlib-aas-reachability-aas-areaclusterportal-function-aas-areaclusterportal-world-areanum-src-mq3-botlib-aas-reachability-ml-2106552379"></a>
### AAS_AreaClusterPortal

```ml
function AAS_AreaClusterPortal(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L118)

<a id="function-function-mq3-botlib-aas-reachability-aas-areacrouch-function-aas-areacrouch-world-areanum-src-mq3-botlib-aas-reachability-ml-1780642137"></a>
### AAS_AreaCrouch

```ml
function AAS_AreaCrouch(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L109)

<a id="function-function-mq3-botlib-aas-reachability-aas-areadonotenter-function-aas-areadonotenter-world-areanum-src-mq3-botlib-aas-reachability-ml-1184140197"></a>
### AAS_AreaDoNotEnter

```ml
function AAS_AreaDoNotEnter(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L119)

<a id="function-function-mq3-botlib-aas-reachability-aas-areagrounded-function-aas-areagrounded-world-areanum-src-mq3-botlib-aas-reachability-ml-2077094529"></a>
### AAS_AreaGrounded

```ml
function AAS_AreaGrounded(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L114)

<a id="function-function-mq3-botlib-aas-reachability-aas-areagroundfacearea-function-aas-areagroundfacearea-world-areanum-src-mq3-botlib-aas-reachability-ml-1369792117"></a>
### AAS_AreaGroundFaceArea

```ml
function AAS_AreaGroundFaceArea(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L97)

<a id="function-function-mq3-botlib-aas-reachability-aas-areajumppad-function-aas-areajumppad-world-areanum-src-mq3-botlib-aas-reachability-ml-789272461"></a>
### AAS_AreaJumpPad

```ml
function AAS_AreaJumpPad(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L116)

<a id="function-function-mq3-botlib-aas-reachability-aas-arealadder-function-aas-arealadder-world-areanum-src-mq3-botlib-aas-reachability-ml-1973807149"></a>
### AAS_AreaLadder

```ml
function AAS_AreaLadder(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L115)

<a id="function-function-mq3-botlib-aas-reachability-aas-arealava-function-aas-arealava-world-areanum-src-mq3-botlib-aas-reachability-ml-325405305"></a>
### AAS_AreaLava

```ml
function AAS_AreaLava(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L112)

<a id="function-function-mq3-botlib-aas-reachability-aas-arealiquid-function-aas-arealiquid-world-areanum-src-mq3-botlib-aas-reachability-ml-970751465"></a>
### AAS_AreaLiquid

```ml
function AAS_AreaLiquid(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L111)

<a id="function-function-mq3-botlib-aas-reachability-aas-areareachability-function-aas-areareachability-world-areanum-src-mq3-botlib-aas-reachability-ml-1615811205"></a>
### AAS_AreaReachability

```ml
function AAS_AreaReachability(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L96)

<a id="function-function-mq3-botlib-aas-reachability-aas-areaslime-function-aas-areaslime-world-areanum-src-mq3-botlib-aas-reachability-ml-1287920355"></a>
### AAS_AreaSlime

```ml
function AAS_AreaSlime(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L113)

<a id="function-function-mq3-botlib-aas-reachability-aas-areaswim-function-aas-areaswim-world-areanum-src-mq3-botlib-aas-reachability-ml-1486537069"></a>
### AAS_AreaSwim

```ml
function AAS_AreaSwim(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L110)

<a id="function-function-mq3-botlib-aas-reachability-aas-areateleporter-function-aas-areateleporter-world-areanum-src-mq3-botlib-aas-reachability-ml-2137909113"></a>
### AAS_AreaTeleporter

```ml
function AAS_AreaTeleporter(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L117)

<a id="function-function-mq3-botlib-aas-reachability-aas-areavolume-function-aas-areavolume-world-areanum-src-mq3-botlib-aas-reachability-ml-558475657"></a>
### AAS_AreaVolume

```ml
function AAS_AreaVolume(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L65)

<a id="function-function-mq3-botlib-aas-reachability-aas-barrierjumptraveltime-function-aas-barrierjumptraveltime-world-src-mq3-botlib-aas-reachability-ml-1995338640"></a>
### AAS_BarrierJumpTravelTime

```ml
function AAS_BarrierJumpTravelTime(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L120)

<a id="function-function-mq3-botlib-aas-reachability-aas-bestreachablearea-function-aas-bestreachablearea-world-origin-mins-maxs-goalorigin-src-mq3-botlib-aas-reachability-ml-943636417"></a>
### AAS_BestReachableArea

```ml
function AAS_BestReachableArea(world, origin, mins, maxs, goalOrigin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `goalOrigin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L75)

<a id="function-function-mq3-botlib-aas-reachability-aas-bestreachablefromjumppadarea-function-aas-bestreachablefromjumppadarea-world-origin-mins-maxs-src-mq3-botlib-aas-reachability-ml-471817384"></a>
### AAS_BestReachableFromJumpPadArea

```ml
function AAS_BestReachableFromJumpPadArea(world, origin, mins, maxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L72)

<a id="function-function-mq3-botlib-aas-reachability-aas-bestreachablelinkarea-function-aas-bestreachablelinkarea-world-areas-src-mq3-botlib-aas-reachability-ml-1599797168"></a>
### AAS_BestReachableLinkArea

```ml
function AAS_BestReachableLinkArea(world, areas)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areas` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L66)

<a id="function-function-mq3-botlib-aas-reachability-aas-closestedgepoints-function-aas-closestedgepoints-v1-v2-v3-v4-src-mq3-botlib-aas-reachability-ml-903723304"></a>
### AAS_ClosestEdgePoints

```ml
function AAS_ClosestEdgePoints(v1, v2, v3, v4)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v1` | `dynamic` | — |  |
| `v2` | `dynamic` | — |  |
| `v3` | `dynamic` | — |  |
| `v4` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L142)

<a id="function-function-mq3-botlib-aas-reachability-aas-continueinitreachability-function-aas-continueinitreachability-world-time-src-mq3-botlib-aas-reachability-ml-1521255489"></a>
### AAS_ContinueInitReachability

```ml
function AAS_ContinueInitReachability(world, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L166)

<a id="function-function-mq3-botlib-aas-reachability-aas-facearea-function-aas-facearea-world-face-src-mq3-botlib-aas-reachability-ml-46813981"></a>
### AAS_FaceArea

```ml
function AAS_FaceArea(world, face)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `face` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L64)

<a id="function-function-mq3-botlib-aas-reachability-aas-facecenter-function-aas-facecenter-world-facenum-src-mq3-botlib-aas-reachability-ml-359545085"></a>
### AAS_FaceCenter

```ml
function AAS_FaceCenter(world, faceNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `faceNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L100)

<a id="function-function-mq3-botlib-aas-reachability-aas-falldamagedistance-function-aas-falldamagedistance-world-src-mq3-botlib-aas-reachability-ml-1401378740"></a>
### AAS_FallDamageDistance

```ml
function AAS_FallDamageDistance(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L105)

<a id="function-function-mq3-botlib-aas-reachability-aas-falldelta-function-aas-falldelta-world-distance-src-mq3-botlib-aas-reachability-ml-1832709961"></a>
### AAS_FallDelta

```ml
function AAS_FallDelta(world, distance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `distance` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L106)

<a id="function-function-mq3-botlib-aas-reachability-aas-findfacereachabilities-function-aas-findfacereachabilities-world-areanum-src-mq3-botlib-aas-reachability-ml-790874957"></a>
### AAS_FindFaceReachabilities

```ml
function AAS_FindFaceReachabilities(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L160)

<a id="function-function-mq3-botlib-aas-reachability-aas-freereachability-function-aas-freereachability-world-value-src-mq3-botlib-aas-reachability-ml-2143129127"></a>
### AAS_FreeReachability

```ml
function AAS_FreeReachability(world, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L89)

<a id="function-function-mq3-botlib-aas-reachability-aas-getjumppadinfo-function-aas-getjumppadinfo-world-ent-areastart-absmins-absmaxs-velocity-src-mq3-botlib-aas-reachability-ml-1070753015"></a>
### AAS_GetJumpPadInfo

```ml
function AAS_GetJumpPadInfo(world, ent, areaStart, absmins, absmaxs, velocity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `areaStart` | `dynamic` | — |  |
| `absmins` | `dynamic` | — |  |
| `absmaxs` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L69)

<a id="function-function-mq3-botlib-aas-reachability-aas-initreachability-function-aas-initreachability-world-src-mq3-botlib-aas-reachability-ml-1330889100"></a>
### AAS_InitReachability

```ml
function AAS_InitReachability(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L172)

<a id="function-function-mq3-botlib-aas-reachability-aas-maxjumpdistance-function-aas-maxjumpdistance-world-jumpvelocity-src-mq3-botlib-aas-reachability-ml-1752302365"></a>
### AAS_MaxJumpDistance

```ml
function AAS_MaxJumpDistance(world, jumpVelocity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `jumpVelocity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L108)

<a id="function-function-mq3-botlib-aas-reachability-aas-maxjumpheight-function-aas-maxjumpheight-world-jumpvelocity-src-mq3-botlib-aas-reachability-ml-1927952797"></a>
### AAS_MaxJumpHeight

```ml
function AAS_MaxJumpHeight(world, jumpVelocity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `jumpVelocity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L107)

<a id="function-function-mq3-botlib-aas-reachability-aas-nearbysolidorgap-function-aas-nearbysolidorgap-world-start-finish-src-mq3-botlib-aas-reachability-ml-116428965"></a>
### AAS_NearbySolidOrGap

```ml
function AAS_NearbySolidOrGap(world, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L122)

<a id="function-function-mq3-botlib-aas-reachability-aas-reachability-elevator-function-aas-reachability-elevator-world-src-mq3-botlib-aas-reachability-ml-623777176"></a>
### AAS_Reachability_Elevator

```ml
function AAS_Reachability_Elevator(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L153)

<a id="function-function-mq3-botlib-aas-reachability-aas-reachability-equalfloorheight-function-aas-reachability-equalfloorheight-world-area1-area2-src-mq3-botlib-aas-reachability-ml-2094120279"></a>
### AAS_Reachability_EqualFloorHeight

```ml
function AAS_Reachability_EqualFloorHeight(world, area1, area2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `area1` | `dynamic` | — |  |
| `area2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L127)

<a id="function-function-mq3-botlib-aas-reachability-aas-reachability-funcbobbing-function-aas-reachability-funcbobbing-world-src-mq3-botlib-aas-reachability-ml-1837475152"></a>
### AAS_Reachability_FuncBobbing

```ml
function AAS_Reachability_FuncBobbing(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L154)

<a id="function-function-mq3-botlib-aas-reachability-aas-reachability-grapple-function-aas-reachability-grapple-world-area1-area2-src-mq3-botlib-aas-reachability-ml-170844453"></a>
### AAS_Reachability_Grapple

```ml
function AAS_Reachability_Grapple(world, area1, area2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `area1` | `dynamic` | — |  |
| `area2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L156)

<a id="function-function-mq3-botlib-aas-reachability-aas-reachability-jump-function-aas-reachability-jump-world-area1-area2-src-mq3-botlib-aas-reachability-ml-1491094629"></a>
### AAS_Reachability_Jump

```ml
function AAS_Reachability_Jump(world, area1, area2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `area1` | `dynamic` | — |  |
| `area2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L148)

<a id="function-function-mq3-botlib-aas-reachability-aas-reachability-jumppad-function-aas-reachability-jumppad-world-src-mq3-botlib-aas-reachability-ml-1031239140"></a>
### AAS_Reachability_JumpPad

```ml
function AAS_Reachability_JumpPad(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L155)

<a id="function-function-mq3-botlib-aas-reachability-aas-reachability-ladder-function-aas-reachability-ladder-world-area1-area2-src-mq3-botlib-aas-reachability-ml-90514941"></a>
### AAS_Reachability_Ladder

```ml
function AAS_Reachability_Ladder(world, area1, area2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `area1` | `dynamic` | — |  |
| `area2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L149)

<a id="function-function-mq3-botlib-aas-reachability-aas-reachability-step-barrier-waterjump-walkoffledge-function-aas-reachability-step-barrier-waterjump-walkoffledge-world-area1-area2-src-mq3-botlib-aas-reachability-ml-1301285077"></a>
### AAS_Reachability_Step_Barrier_WaterJump_WalkOffLedge

```ml
function AAS_Reachability_Step_Barrier_WaterJump_WalkOffLedge(world, area1, area2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `area1` | `dynamic` | — |  |
| `area2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L130)

<a id="function-function-mq3-botlib-aas-reachability-aas-reachability-swim-function-aas-reachability-swim-world-area1-area2-src-mq3-botlib-aas-reachability-ml-373697349"></a>
### AAS_Reachability_Swim

```ml
function AAS_Reachability_Swim(world, area1, area2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `area1` | `dynamic` | — |  |
| `area2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L126)

<a id="function-function-mq3-botlib-aas-reachability-aas-reachability-teleport-function-aas-reachability-teleport-world-src-mq3-botlib-aas-reachability-ml-1917534570"></a>
### AAS_Reachability_Teleport

```ml
function AAS_Reachability_Teleport(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L152)

<a id="function-function-mq3-botlib-aas-reachability-aas-reachability-walkoffledge-function-aas-reachability-walkoffledge-world-areanum-src-mq3-botlib-aas-reachability-ml-172404283"></a>
### AAS_Reachability_WalkOffLedge

```ml
function AAS_Reachability_WalkOffLedge(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L159)

<a id="function-function-mq3-botlib-aas-reachability-aas-reachability-weaponjump-function-aas-reachability-weaponjump-world-area1-area2-src-mq3-botlib-aas-reachability-ml-1412625501"></a>
### AAS_Reachability_WeaponJump

```ml
function AAS_Reachability_WeaponJump(world, area1, area2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `area1` | `dynamic` | — |  |
| `area2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L158)

<a id="function-function-mq3-botlib-aas-reachability-aas-reachabilityexists-function-aas-reachabilityexists-world-area1-area2-src-mq3-botlib-aas-reachability-ml-1588466205"></a>
### AAS_ReachabilityExists

```ml
function AAS_ReachabilityExists(world, area1, area2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `area1` | `dynamic` | — |  |
| `area2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L121)

<a id="function-function-mq3-botlib-aas-reachability-aas-setupreachabilityheap-function-aas-setupreachabilityheap-world-src-mq3-botlib-aas-reachability-ml-1915048596"></a>
### AAS_SetupReachabilityHeap

```ml
function AAS_SetupReachabilityHeap(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L83)

<a id="function-function-mq3-botlib-aas-reachability-aas-setweaponjumpareaflags-function-aas-setweaponjumpareaflags-world-src-mq3-botlib-aas-reachability-ml-940579052"></a>
### AAS_SetWeaponJumpAreaFlags

```ml
function AAS_SetWeaponJumpAreaFlags(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L157)

<a id="function-function-mq3-botlib-aas-reachability-aas-shutdownreachabilityheap-function-aas-shutdownreachabilityheap-world-src-mq3-botlib-aas-reachability-ml-1222531260"></a>
### AAS_ShutDownReachabilityHeap

```ml
function AAS_ShutDownReachabilityHeap(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L84)

<a id="function-function-mq3-botlib-aas-reachability-aas-storereachability-function-aas-storereachability-world-src-mq3-botlib-aas-reachability-ml-1203533612"></a>
### AAS_StoreReachability

```ml
function AAS_StoreReachability(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L163)

<a id="function-function-mq3-botlib-aas-reachability-aas-travelflagsforteam-function-aas-travelflagsforteam-world-ent-src-mq3-botlib-aas-reachability-ml-1917827947"></a>
### AAS_TravelFlagsForTeam

```ml
function AAS_TravelFlagsForTeam(world, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L150)

- [mq3.botlib.aas_reachability.Action](Type-mq3-botlib-aas-reachability-action-777081141.md) — struct
<a id="function-function-mq3-botlib-aas-reachability-addreach-function-addreach-world-source-destination-type-start-finish-facenum-edgenum-time-src-mq3-botlib-aas-reachability-ml-458749349"></a>
### addReach

```ml
function addReach(world, source, destination, type, start, finish, faceNum, edgeNum, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `destination` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `faceNum` | `dynamic` | — |  |
| `edgeNum` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L92)

<a id="function-function-mq3-botlib-aas-reachability-addspecial-function-addspecial-world-kind-traveltype-src-mq3-botlib-aas-reachability-ml-951181570"></a>
### addSpecial

```ml
function addSpecial(world, kind, travelType)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `travelType` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L151)

<a id="constant-constant-mq3-botlib-aas-reachability-area-grounded-const-area-grounded-1-src-mq3-botlib-aas-reachability-ml-1697102744"></a>
### AREA_GROUNDED

```ml
const AREA_GROUNDED = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L12)

<a id="constant-constant-mq3-botlib-aas-reachability-area-ladder-const-area-ladder-2-src-mq3-botlib-aas-reachability-ml-1615364263"></a>
### AREA_LADDER

```ml
const AREA_LADDER = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L13)

<a id="constant-constant-mq3-botlib-aas-reachability-area-liquid-const-area-liquid-4-src-mq3-botlib-aas-reachability-ml-463649705"></a>
### AREA_LIQUID

```ml
const AREA_LIQUID = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L14)

<a id="constant-constant-mq3-botlib-aas-reachability-area-weaponjump-const-area-weaponjump-8192-src-mq3-botlib-aas-reachability-ml-1153680235"></a>
### AREA_WEAPONJUMP

```ml
const AREA_WEAPONJUMP = 8192
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L15)

<a id="constant-constant-mq3-botlib-aas-reachability-areacontents-clusterportal-const-areacontents-clusterportal-8-src-mq3-botlib-aas-reachability-ml-2102585867"></a>
### AREACONTENTS_CLUSTERPORTAL

```ml
const AREACONTENTS_CLUSTERPORTAL = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L18)

<a id="constant-constant-mq3-botlib-aas-reachability-areacontents-donotenter-const-areacontents-donotenter-256-src-mq3-botlib-aas-reachability-ml-134573622"></a>
### AREACONTENTS_DONOTENTER

```ml
const AREACONTENTS_DONOTENTER = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L21)

<a id="constant-constant-mq3-botlib-aas-reachability-areacontents-jumppad-const-areacontents-jumppad-128-src-mq3-botlib-aas-reachability-ml-113981634"></a>
### AREACONTENTS_JUMPPAD

```ml
const AREACONTENTS_JUMPPAD = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L20)

<a id="constant-constant-mq3-botlib-aas-reachability-areacontents-lava-const-areacontents-lava-2-src-mq3-botlib-aas-reachability-ml-1506202075"></a>
### AREACONTENTS_LAVA

```ml
const AREACONTENTS_LAVA = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L16)

<a id="constant-constant-mq3-botlib-aas-reachability-areacontents-slime-const-areacontents-slime-4-src-mq3-botlib-aas-reachability-ml-950806975"></a>
### AREACONTENTS_SLIME

```ml
const AREACONTENTS_SLIME = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L17)

<a id="constant-constant-mq3-botlib-aas-reachability-areacontents-teleporter-const-areacontents-teleporter-64-src-mq3-botlib-aas-reachability-ml-1991421673"></a>
### AREACONTENTS_TELEPORTER

```ml
const AREACONTENTS_TELEPORTER = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L19)

<a id="function-function-mq3-botlib-aas-reachability-center-function-center-world-areanum-src-mq3-botlib-aas-reachability-ml-1623351501"></a>
### center

```ml
function center(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L60)

<a id="function-function-mq3-botlib-aas-reachability-create-function-create-rt-src-mq3-botlib-aas-reachability-ml-911538828"></a>
### create

```ml
function create(rt)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rt` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L49)

<a id="function-function-mq3-botlib-aas-reachability-defaultphysics-function-defaultphysics-src-mq3-botlib-aas-reachability-ml-1492132290"></a>
### defaultPhysics

```ml
function defaultPhysics()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L47)

<a id="function-function-mq3-botlib-aas-reachability-dot-function-dot-a-b-src-mq3-botlib-aas-reachability-ml-241211043"></a>
### dot

```ml
function dot(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L58)

<a id="function-function-mq3-botlib-aas-reachability-emit-function-emit-world-kind-source-destination-detail-src-mq3-botlib-aas-reachability-ml-1531487650"></a>
### emit

```ml
function emit(world, kind, source, destination, detail)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `destination` | `dynamic` | — |  |
| `detail` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L56)

<a id="constant-constant-mq3-botlib-aas-reachability-face-ground-const-face-ground-4-src-mq3-botlib-aas-reachability-ml-1169048661"></a>
### FACE_GROUND

```ml
const FACE_GROUND = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L11)

<a id="function-function-mq3-botlib-aas-reachability-length-function-length-v-src-mq3-botlib-aas-reachability-ml-303778530"></a>
### length

```ml
function length(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L59)

<a id="function-function-mq3-botlib-aas-reachability-overlap-function-overlap-a-b-extra-src-mq3-botlib-aas-reachability-ml-1993923485"></a>
### overlap

```ml
function overlap(a, b, extra)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `extra` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L61)

- [mq3.botlib.aas_reachability.Physics](Type-mq3-botlib-aas-reachability-physics-1920200268.md) — struct
<a id="constant-constant-mq3-botlib-aas-reachability-presence-normal-const-presence-normal-2-src-mq3-botlib-aas-reachability-ml-456275999"></a>
### PRESENCE_NORMAL

```ml
const PRESENCE_NORMAL = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L22)

- [mq3.botlib.aas_reachability.Reach](Type-mq3-botlib-aas-reachability-reach-29710894.md) — struct
<a id="function-function-mq3-botlib-aas-reachability-services-function-services-src-mq3-botlib-aas-reachability-ml-351231674"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L48)

- [mq3.botlib.aas_reachability.Services](Type-mq3-botlib-aas-reachability-services-1249811475.md) — struct
- [mq3.botlib.aas_reachability.Special](Type-mq3-botlib-aas-reachability-special-1295102430.md) — struct
<a id="constant-constant-mq3-botlib-aas-reachability-travel-barrierjump-const-travel-barrierjump-4-src-mq3-botlib-aas-reachability-ml-851935191"></a>
### TRAVEL_BARRIERJUMP

```ml
const TRAVEL_BARRIERJUMP = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L25)

<a id="constant-constant-mq3-botlib-aas-reachability-travel-crouch-const-travel-crouch-3-src-mq3-botlib-aas-reachability-ml-241220118"></a>
### TRAVEL_CROUCH

```ml
const TRAVEL_CROUCH = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L24)

<a id="constant-constant-mq3-botlib-aas-reachability-travel-elevator-const-travel-elevator-11-src-mq3-botlib-aas-reachability-ml-1961977241"></a>
### TRAVEL_ELEVATOR

```ml
const TRAVEL_ELEVATOR = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L32)

<a id="constant-constant-mq3-botlib-aas-reachability-travel-funcbob-const-travel-funcbob-19-src-mq3-botlib-aas-reachability-ml-2071784899"></a>
### TRAVEL_FUNCBOB

```ml
const TRAVEL_FUNCBOB = 19
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L36)

<a id="constant-constant-mq3-botlib-aas-reachability-travel-grapplehook-const-travel-grapplehook-14-src-mq3-botlib-aas-reachability-ml-867567240"></a>
### TRAVEL_GRAPPLEHOOK

```ml
const TRAVEL_GRAPPLEHOOK = 14
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L34)

<a id="constant-constant-mq3-botlib-aas-reachability-travel-jump-const-travel-jump-5-src-mq3-botlib-aas-reachability-ml-79306232"></a>
### TRAVEL_JUMP

```ml
const TRAVEL_JUMP = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L26)

<a id="constant-constant-mq3-botlib-aas-reachability-travel-jumppad-const-travel-jumppad-18-src-mq3-botlib-aas-reachability-ml-1693955282"></a>
### TRAVEL_JUMPPAD

```ml
const TRAVEL_JUMPPAD = 18
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L35)

<a id="constant-constant-mq3-botlib-aas-reachability-travel-ladder-const-travel-ladder-6-src-mq3-botlib-aas-reachability-ml-1687565283"></a>
### TRAVEL_LADDER

```ml
const TRAVEL_LADDER = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L27)

<a id="constant-constant-mq3-botlib-aas-reachability-travel-rocketjump-const-travel-rocketjump-12-src-mq3-botlib-aas-reachability-ml-802526466"></a>
### TRAVEL_ROCKETJUMP

```ml
const TRAVEL_ROCKETJUMP = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L33)

<a id="constant-constant-mq3-botlib-aas-reachability-travel-swim-const-travel-swim-8-src-mq3-botlib-aas-reachability-ml-244985809"></a>
### TRAVEL_SWIM

```ml
const TRAVEL_SWIM = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L29)

<a id="constant-constant-mq3-botlib-aas-reachability-travel-teleport-const-travel-teleport-10-src-mq3-botlib-aas-reachability-ml-1112130500"></a>
### TRAVEL_TELEPORT

```ml
const TRAVEL_TELEPORT = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L31)

<a id="constant-constant-mq3-botlib-aas-reachability-travel-walk-const-travel-walk-2-src-mq3-botlib-aas-reachability-ml-1999386407"></a>
### TRAVEL_WALK

```ml
const TRAVEL_WALK = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L23)

<a id="constant-constant-mq3-botlib-aas-reachability-travel-walkoffledge-const-travel-walkoffledge-7-src-mq3-botlib-aas-reachability-ml-1382182090"></a>
### TRAVEL_WALKOFFLEDGE

```ml
const TRAVEL_WALKOFFLEDGE = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L28)

<a id="constant-constant-mq3-botlib-aas-reachability-travel-waterjump-const-travel-waterjump-9-src-mq3-botlib-aas-reachability-ml-1809993610"></a>
### TRAVEL_WATERJUMP

```ml
const TRAVEL_WATERJUMP = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L30)

<a id="constant-constant-mq3-botlib-aas-reachability-travelflag-notteam1-const-travelflag-notteam1-16777216-src-mq3-botlib-aas-reachability-ml-1251788294"></a>
### TRAVELFLAG_NOTTEAM1

```ml
const TRAVELFLAG_NOTTEAM1 = 16777216
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L37)

<a id="constant-constant-mq3-botlib-aas-reachability-travelflag-notteam2-const-travelflag-notteam2-33554432-src-mq3-botlib-aas-reachability-ml-1087459560"></a>
### TRAVELFLAG_NOTTEAM2

```ml
const TRAVELFLAG_NOTTEAM2 = 33554432
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L38)

<a id="function-function-mq3-botlib-aas-reachability-traveltime-function-traveltime-distance-speed-base-src-mq3-botlib-aas-reachability-ml-1153860163"></a>
### travelTime

```ml
function travelTime(distance, speed, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `distance` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L62)

<a id="function-function-mq3-botlib-aas-reachability-valid-function-valid-world-areanum-src-mq3-botlib-aas-reachability-ml-2073587449"></a>
### valid

```ml
function valid(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L55)

<a id="function-function-mq3-botlib-aas-reachability-vecsub-function-vecsub-a-b-src-mq3-botlib-aas-reachability-ml-642366301"></a>
### vecSub

```ml
function vecSub(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L57)

<a id="function-function-mq3-botlib-aas-reachability-vectorbetweenvectors-function-vectorbetweenvectors-v-v1-v2-src-mq3-botlib-aas-reachability-ml-204215927"></a>
### VectorBetweenVectors

```ml
function VectorBetweenVectors(v, v1, v2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |
| `v1` | `dynamic` | — |  |
| `v2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L140)

<a id="function-function-mq3-botlib-aas-reachability-vectordistance-function-vectordistance-v1-v2-src-mq3-botlib-aas-reachability-ml-158007379"></a>
### VectorDistance

```ml
function VectorDistance(v1, v2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v1` | `dynamic` | — |  |
| `v2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L139)

<a id="function-function-mq3-botlib-aas-reachability-vectormiddle-function-vectormiddle-v1-v2-src-mq3-botlib-aas-reachability-ml-160487275"></a>
### VectorMiddle

```ml
function VectorMiddle(v1, v2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v1` | `dynamic` | — |  |
| `v2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_reachability.ml#L141)

- [mq3.botlib.aas_reachability.World](Type-mq3-botlib-aas-reachability-world-1893523981.md) — struct
