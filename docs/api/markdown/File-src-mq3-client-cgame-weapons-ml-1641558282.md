# `src/mq3/client/cgame_weapons.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_weapons`](Package-mq3-client-cgame-weapons-497207990.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cg_local.ml` as `cgabi` → [src/mq3/client/cg_local.ml](File-src-mq3-client-cg-local-ml-909335699.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/shared/directions.ml` as `directions` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-cgame-weapons-action-function-action-state-boundaryname-kind-weaponnum-entitynum-origin-finish-velocity-model-shader-sound-radius-light-color-value-retailactive-src-mq3-client-cgame-weapons-ml-2012876045"></a>
### action

```ml
function action(state, boundaryName, kind, weaponNum, entityNum, origin, finish, velocity, model, shader, sound, radius, light, color, value, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundaryName` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `weaponNum` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `light` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L72)

<a id="function-function-mq3-client-cgame-weapons-addplayerweapon-function-addplayerweapon-state-cent-isview-flashorigin-retailactive-src-mq3-client-cgame-weapons-ml-1866418275"></a>
### addPlayerWeapon

```ml
function addPlayerWeapon(state, cent, isView, flashOrigin, retailActive)
```

CG_AddPlayerWeapon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `isView` | `dynamic` | — |  |
| `flashOrigin` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L192)

<a id="function-function-mq3-client-cgame-weapons-addviewweapon-function-addviewweapon-state-cent-team-intermission-vieworg-viewangles-bobcycle-xyspeed-bobfracsin-landtime-landchange-retailactive-src-mq3-client-cgame-weapons-ml-283803604"></a>
### addViewWeapon

```ml
function addViewWeapon(state, cent, team, intermission, vieworg, viewangles, bobcycle, xyspeed, bobfracsin, landTime, landChange, retailActive)
```

CG_AddViewWeapon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `intermission` | `dynamic` | — |  |
| `vieworg` | `dynamic` | — |  |
| `viewangles` | `dynamic` | — |  |
| `bobcycle` | `dynamic` | — |  |
| `xyspeed` | `dynamic` | — |  |
| `bobfracsin` | `dynamic` | — |  |
| `landTime` | `dynamic` | — |  |
| `landChange` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L199)

<a id="function-function-mq3-client-cgame-weapons-addweaponwithpowerups-function-addweaponwithpowerups-state-weaponnum-entitynum-origin-powerups-model-retailactive-src-mq3-client-cgame-weapons-ml-687764569"></a>
### addWeaponWithPowerups

```ml
function addWeaponWithPowerups(state, weaponNum, entityNum, origin, powerups, model, retailActive)
```

CG_AddWeaponWithPowerups

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weaponNum` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `powerups` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L188)

<a id="function-function-mq3-client-cgame-weapons-audio-function-audio-state-kind-weaponnum-entitynum-origin-sound-retailactive-src-mq3-client-cgame-weapons-ml-768246064"></a>
### audio

```ml
function audio(state, kind, weaponNum, entityNum, origin, sound, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `weaponNum` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L78)

<a id="function-function-mq3-client-cgame-weapons-barrel-function-barrel-src-mq3-client-cgame-weapons-ml-863573614"></a>
### barrel

```ml
function barrel()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L61)

- [mq3.client.cgame_weapons.Barrel](Type-mq3-client-cgame-weapons-barrel-1504615164.md) — struct
- [mq3.client.cgame_weapons.Boundary](Type-mq3-client-cgame-weapons-boundary-1730375166.md) — struct
<a id="function-function-mq3-client-cgame-weapons-bullet-function-bullet-state-finish-sourceentitynum-normal-flesh-fleshentitynum-muzzle-sourcecontents-destcontents-viewright-viewup-retailactive-src-mq3-client-cgame-weapons-ml-62468498"></a>
### bullet

```ml
function bullet(state, finish, sourceEntityNum, normal, flesh, fleshEntityNum, muzzle, sourceContents, destContents, viewRight, viewUp, retailActive)
```

CG_Bullet

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `sourceEntityNum` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `flesh` | `dynamic` | — |  |
| `fleshEntityNum` | `dynamic` | — |  |
| `muzzle` | `dynamic` | — |  |
| `sourceContents` | `dynamic` | — |  |
| `destContents` | `dynamic` | — |  |
| `viewRight` | `dynamic` | — |  |
| `viewUp` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L268)

<a id="function-function-mq3-client-cgame-weapons-calcmuzzlepoint-function-calcmuzzlepoint-entitynum-localclient-localorigin-viewheight-viewangles-cent-src-mq3-client-cgame-weapons-ml-714686917"></a>
### calcMuzzlePoint

```ml
function calcMuzzlePoint(entityNum, localClient, localOrigin, viewheight, viewangles, cent)
```

CG_CalcMuzzlePoint

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityNum` | `dynamic` | — |  |
| `localClient` | `dynamic` | — |  |
| `localOrigin` | `dynamic` | — |  |
| `viewheight` | `dynamic` | — |  |
| `viewangles` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L264)

<a id="function-function-mq3-client-cgame-weapons-calculateweaponposition-function-calculateweaponposition-vieworg-viewangles-bobcycle-xyspeed-bobfracsin-time-landtime-landchange-src-mq3-client-cgame-weapons-ml-4829700"></a>
### calculateWeaponPosition

```ml
function calculateWeaponPosition(vieworg, viewangles, bobcycle, xyspeed, bobfracsin, time, landTime, landChange)
```

CG_CalculateWeaponPosition

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vieworg` | `dynamic` | — |  |
| `viewangles` | `dynamic` | — |  |
| `bobcycle` | `dynamic` | — |  |
| `xyspeed` | `dynamic` | — |  |
| `bobfracsin` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `landTime` | `dynamic` | — |  |
| `landChange` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L162)

<a id="function-function-mq3-client-cgame-weapons-clearactions-function-clearactions-state-src-mq3-client-cgame-weapons-ml-130032705"></a>
### clearActions

```ml
function clearActions(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L76)

<a id="constant-constant-mq3-client-cgame-weapons-coast-time-const-coast-time-1000-src-mq3-client-cgame-weapons-ml-43855258"></a>
### COAST_TIME

```ml
const COAST_TIME = 1000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L47)

<a id="constant-constant-mq3-client-cgame-weapons-contents-lava-const-contents-lava-8-src-mq3-client-cgame-weapons-ml-1154676541"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L40)

<a id="constant-constant-mq3-client-cgame-weapons-contents-slime-const-contents-slime-16-src-mq3-client-cgame-weapons-ml-1616652894"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L39)

<a id="constant-constant-mq3-client-cgame-weapons-contents-water-const-contents-water-32-src-mq3-client-cgame-weapons-ml-722619922"></a>
### CONTENTS_WATER

```ml
const CONTENTS_WATER = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L38)

<a id="function-function-mq3-client-cgame-weapons-copy3-function-copy3-v-src-mq3-client-cgame-weapons-ml-1902891204"></a>
### copy3

```ml
function copy3(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L59)

<a id="function-function-mq3-client-cgame-weapons-crandom-function-crandom-state-src-mq3-client-cgame-weapons-ml-289990973"></a>
### crandom

```ml
function crandom(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L71)

<a id="function-function-mq3-client-cgame-weapons-create-function-create-src-mq3-client-cgame-weapons-ml-48591090"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L64)

<a id="constant-constant-mq3-client-cgame-weapons-default-shotgun-count-const-default-shotgun-count-11-src-mq3-client-cgame-weapons-ml-1396717195"></a>
### DEFAULT_SHOTGUN_COUNT

```ml
const DEFAULT_SHOTGUN_COUNT = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L43)

<a id="constant-constant-mq3-client-cgame-weapons-default-shotgun-spread-const-default-shotgun-spread-700-src-mq3-client-cgame-weapons-ml-1445660374"></a>
### DEFAULT_SHOTGUN_SPREAD

```ml
const DEFAULT_SHOTGUN_SPREAD = 700
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L44)

<a id="function-function-mq3-client-cgame-weapons-drawweaponselect-function-drawweaponselect-state-names-retailactive-src-mq3-client-cgame-weapons-ml-1884068236"></a>
### drawWeaponSelect

```ml
function drawWeaponSelect(state, names, retailActive)
```

CG_DrawWeaponSelect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `names` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L204)

<a id="constant-constant-mq3-client-cgame-weapons-ef-firing-const-ef-firing-256-src-mq3-client-cgame-weapons-ml-1105802068"></a>
### EF_FIRING

```ml
const EF_FIRING = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L33)

<a id="function-function-mq3-client-cgame-weapons-emptyweapon-function-emptyweapon-number-src-mq3-client-cgame-weapons-ml-1843736731"></a>
### emptyWeapon

```ml
function emptyWeapon(number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L63)

<a id="function-function-mq3-client-cgame-weapons-entity-function-entity-number-src-mq3-client-cgame-weapons-ml-295136073"></a>
### entity

```ml
function entity(number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L62)

- [mq3.client.cgame_weapons.Entity](Type-mq3-client-cgame-weapons-entity-374169011.md) — struct
<a id="function-function-mq3-client-cgame-weapons-fireweapon-function-fireweapon-state-cent-retailactive-src-mq3-client-cgame-weapons-ml-1263124952"></a>
### fireWeapon

```ml
function fireWeapon(state, cent, retailActive)
```

CG_FireWeapon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L220)

<a id="function-function-mq3-client-cgame-weapons-grappletrail-function-grappletrail-state-cent-ownerorigin-ownerangles-hookorigin-retailactive-src-mq3-client-cgame-weapons-ml-1200897263"></a>
### grappleTrail

```ml
function grappleTrail(state, cent, ownerOrigin, ownerAngles, hookOrigin, retailActive)
```

CG_GrappleTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `ownerOrigin` | `dynamic` | — |  |
| `ownerAngles` | `dynamic` | — |  |
| `hookOrigin` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L123)

<a id="function-function-mq3-client-cgame-weapons-grenadetrail-function-grenadetrail-state-cent-start-finish-liquidboth-retailactive-src-mq3-client-cgame-weapons-ml-653994726"></a>
### grenadeTrail

```ml
function grenadeTrail(state, cent, start, finish, liquidBoth, retailActive)
```

CG_GrenadeTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `liquidBoth` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L127)

<a id="constant-constant-mq3-client-cgame-weapons-impactsound-default-const-impactsound-default-cgabi-impactsound-default-src-mq3-client-cgame-weapons-ml-17351340"></a>
### IMPACTSOUND_DEFAULT

```ml
const IMPACTSOUND_DEFAULT = cgabi.IMPACTSOUND_DEFAULT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L35)

<a id="constant-constant-mq3-client-cgame-weapons-impactsound-flesh-const-impactsound-flesh-cgabi-impactsound-flesh-src-mq3-client-cgame-weapons-ml-110726635"></a>
### IMPACTSOUND_FLESH

```ml
const IMPACTSOUND_FLESH = cgabi.IMPACTSOUND_FLESH
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L37)

<a id="constant-constant-mq3-client-cgame-weapons-impactsound-metal-const-impactsound-metal-cgabi-impactsound-metal-src-mq3-client-cgame-weapons-ml-1029883854"></a>
### IMPACTSOUND_METAL

```ml
const IMPACTSOUND_METAL = cgabi.IMPACTSOUND_METAL
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L36)

- [mq3.client.cgame_weapons.Item](Type-mq3-client-cgame-weapons-item-1225300951.md) — struct
<a id="constant-constant-mq3-client-cgame-weapons-land-deflect-time-const-land-deflect-time-cgabi-land-deflect-time-src-mq3-client-cgame-weapons-ml-1509987016"></a>
### LAND_DEFLECT_TIME

```ml
const LAND_DEFLECT_TIME = cgabi.LAND_DEFLECT_TIME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L48)

<a id="constant-constant-mq3-client-cgame-weapons-land-return-time-const-land-return-time-cgabi-land-return-time-src-mq3-client-cgame-weapons-ml-820339669"></a>
### LAND_RETURN_TIME

```ml
const LAND_RETURN_TIME = cgabi.LAND_RETURN_TIME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L49)

<a id="constant-constant-mq3-client-cgame-weapons-lightning-range-const-lightning-range-768-src-mq3-client-cgame-weapons-ml-527444606"></a>
### LIGHTNING_RANGE

```ml
const LIGHTNING_RANGE = 768
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L45)

<a id="function-function-mq3-client-cgame-weapons-lightningbolt-function-lightningbolt-state-cent-origin-viewangles-predictedclient-traceend-tracefraction-retailactive-src-mq3-client-cgame-weapons-ml-1572559395"></a>
### lightningBolt

```ml
function lightningBolt(state, cent, origin, viewAngles, predictedClient, traceEnd, traceFraction, retailActive)
```

CG_LightningBolt

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `viewAngles` | `dynamic` | — |  |
| `predictedClient` | `dynamic` | — |  |
| `traceEnd` | `dynamic` | — |  |
| `traceFraction` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L168)

<a id="function-function-mq3-client-cgame-weapons-machinegunejectbrass-function-machinegunejectbrass-state-cent-water-retailactive-src-mq3-client-cgame-weapons-ml-399881443"></a>
### machineGunEjectBrass

```ml
function machineGunEjectBrass(state, cent, water, retailActive)
```

CG_MachineGunEjectBrass

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `water` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L81)

<a id="function-function-mq3-client-cgame-weapons-machinegunspinangle-function-machinegunspinangle-state-cent-retailactive-src-mq3-client-cgame-weapons-ml-1924025160"></a>
### machinegunSpinAngle

```ml
function machinegunSpinAngle(state, cent, retailActive)
```

CG_MachinegunSpinAngle

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L175)

<a id="function-function-mq3-client-cgame-weapons-maptorsotoweaponframe-function-maptorsotoweaponframe-dropfirst-attackfirst-attack2first-frame-src-mq3-client-cgame-weapons-ml-283545126"></a>
### mapTorsoToWeaponFrame

```ml
function mapTorsoToWeaponFrame(dropFirst, attackFirst, attack2First, frame)
```

CG_MapTorsoToWeaponFrame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dropFirst` | `dynamic` | — |  |
| `attackFirst` | `dynamic` | — |  |
| `attack2First` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L158)

<a id="function-function-mq3-client-cgame-weapons-missilehitplayer-function-missilehitplayer-state-weaponnum-origin-dir-entitynum-retailactive-src-mq3-client-cgame-weapons-ml-1302621854"></a>
### missileHitPlayer

```ml
function missileHitPlayer(state, weaponNum, origin, dir, entityNum, retailActive)
```

CG_MissileHitPlayer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weaponNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L242)

<a id="function-function-mq3-client-cgame-weapons-missilehitwall-function-missilehitwall-state-weaponnum-clientnum-origin-dir-soundtype-clientcolor1-clientcolor2-retailactive-src-mq3-client-cgame-weapons-ml-479524218"></a>
### missileHitWall

```ml
function missileHitWall(state, weaponNum, clientNum, origin, dir, soundType, clientColor1, clientColor2, retailActive)
```

CG_MissileHitWall

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weaponNum` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |
| `soundType` | `dynamic` | — |  |
| `clientColor1` | `dynamic` | — |  |
| `clientColor2` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L225)

<a id="constant-constant-mq3-client-cgame-weapons-muzzle-flash-time-const-muzzle-flash-time-cgabi-muzzle-flash-time-src-mq3-client-cgame-weapons-ml-1903619391"></a>
### MUZZLE_FLASH_TIME

```ml
const MUZZLE_FLASH_TIME = cgabi.MUZZLE_FLASH_TIME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L50)

<a id="function-function-mq3-client-cgame-weapons-nailgunejectbrass-function-nailgunejectbrass-state-cent-retailactive-src-mq3-client-cgame-weapons-ml-1983647884"></a>
### nailgunEjectBrass

```ml
function nailgunEjectBrass(state, cent, retailActive)
```

CG_NailgunEjectBrass

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L94)

<a id="function-function-mq3-client-cgame-weapons-nailtrail-function-nailtrail-state-cent-start-finish-liquidboth-retailactive-src-mq3-client-cgame-weapons-ml-2139141742"></a>
### nailTrail

```ml
function nailTrail(state, cent, start, finish, liquidBoth, retailActive)
```

CG_NailTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `liquidBoth` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L117)

<a id="function-function-mq3-client-cgame-weapons-nextweapon-function-nextweapon-state-src-mq3-client-cgame-weapons-ml-1349033501"></a>
### nextWeapon

```ml
function nextWeapon(state)
```

CG_NextWeapon_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L211)

<a id="function-function-mq3-client-cgame-weapons-outofammochange-function-outofammochange-state-src-mq3-client-cgame-weapons-ml-959437411"></a>
### outOfAmmoChange

```ml
function outOfAmmoChange(state)
```

CG_OutOfAmmoChange

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L217)

<a id="function-function-mq3-client-cgame-weapons-plasmatrail-function-plasmatrail-state-cent-origin-water-flashcolor-retailactive-src-mq3-client-cgame-weapons-ml-484366402"></a>
### plasmaTrail

```ml
function plasmaTrail(state, cent, origin, water, flashColor, retailActive)
```

CG_PlasmaTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `water` | `dynamic` | — |  |
| `flashColor` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L119)

<a id="constant-constant-mq3-client-cgame-weapons-pmf-follow-const-pmf-follow-4096-src-mq3-client-cgame-weapons-ml-1235356282"></a>
### PMF_FOLLOW

```ml
const PMF_FOLLOW = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L34)

<a id="function-function-mq3-client-cgame-weapons-prevweapon-function-prevweapon-state-src-mq3-client-cgame-weapons-ml-1419264477"></a>
### prevWeapon

```ml
function prevWeapon(state)
```

CG_PrevWeapon_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L213)

<a id="function-function-mq3-client-cgame-weapons-profile-function-profile-number-src-mq3-client-cgame-weapons-ml-1261875707"></a>
### profile

```ml
function profile(number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L129)

<a id="constant-constant-mq3-client-cgame-weapons-pw-battlesuit-const-pw-battlesuit-2-src-mq3-client-cgame-weapons-ml-804227703"></a>
### PW_BATTLESUIT

```ml
const PW_BATTLESUIT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L31)

<a id="constant-constant-mq3-client-cgame-weapons-pw-invis-const-pw-invis-4-src-mq3-client-cgame-weapons-ml-1511569417"></a>
### PW_INVIS

```ml
const PW_INVIS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L32)

<a id="constant-constant-mq3-client-cgame-weapons-pw-quad-const-pw-quad-1-src-mq3-client-cgame-weapons-ml-1753457290"></a>
### PW_QUAD

```ml
const PW_QUAD = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L30)

<a id="function-function-mq3-client-cgame-weapons-railtrail-function-railtrail-state-color1-color2-start-finish-retailactive-src-mq3-client-cgame-weapons-ml-2121265436"></a>
### railTrail

```ml
function railTrail(state, color1, color2, start, finish, retailActive)
```

CG_RailTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `color1` | `dynamic` | — |  |
| `color2` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L99)

<a id="function-function-mq3-client-cgame-weapons-randint-function-randint-state-src-mq3-client-cgame-weapons-ml-52338425"></a>
### randInt

```ml
function randInt(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L69)

<a id="function-function-mq3-client-cgame-weapons-randomfloat-function-randomfloat-state-src-mq3-client-cgame-weapons-ml-190823191"></a>
### randomFloat

```ml
function randomFloat(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L70)

<a id="function-function-mq3-client-cgame-weapons-registeritemvisuals-function-registeritemvisuals-state-itemnum-retailactive-src-mq3-client-cgame-weapons-ml-1963240469"></a>
### registerItemVisuals

```ml
function registerItemVisuals(state, itemNum, retailActive)
```

CG_RegisterItemVisuals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `itemNum` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L153)

<a id="function-function-mq3-client-cgame-weapons-registerweapon-function-registerweapon-state-weaponnum-item-retailactive-src-mq3-client-cgame-weapons-ml-1077995945"></a>
### registerWeapon

```ml
function registerWeapon(state, weaponNum, item, retailActive)
```

CG_RegisterWeapon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weaponNum` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L148)

<a id="function-function-mq3-client-cgame-weapons-rockettrail-function-rockettrail-state-cent-start-finish-liquidboth-retailactive-src-mq3-client-cgame-weapons-ml-793696834"></a>
### rocketTrail

```ml
function rocketTrail(state, cent, start, finish, liquidBoth, retailActive)
```

CG_RocketTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `liquidBoth` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L115)

<a id="function-function-mq3-client-cgame-weapons-selectweapon-function-selectweapon-state-num-src-mq3-client-cgame-weapons-ml-1150040483"></a>
### selectWeapon

```ml
function selectWeapon(state, num)
```

CG_Weapon_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L215)

<a id="function-function-mq3-client-cgame-weapons-setrandomints-function-setrandomints-state-values-src-mq3-client-cgame-weapons-ml-784505705"></a>
### setRandomInts

```ml
function setRandomInts(state, values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L68)

<a id="function-function-mq3-client-cgame-weapons-shotgunejectbrass-function-shotgunejectbrass-state-cent-water-retailactive-src-mq3-client-cgame-weapons-ml-1032566811"></a>
### shotgunEjectBrass

```ml
function shotgunEjectBrass(state, cent, water, retailActive)
```

CG_ShotgunEjectBrass

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `water` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L88)

<a id="function-function-mq3-client-cgame-weapons-shotgunfire-function-shotgunfire-state-origin-direction-seed-otherentnum-water-ragepro-retailactive-src-mq3-client-cgame-weapons-ml-1077952368"></a>
### shotgunFire

```ml
function shotgunFire(state, origin, direction, seed, otherEntNum, water, ragePro, retailActive)
```

CG_ShotgunFire

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `seed` | `dynamic` | — |  |
| `otherEntNum` | `dynamic` | — |  |
| `water` | `dynamic` | — |  |
| `ragePro` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L255)

<a id="function-function-mq3-client-cgame-weapons-shotgunpattern-function-shotgunpattern-state-origin-direction-seed-otherentnum-retailactive-src-mq3-client-cgame-weapons-ml-688322683"></a>
### shotgunPattern

```ml
function shotgunPattern(state, origin, direction, seed, otherEntNum, retailActive)
```

CG_ShotgunPattern

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `seed` | `dynamic` | — |  |
| `otherEntNum` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L251)

<a id="function-function-mq3-client-cgame-weapons-shotgunpellet-function-shotgunpellet-state-start-finish-skipnum-sourcecontents-destcontents-hitposition-normal-surfaceflags-hitplayer-hitentity-retailactive-src-mq3-client-cgame-weapons-ml-1785700770"></a>
### shotgunPellet

```ml
function shotgunPellet(state, start, finish, skipNum, sourceContents, destContents, hitPosition, normal, surfaceFlags, hitPlayer, hitEntity, retailActive)
```

CG_ShotgunPellet

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `skipNum` | `dynamic` | — |  |
| `sourceContents` | `dynamic` | — |  |
| `destContents` | `dynamic` | — |  |
| `hitPosition` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `surfaceFlags` | `dynamic` | — |  |
| `hitPlayer` | `dynamic` | — |  |
| `hitEntity` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L247)

<a id="function-function-mq3-client-cgame-weapons-smoketrail-function-smoketrail-state-kind-cent-start-finish-trailradius-trailtime-liquidboth-shader-retailactive-src-mq3-client-cgame-weapons-ml-898939106"></a>
### smokeTrail

```ml
function smokeTrail(state, kind, cent, start, finish, trailRadius, trailTime, liquidBoth, shader, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `trailRadius` | `dynamic` | — |  |
| `trailTime` | `dynamic` | — |  |
| `liquidBoth` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L109)

<a id="function-function-mq3-client-cgame-weapons-spawnrailtrail-function-spawnrailtrail-state-cent-origin-color1-color2-retailactive-src-mq3-client-cgame-weapons-ml-2047645269"></a>
### spawnRailTrail

```ml
function spawnRailTrail(state, cent, origin, color1, color2, retailActive)
```

CG_SpawnRailTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `color1` | `dynamic` | — |  |
| `color2` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L173)

<a id="constant-constant-mq3-client-cgame-weapons-spin-speed-const-spin-speed-0-9-src-mq3-client-cgame-weapons-ml-1583319070"></a>
### SPIN_SPEED

```ml
const SPIN_SPEED = 0.9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L46)

- [mq3.client.cgame_weapons.State](Type-mq3-client-cgame-weapons-state-1824474221.md) — struct
<a id="function-function-mq3-client-cgame-weapons-strike-function-strike-state-weaponnum-origin-dir-retailactive-src-mq3-client-cgame-weapons-ml-487706345"></a>
### strike

```ml
function strike(state, weaponNum, origin, dir, retailActive)
```

Inventory scanner also reports the local identifiers `strike` and `weapon`. Keep stable semantic aliases so all 35 ledger candidates have a native target. strike

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weaponNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L275)

<a id="constant-constant-mq3-client-cgame-weapons-surf-metalsteps-const-surf-metalsteps-4096-src-mq3-client-cgame-weapons-ml-985043738"></a>
### SURF_METALSTEPS

```ml
const SURF_METALSTEPS = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L42)

<a id="constant-constant-mq3-client-cgame-weapons-surf-noimpact-const-surf-noimpact-16-src-mq3-client-cgame-weapons-ml-2037278366"></a>
### SURF_NOIMPACT

```ml
const SURF_NOIMPACT = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L41)

<a id="function-function-mq3-client-cgame-weapons-tracer-function-tracer-state-source-dest-viewright-viewup-retailactive-src-mq3-client-cgame-weapons-ml-1824235650"></a>
### tracer

```ml
function tracer(state, source, dest, viewRight, viewUp, retailActive)
```

CG_Tracer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `dest` | `dynamic` | — |  |
| `viewRight` | `dynamic` | — |  |
| `viewUp` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L260)

<a id="function-function-mq3-client-cgame-weapons-visual-function-visual-state-kind-weaponnum-entitynum-origin-finish-model-shader-radius-value-retailactive-src-mq3-client-cgame-weapons-ml-1901050397"></a>
### visual

```ml
function visual(state, kind, weaponNum, entityNum, origin, finish, model, shader, radius, value, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `weaponNum` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L77)

<a id="function-function-mq3-client-cgame-weapons-weapon-function-weapon-state-weaponnum-src-mq3-client-cgame-weapons-ml-137420851"></a>
### weapon

```ml
function weapon(state, weaponNum)
```

weapon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weaponNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L277)

- [mq3.client.cgame_weapons.WeaponInfo](Type-mq3-client-cgame-weapons-weaponinfo-2140386880.md) — struct
<a id="function-function-mq3-client-cgame-weapons-weaponselectable-function-weaponselectable-state-i-src-mq3-client-cgame-weapons-ml-1785854166"></a>
### weaponSelectable

```ml
function weaponSelectable(state, i)
```

CG_WeaponSelectable

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `i` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L209)

<a id="constant-constant-mq3-client-cgame-weapons-wp-bfg-const-wp-bfg-9-src-mq3-client-cgame-weapons-ml-1610984378"></a>
### WP_BFG

```ml
const WP_BFG = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L24)

<a id="constant-constant-mq3-client-cgame-weapons-wp-chaingun-const-wp-chaingun-13-src-mq3-client-cgame-weapons-ml-1202957541"></a>
### WP_CHAINGUN

```ml
const WP_CHAINGUN = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L28)

<a id="constant-constant-mq3-client-cgame-weapons-wp-gauntlet-const-wp-gauntlet-1-src-mq3-client-cgame-weapons-ml-1454888254"></a>
### WP_GAUNTLET

```ml
const WP_GAUNTLET = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L16)

<a id="constant-constant-mq3-client-cgame-weapons-wp-grappling-hook-const-wp-grappling-hook-10-src-mq3-client-cgame-weapons-ml-327648888"></a>
### WP_GRAPPLING_HOOK

```ml
const WP_GRAPPLING_HOOK = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L25)

<a id="constant-constant-mq3-client-cgame-weapons-wp-grenade-launcher-const-wp-grenade-launcher-4-src-mq3-client-cgame-weapons-ml-1072088997"></a>
### WP_GRENADE_LAUNCHER

```ml
const WP_GRENADE_LAUNCHER = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L19)

<a id="constant-constant-mq3-client-cgame-weapons-wp-lightning-const-wp-lightning-6-src-mq3-client-cgame-weapons-ml-1210602221"></a>
### WP_LIGHTNING

```ml
const WP_LIGHTNING = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L21)

<a id="constant-constant-mq3-client-cgame-weapons-wp-machinegun-const-wp-machinegun-2-src-mq3-client-cgame-weapons-ml-1706454231"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L17)

<a id="constant-constant-mq3-client-cgame-weapons-wp-nailgun-const-wp-nailgun-11-src-mq3-client-cgame-weapons-ml-1797525633"></a>
### WP_NAILGUN

```ml
const WP_NAILGUN = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L26)

<a id="constant-constant-mq3-client-cgame-weapons-wp-none-const-wp-none-0-src-mq3-client-cgame-weapons-ml-117773601"></a>
### WP_NONE

```ml
const WP_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L15)

<a id="constant-constant-mq3-client-cgame-weapons-wp-num-weapons-const-wp-num-weapons-14-src-mq3-client-cgame-weapons-ml-323321842"></a>
### WP_NUM_WEAPONS

```ml
const WP_NUM_WEAPONS = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L29)

<a id="constant-constant-mq3-client-cgame-weapons-wp-plasmagun-const-wp-plasmagun-8-src-mq3-client-cgame-weapons-ml-1729874499"></a>
### WP_PLASMAGUN

```ml
const WP_PLASMAGUN = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L23)

<a id="constant-constant-mq3-client-cgame-weapons-wp-prox-launcher-const-wp-prox-launcher-12-src-mq3-client-cgame-weapons-ml-1490065064"></a>
### WP_PROX_LAUNCHER

```ml
const WP_PROX_LAUNCHER = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L27)

<a id="constant-constant-mq3-client-cgame-weapons-wp-railgun-const-wp-railgun-7-src-mq3-client-cgame-weapons-ml-1509201722"></a>
### WP_RAILGUN

```ml
const WP_RAILGUN = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L22)

<a id="constant-constant-mq3-client-cgame-weapons-wp-rocket-launcher-const-wp-rocket-launcher-5-src-mq3-client-cgame-weapons-ml-1466088902"></a>
### WP_ROCKET_LAUNCHER

```ml
const WP_ROCKET_LAUNCHER = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L20)

<a id="constant-constant-mq3-client-cgame-weapons-wp-shotgun-const-wp-shotgun-3-src-mq3-client-cgame-weapons-ml-796863726"></a>
### WP_SHOTGUN

```ml
const WP_SHOTGUN = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L18)

<a id="function-function-mq3-client-cgame-weapons-zero3-function-zero3-src-mq3-client-cgame-weapons-ml-835998288"></a>
### zero3

```ml
function zero3()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L60)
