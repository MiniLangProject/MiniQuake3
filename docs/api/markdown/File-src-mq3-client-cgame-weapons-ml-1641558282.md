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

Appends a client game weapons action record to the queued engine requests.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `state.actions`, `state.emitted`, `state.suppressed`. |
| `boundaryName` | `dynamic` | — | Value used by `v=Boundary(boundaryName,kind,weaponNum,entityNum,copy3(origin),copy3(finish),copy3(velocity),model,shader,sound,radius,light,color,value,not r...`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `weaponNum` | `dynamic` | — | Quake III weapon identifier. |
| `entityNum` | `dynamic` | — | Entity number identifying a world or player entity. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `finish` | `dynamic` | — | Value used by `v=Boundary(boundaryName,kind,weaponNum,entityNum,copy3(origin),copy3(finish),copy3(velocity),model,shader,sound,radius,light,color,value,not r...`. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this client game weapons operation. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `sound` | `dynamic` | — | Sound handle or asset name passed to the audio action. |
| `radius` | `dynamic` | — | Radius used by the spatial or visual calculation. |
| `light` | `dynamic` | — | Value used by `v=Boundary(boundaryName,kind,weaponNum,entityNum,copy3(origin),copy3(finish),copy3(velocity),model,shader,sound,radius,light,color,value,not r...`. |
| `color` | `dynamic` | — | Color value used by the client game weapons drawing or interpolation operation. |
| `value` | `dynamic` | — | Value used by `v=Boundary(boundaryName,kind,weaponNum,entityNum,copy3(origin),copy3(finish),copy3(velocity),model,shader,sound,radius,light,color,value,not r...`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L385)

<a id="function-function-mq3-client-cgame-weapons-addplayerweapon-function-addplayerweapon-state-cent-isview-flashorigin-retailactive-src-mq3-client-cgame-weapons-ml-1866418275"></a>
### addPlayerWeapon

```ml
function addPlayerWeapon(state, cent, isView, flashOrigin, retailActive)
```

CG_AddPlayerWeapon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.weapons`, `state.time`. |
| `cent` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `cent.lightningFiring`. |
| `isView` | `dynamic` | — | Value used by `if not isView then if (cent.eFlags&EF_FIRING)!=0 and w.firingSound!="" then result=result+[audio(state,"weapon-loop",cent.weapon,cent.number,c...`. |
| `flashOrigin` | `dynamic` | — | Value used by `if w.flashModel!="" then result=result+[visual(state,"muzzle-flash",cent.weapon,cent.number,flashOrigin,flashOrigin,w.flashModel,"",0.0,0,reta...`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L635)

<a id="function-function-mq3-client-cgame-weapons-addviewweapon-function-addviewweapon-state-cent-team-intermission-vieworg-viewangles-bobcycle-xyspeed-bobfracsin-landtime-landchange-retailactive-src-mq3-client-cgame-weapons-ml-283803604"></a>
### addViewWeapon

```ml
function addViewWeapon(state, cent, team, intermission, vieworg, viewangles, bobcycle, xyspeed, bobfracsin, landTime, landChange, retailActive)
```

CG_AddViewWeapon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.renderingThirdPerson`, `state.testGun`, `state.drawGun`, `state.time` and additional values. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.eFlags`, `cent.number`. |
| `team` | `dynamic` | — | Value used by `if team==3 or intermission or state.renderingThirdPerson or state.testGun then return [] end if`. |
| `intermission` | `dynamic` | — | Value used by `if team==3 or intermission or state.renderingThirdPerson or state.testGun then return [] end if`. |
| `vieworg` | `dynamic` | — | Value used by `if not state.drawGun then if (cent.eFlags&EF_FIRING)!=0 then return lightningBolt(state,cent,q.VectorMA(vieworg,-8.0,q.AngleVectors(viewangles...`. |
| `viewangles` | `dynamic` | — | Value used by `if not state.drawGun then if (cent.eFlags&EF_FIRING)!=0 then return lightningBolt(state,cent,q.VectorMA(vieworg,-8.0,q.AngleVectors(viewangles...`. |
| `bobcycle` | `dynamic` | — | Value used by `position=calculateWeaponPosition(vieworg,viewangles,bobcycle,xyspeed,bobfracsin,state.time,landTime,landChange)`. |
| `xyspeed` | `dynamic` | — | Value used by `position=calculateWeaponPosition(vieworg,viewangles,bobcycle,xyspeed,bobfracsin,state.time,landTime,landChange)`. |
| `bobfracsin` | `dynamic` | — | Value used by `position=calculateWeaponPosition(vieworg,viewangles,bobcycle,xyspeed,bobfracsin,state.time,landTime,landChange)`. |
| `landTime` | `dynamic` | — | Value used by `position=calculateWeaponPosition(vieworg,viewangles,bobcycle,xyspeed,bobfracsin,state.time,landTime,landChange)`. |
| `landChange` | `dynamic` | — | Value used by `position=calculateWeaponPosition(vieworg,viewangles,bobcycle,xyspeed,bobfracsin,state.time,landTime,landChange)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L654)

<a id="function-function-mq3-client-cgame-weapons-addweaponwithpowerups-function-addweaponwithpowerups-state-weaponnum-entitynum-origin-powerups-model-retailactive-src-mq3-client-cgame-weapons-ml-687764569"></a>
### addWeaponWithPowerups

```ml
function addWeaponWithPowerups(state, weaponNum, entityNum, origin, powerups, model, retailActive)
```

CG_AddWeaponWithPowerups

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game weapons state passed to the helper calls in `addWeaponWithPowerups`. |
| `weaponNum` | `dynamic` | — | Quake III weapon identifier. |
| `entityNum` | `dynamic` | — | Entity number identifying a world or player entity. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `powerups` | `dynamic` | — | Value used by `if (powerups&(1<<PW_INVIS))!=0 then result=result+[visual(state,"weapon-invisibility",weaponNum,entityNum,origin,origin,model,"invis",0.0,0,re...`. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this client game weapons operation. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L626)

<a id="function-function-mq3-client-cgame-weapons-audio-function-audio-state-kind-weaponnum-entitynum-origin-sound-retailactive-src-mq3-client-cgame-weapons-ml-768246064"></a>
### audio

```ml
function audio(state, kind, weaponNum, entityNum, origin, sound, retailActive)
```

Adapts `mq3.client.cgame_weapons.action` to client game weapons `audio`, returning its result for `state, "audio", kind, weaponNum, entityNum, origin, origin, zero3(), "", "", sound, 0.0, 0.0, [1.0,1.0,1.0], 0, retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_weapons.action`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_weapons.action`. |
| `weaponNum` | `dynamic` | — | Quake III weapon identifier. Forwarded to `mq3.client.cgame_weapons.action`. |
| `entityNum` | `dynamic` | — | Entity number identifying a world or player entity. Forwarded to `mq3.client.cgame_weapons.action`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_weapons.action`. |
| `sound` | `dynamic` | — | Argument 11 of `mq3.client.cgame_weapons.action`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_weapons.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L413)

<a id="function-function-mq3-client-cgame-weapons-barrel-function-barrel-src-mq3-client-cgame-weapons-ml-863573614"></a>
### barrel

```ml
function barrel()
```

Creates a `mq3.client.cgame_weapons.Barrel` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L343)

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
| `state` | `dynamic` | — | Record read through `state.tracerChance`. |
| `finish` | `dynamic` | — | Value used by `if sourceEntityNum>=0 and state.tracerChance>0.0 and muzzle!=void then if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0...`. |
| `sourceEntityNum` | `dynamic` | — | Value used by `if sourceEntityNum>=0 and state.tracerChance>0.0 and muzzle!=void then if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0...`. |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |
| `flesh` | `dynamic` | — | Value used by `if flesh then return result+[visual(state,"bleed",WP_MACHINEGUN,fleshEntityNum,finish,normal,"","bloodExplosion",24.0,0,retailActive)] end if`. |
| `fleshEntityNum` | `dynamic` | — | Value used by `if flesh then return result+[visual(state,"bleed",WP_MACHINEGUN,fleshEntityNum,finish,normal,"","bloodExplosion",24.0,0,retailActive)] end if`. |
| `muzzle` | `dynamic` | — | Value used by `if sourceEntityNum>=0 and state.tracerChance>0.0 and muzzle!=void then if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0...`. |
| `sourceContents` | `dynamic` | — | Value used by `if sourceEntityNum>=0 and state.tracerChance>0.0 and muzzle!=void then if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0...`. |
| `destContents` | `dynamic` | — | Value used by `if sourceEntityNum>=0 and state.tracerChance>0.0 and muzzle!=void then if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0...`. |
| `viewRight` | `dynamic` | — | Value used by `if randomFloat(state)<state.tracerChance then result=result+tracer(state,muzzle,finish,viewRight,viewUp,retailActive) end if end if`. |
| `viewUp` | `dynamic` | — | Value used by `if randomFloat(state)<state.tracerChance then result=result+tracer(state,muzzle,finish,viewRight,viewUp,retailActive) end if end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L801)

<a id="function-function-mq3-client-cgame-weapons-calcmuzzlepoint-function-calcmuzzlepoint-entitynum-localclient-localorigin-viewheight-viewangles-cent-src-mq3-client-cgame-weapons-ml-714686917"></a>
### calcMuzzlePoint

```ml
function calcMuzzlePoint(entityNum, localClient, localOrigin, viewheight, viewangles, cent)
```

CG_CalcMuzzlePoint

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityNum` | `dynamic` | — | Entity number identifying a world or player entity. |
| `localClient` | `dynamic` | — | Value used by `if entityNum==localClient then muzzle=[localOrigin[0],localOrigin[1],localOrigin[2]+viewheight]`. |
| `localOrigin` | `dynamic` | — | Sequence read at `localOrigin[0]`, `localOrigin[1]`, `localOrigin[2]`. |
| `viewheight` | `dynamic` | — | Value used by `if entityNum==localClient then muzzle=[localOrigin[0],localOrigin[1],localOrigin[2]+viewheight]`. |
| `viewangles` | `dynamic` | — | Value used by `return q.VectorMA(muzzle,14.0,q.AngleVectors(viewangles)[0]) end if`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.currentValid`, `cent.origin`, `cent.legsAnim`, `cent.angles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L785)

<a id="function-function-mq3-client-cgame-weapons-calculateweaponposition-function-calculateweaponposition-vieworg-viewangles-bobcycle-xyspeed-bobfracsin-time-landtime-landchange-src-mq3-client-cgame-weapons-ml-4829700"></a>
### calculateWeaponPosition

```ml
function calculateWeaponPosition(vieworg, viewangles, bobcycle, xyspeed, bobfracsin, time, landTime, landChange)
```

CG_CalculateWeaponPosition

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vieworg` | `dynamic` | — | Value used by `origin=copy3(vieworg)`. |
| `viewangles` | `dynamic` | — | Value used by `angles=copy3(viewangles)`. |
| `bobcycle` | `dynamic` | — | Value used by `if (bobcycle&1)!=0 then scale= -xyspeed end if`. |
| `xyspeed` | `dynamic` | — | Value used by `scale=xyspeed`. |
| `bobfracsin` | `dynamic` | — | Value used by `angles[2]=angles[2]+scale*bobfracsin*0.005`. |
| `time` | `dynamic` | — | Value used by `delta=time-landTime`. |
| `landTime` | `dynamic` | — | Value used by `delta=time-landTime`. |
| `landChange` | `dynamic` | — | Value used by `if delta<LAND_DEFLECT_TIME then origin[2]=origin[2]+landChange*0.25*delta/LAND_DEFLECT_TIME else if delta<LAND_DEFLECT_TIME+LAND_RETURN_TIME t...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L576)

<a id="function-function-mq3-client-cgame-weapons-clearactions-function-clearactions-state-src-mq3-client-cgame-weapons-ml-130032705"></a>
### clearActions

```ml
function clearActions(state)
```

Updates `state.actions`, `state.emitted`, `state.suppressed` during client game weapons `clearActions`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `state.actions`, `state.emitted`, `state.suppressed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L391)

<a id="constant-constant-mq3-client-cgame-weapons-coast-time-const-coast-time-1000-src-mq3-client-cgame-weapons-ml-43855258"></a>
### COAST_TIME

```ml
const COAST_TIME = 1000
```

Duration in milliseconds over which the weapon barrel coasts after firing stops.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L82)

<a id="constant-constant-mq3-client-cgame-weapons-contents-lava-const-contents-lava-8-src-mq3-client-cgame-weapons-ml-1154676541"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = 8
```

Collision-content bit identifying lava volumes or surfaces during client traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L66)

<a id="constant-constant-mq3-client-cgame-weapons-contents-slime-const-contents-slime-16-src-mq3-client-cgame-weapons-ml-1616652894"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = 16
```

Collision-content bit identifying slime volumes or surfaces during client traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L64)

<a id="constant-constant-mq3-client-cgame-weapons-contents-water-const-contents-water-32-src-mq3-client-cgame-weapons-ml-722619922"></a>
### CONTENTS_WATER

```ml
const CONTENTS_WATER = 32
```

Collision-content bit identifying water volumes or surfaces during client traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L62)

<a id="function-function-mq3-client-cgame-weapons-copy3-function-copy3-v-src-mq3-client-cgame-weapons-ml-1902891204"></a>
### copy3

```ml
function copy3(v)
```

Copies the X, Y and Z components into a fresh client game weapons vector.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Sequence read at `v[0]`, `v[1]`, `v[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L339)

<a id="function-function-mq3-client-cgame-weapons-crandom-function-crandom-state-src-mq3-client-cgame-weapons-ml-289990973"></a>
### crandom

```ml
function crandom(state)
```

Adapts `mq3.compat.numeric.fsub` to client game weapons `crandom`, returning its result for `n.fmul(2.0,randomFloat(state)), 1.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.compat.numeric.fsub`; passed as `n.fmul(2.0,randomFloat(state))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L367)

<a id="function-function-mq3-client-cgame-weapons-create-function-create-src-mq3-client-cgame-weapons-ml-48591090"></a>
### create

```ml
function create()
```

Calls `mq3.client.cgame_weapons.emptyWeapon`, `mq3.client.cgame_weapons.State`, `mq3.shared.math.RandomState` from client game weapons `create`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L351)

<a id="constant-constant-mq3-client-cgame-weapons-default-shotgun-count-const-default-shotgun-count-11-src-mq3-client-cgame-weapons-ml-1396717195"></a>
### DEFAULT_SHOTGUN_COUNT

```ml
const DEFAULT_SHOTGUN_COUNT = 11
```

Fallback shotgun count setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L73)

<a id="constant-constant-mq3-client-cgame-weapons-default-shotgun-spread-const-default-shotgun-spread-700-src-mq3-client-cgame-weapons-ml-1445660374"></a>
### DEFAULT_SHOTGUN_SPREAD

```ml
const DEFAULT_SHOTGUN_SPREAD = 700
```

Fallback shotgun spread setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L76)

<a id="function-function-mq3-client-cgame-weapons-drawweaponselect-function-drawweaponselect-state-names-retailactive-src-mq3-client-cgame-weapons-ml-1884068236"></a>
### drawWeaponSelect

```ml
function drawWeaponSelect(state, names, retailActive)
```

CG_DrawWeaponSelect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `state.itemPickupTime`. |
| `names` | `dynamic` | — | Sequence read at `names[state.weaponSelect]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L662)

<a id="constant-constant-mq3-client-cgame-weapons-ef-firing-const-ef-firing-256-src-mq3-client-cgame-weapons-ml-1105802068"></a>
### EF_FIRING

```ml
const EF_FIRING = 256
```

Entity-state flag selecting firing behavior in client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L52)

<a id="function-function-mq3-client-cgame-weapons-emptyweapon-function-emptyweapon-number-src-mq3-client-cgame-weapons-ml-1843736731"></a>
### emptyWeapon

```ml
function emptyWeapon(number)
```

Creates a `mq3.client.cgame_weapons.WeaponInfo` record. Assigns `number` from `number`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Value used to initialize `WeaponInfo.number`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L349)

<a id="function-function-mq3-client-cgame-weapons-entity-function-entity-number-src-mq3-client-cgame-weapons-ml-295136073"></a>
### entity

```ml
function entity(number)
```

Creates a `mq3.client.cgame_weapons.Entity` record. Assigns `number` from `number`, `clientNum` from `number`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Value used to initialize `Entity.number`, `Entity.clientNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L346)

- [mq3.client.cgame_weapons.Entity](Type-mq3-client-cgame-weapons-entity-374169011.md) — struct
<a id="function-function-mq3-client-cgame-weapons-fireweapon-function-fireweapon-state-cent-retailactive-src-mq3-client-cgame-weapons-ml-1263124952"></a>
### fireWeapon

```ml
function fireWeapon(state, cent, retailActive)
```

CG_FireWeapon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `state.weapons[cent.weapon]`. |
| `cent` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `cent.muzzleFlashTime`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L688)

<a id="function-function-mq3-client-cgame-weapons-grappletrail-function-grappletrail-state-cent-ownerorigin-ownerangles-hookorigin-retailactive-src-mq3-client-cgame-weapons-ml-1200897263"></a>
### grappleTrail

```ml
function grappleTrail(state, cent, ownerOrigin, ownerAngles, hookOrigin, retailActive)
```

CG_GrappleTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `cent` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `cent.trailTime`. |
| `ownerOrigin` | `dynamic` | — | Sequence read at `ownerOrigin[0]`, `ownerOrigin[1]`, `ownerOrigin[2]`. |
| `ownerAngles` | `dynamic` | — | Value used by `up=q.AngleVectors(ownerAngles)[2]`. |
| `hookOrigin` | `dynamic` | — | Sequence read at `hookOrigin[0]`, `hookOrigin[1]`, `hookOrigin[2]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L510)

<a id="function-function-mq3-client-cgame-weapons-grenadetrail-function-grenadetrail-state-cent-start-finish-liquidboth-retailactive-src-mq3-client-cgame-weapons-ml-653994726"></a>
### grenadeTrail

```ml
function grenadeTrail(state, cent, start, finish, liquidBoth, retailActive)
```

CG_GrenadeTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_weapons.smokeTrail`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_weapons.smokeTrail`. |
| `start` | `dynamic` | — | Argument 4 of `mq3.client.cgame_weapons.smokeTrail`. |
| `finish` | `dynamic` | — | Argument 5 of `mq3.client.cgame_weapons.smokeTrail`. |
| `liquidBoth` | `dynamic` | — | Argument 8 of `mq3.client.cgame_weapons.smokeTrail`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_weapons.smokeTrail`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L520)

<a id="constant-constant-mq3-client-cgame-weapons-impactsound-default-const-impactsound-default-cgabi-impactsound-default-src-mq3-client-cgame-weapons-ml-17351340"></a>
### IMPACTSOUND_DEFAULT

```ml
const IMPACTSOUND_DEFAULT = cgabi.IMPACTSOUND_DEFAULT
```

Weapon-impact sound category selecting default surface feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L56)

<a id="constant-constant-mq3-client-cgame-weapons-impactsound-flesh-const-impactsound-flesh-cgabi-impactsound-flesh-src-mq3-client-cgame-weapons-ml-110726635"></a>
### IMPACTSOUND_FLESH

```ml
const IMPACTSOUND_FLESH = cgabi.IMPACTSOUND_FLESH
```

Weapon-impact sound category selecting flesh surface feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L60)

<a id="constant-constant-mq3-client-cgame-weapons-impactsound-metal-const-impactsound-metal-cgabi-impactsound-metal-src-mq3-client-cgame-weapons-ml-1029883854"></a>
### IMPACTSOUND_METAL

```ml
const IMPACTSOUND_METAL = cgabi.IMPACTSOUND_METAL
```

Weapon-impact sound category selecting metal surface feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L58)

- [mq3.client.cgame_weapons.Item](Type-mq3-client-cgame-weapons-item-1225300951.md) — struct
<a id="constant-constant-mq3-client-cgame-weapons-land-deflect-time-const-land-deflect-time-cgabi-land-deflect-time-src-mq3-client-cgame-weapons-ml-1509987016"></a>
### LAND_DEFLECT_TIME

```ml
const LAND_DEFLECT_TIME = cgabi.LAND_DEFLECT_TIME
```

Milliseconds spent moving the view during the initial landing kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L84)

<a id="constant-constant-mq3-client-cgame-weapons-land-return-time-const-land-return-time-cgabi-land-return-time-src-mq3-client-cgame-weapons-ml-820339669"></a>
### LAND_RETURN_TIME

```ml
const LAND_RETURN_TIME = cgabi.LAND_RETURN_TIME
```

Milliseconds spent restoring the view after the landing kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L86)

<a id="constant-constant-mq3-client-cgame-weapons-lightning-range-const-lightning-range-768-src-mq3-client-cgame-weapons-ml-527444606"></a>
### LIGHTNING_RANGE

```ml
const LIGHTNING_RANGE = 768
```

Maximum world-space length of the lightning-gun beam trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L78)

<a id="function-function-mq3-client-cgame-weapons-lightningbolt-function-lightningbolt-state-cent-origin-viewangles-predictedclient-traceend-tracefraction-retailactive-src-mq3-client-cgame-weapons-ml-1572559395"></a>
### lightningBolt

```ml
function lightningBolt(state, cent, origin, viewAngles, predictedClient, traceEnd, traceFraction, retailActive)
```

CG_LightningBolt

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.trueLightning`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.weapon`, `cent.angles`, `cent.number`, `cent.origin`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `viewAngles` | `dynamic` | — | Sequence read at `viewAngles[i]`. |
| `predictedClient` | `dynamic` | — | Value used by `if cent.number==predictedClient and state.trueLightning!=0.0 then for i=0 to 2 diff=cent.angles[i]-viewAngles[i]`. |
| `traceEnd` | `dynamic` | — | Value used by `finish=traceEnd`. |
| `traceFraction` | `dynamic` | — | Value used by `if traceFraction<1.0 then result=result+[visual(state,"lightning-impact",WP_LIGHTNING,cent.number,q.VectorMA(finish,-16.0,forward),finish,"mod...`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L590)

<a id="function-function-mq3-client-cgame-weapons-machinegunejectbrass-function-machinegunejectbrass-state-cent-water-retailactive-src-mq3-client-cgame-weapons-ml-399881443"></a>
### machineGunEjectBrass

```ml
function machineGunEjectBrass(state, cent, water, retailActive)
```

CG_MachineGunEjectBrass

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.brassTime`, `state.time`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.angles`, `cent.origin`, `cent.weapon`, `cent.number`. |
| `water` | `dynamic` | — | Value used by `if water then scale=0.1 end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L420)

<a id="function-function-mq3-client-cgame-weapons-machinegunspinangle-function-machinegunspinangle-state-cent-retailactive-src-mq3-client-cgame-weapons-ml-1924025160"></a>
### machinegunSpinAngle

```ml
function machinegunSpinAngle(state, cent, retailActive)
```

CG_MachinegunSpinAngle

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `cent` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `cent.barrel.time`, `cent.barrel.angle`, `cent.barrel.spinning`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L606)

<a id="function-function-mq3-client-cgame-weapons-maptorsotoweaponframe-function-maptorsotoweaponframe-dropfirst-attackfirst-attack2first-frame-src-mq3-client-cgame-weapons-ml-283545126"></a>
### mapTorsoToWeaponFrame

```ml
function mapTorsoToWeaponFrame(dropFirst, attackFirst, attack2First, frame)
```

CG_MapTorsoToWeaponFrame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dropFirst` | `dynamic` | — | Value used by `if frame>=dropFirst and frame<dropFirst+9 then return frame-dropFirst+6 end if`. |
| `attackFirst` | `dynamic` | — | Value used by `if frame>=attackFirst and frame<attackFirst+6 then return 1+frame-attackFirst end if`. |
| `attack2First` | `dynamic` | — | Value used by `if frame>=attack2First and frame<attack2First+6 then return 1+frame-attack2First end if`. |
| `frame` | `dynamic` | — | Value used by `if frame>=dropFirst and frame<dropFirst+9 then return frame-dropFirst+6 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L564)

<a id="function-function-mq3-client-cgame-weapons-missilehitplayer-function-missilehitplayer-state-weaponnum-origin-dir-entitynum-retailactive-src-mq3-client-cgame-weapons-ml-1302621854"></a>
### missileHitPlayer

```ml
function missileHitPlayer(state, weaponNum, origin, dir, entityNum, retailActive)
```

CG_MissileHitPlayer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game weapons state passed to the helper calls in `missileHitPlayer`. |
| `weaponNum` | `dynamic` | — | Quake III weapon identifier. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `dir` | `dynamic` | — | Value used by `result=[visual(state,"bleed",weaponNum,entityNum,origin,dir,"","bloodExplosion",24.0,0,retailActive)]`. |
| `entityNum` | `dynamic` | — | Entity number identifying a world or player entity. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L725)

<a id="function-function-mq3-client-cgame-weapons-missilehitwall-function-missilehitwall-state-weaponnum-clientnum-origin-dir-soundtype-clientcolor1-clientcolor2-retailactive-src-mq3-client-cgame-weapons-ml-479524218"></a>
### missileHitWall

```ml
function missileHitWall(state, weaponNum, clientNum, origin, dir, soundType, clientColor1, clientColor2, retailActive)
```

CG_MissileHitWall

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.oldRocket`. |
| `weaponNum` | `dynamic` | — | Quake III weapon identifier. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `dir` | `dynamic` | — | Value used by `if not state.oldRocket then action(state,"render","rocket-particle-explosion",weaponNum,0,q.VectorMA(origin,24.0,dir),origin,q.VectorScale(dir...`. |
| `soundType` | `dynamic` | — | Value used by `if soundType==IMPACTSOUND_FLESH then sound="sound/weapons/nailgun/wnalimpl.wav" else if soundType==IMPACTSOUND_METAL then sound="sound/weapons...`. |
| `clientColor1` | `dynamic` | — | Value used by `color=clientColor1 end case`. |
| `clientColor2` | `dynamic` | — | Value used by `if weaponNum==WP_RAILGUN then markColor=clientColor2 end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L702)

<a id="constant-constant-mq3-client-cgame-weapons-muzzle-flash-time-const-muzzle-flash-time-cgabi-muzzle-flash-time-src-mq3-client-cgame-weapons-ml-1903619391"></a>
### MUZZLE_FLASH_TIME

```ml
const MUZZLE_FLASH_TIME = cgabi.MUZZLE_FLASH_TIME
```

Milliseconds for which a weapon muzzle flash remains visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L88)

<a id="function-function-mq3-client-cgame-weapons-nailgunejectbrass-function-nailgunejectbrass-state-cent-retailactive-src-mq3-client-cgame-weapons-ml-1983647884"></a>
### nailgunEjectBrass

```ml
function nailgunEjectBrass(state, cent, retailActive)
```

CG_NailgunEjectBrass

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.angles`, `cent.origin`, `cent.weapon`, `cent.number`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L440)

<a id="function-function-mq3-client-cgame-weapons-nailtrail-function-nailtrail-state-cent-start-finish-liquidboth-retailactive-src-mq3-client-cgame-weapons-ml-2139141742"></a>
### nailTrail

```ml
function nailTrail(state, cent, start, finish, liquidBoth, retailActive)
```

CG_NailTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_weapons.smokeTrail`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_weapons.smokeTrail`. |
| `start` | `dynamic` | — | Argument 4 of `mq3.client.cgame_weapons.smokeTrail`. |
| `finish` | `dynamic` | — | Argument 5 of `mq3.client.cgame_weapons.smokeTrail`. |
| `liquidBoth` | `dynamic` | — | Argument 8 of `mq3.client.cgame_weapons.smokeTrail`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_weapons.smokeTrail`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L492)

<a id="function-function-mq3-client-cgame-weapons-nextweapon-function-nextweapon-state-src-mq3-client-cgame-weapons-ml-1349033501"></a>
### nextWeapon

```ml
function nextWeapon(state)
```

CG_NextWeapon_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `state.weaponSelectTime`, `state.weaponSelect`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L672)

<a id="function-function-mq3-client-cgame-weapons-outofammochange-function-outofammochange-state-src-mq3-client-cgame-weapons-ml-959437411"></a>
### outOfAmmoChange

```ml
function outOfAmmoChange(state)
```

CG_OutOfAmmoChange

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `state.weaponSelectTime`, `state.weaponSelect`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L682)

<a id="function-function-mq3-client-cgame-weapons-plasmatrail-function-plasmatrail-state-cent-origin-water-flashcolor-retailactive-src-mq3-client-cgame-weapons-ml-484366402"></a>
### plasmaTrail

```ml
function plasmaTrail(state, cent, origin, water, flashColor, retailActive)
```

CG_PlasmaTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.noProjectileTrail`, `state.oldPlasma`, `state.time`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.angles`, `cent.number`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `water` | `dynamic` | — | Value used by `if water then scale=0.1 end if`. |
| `flashColor` | `dynamic` | — | Sequence read at `flashColor[0]`, `flashColor[1]`, `flashColor[2]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L500)

<a id="constant-constant-mq3-client-cgame-weapons-pmf-follow-const-pmf-follow-4096-src-mq3-client-cgame-weapons-ml-1235356282"></a>
### PMF_FOLLOW

```ml
const PMF_FOLLOW = 4096
```

Player-movement state flag indicating follow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L54)

<a id="function-function-mq3-client-cgame-weapons-prevweapon-function-prevweapon-state-src-mq3-client-cgame-weapons-ml-1419264477"></a>
### prevWeapon

```ml
function prevWeapon(state)
```

CG_PrevWeapon_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `state.weaponSelectTime`, `state.weaponSelect`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L675)

<a id="function-function-mq3-client-cgame-weapons-profile-function-profile-number-src-mq3-client-cgame-weapons-ml-1261875707"></a>
### profile

```ml
function profile(number)
```

Calls `mq3.client.cgame_weapons.emptyWeapon` from client game weapons `profile`. The final path returns `w`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Value used by `w=emptyWeapon(number)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L524)

<a id="constant-constant-mq3-client-cgame-weapons-pw-battlesuit-const-pw-battlesuit-2-src-mq3-client-cgame-weapons-ml-804227703"></a>
### PW_BATTLESUIT

```ml
const PW_BATTLESUIT = 2
```

Player powerup slot for battlesuit, also used when constructing active-powerup bitsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L48)

<a id="constant-constant-mq3-client-cgame-weapons-pw-invis-const-pw-invis-4-src-mq3-client-cgame-weapons-ml-1511569417"></a>
### PW_INVIS

```ml
const PW_INVIS = 4
```

Player powerup slot for invis, also used when constructing active-powerup bitsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L50)

<a id="constant-constant-mq3-client-cgame-weapons-pw-quad-const-pw-quad-1-src-mq3-client-cgame-weapons-ml-1753457290"></a>
### PW_QUAD

```ml
const PW_QUAD = 1
```

Player powerup slot for quad, also used when constructing active-powerup bitsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L46)

<a id="function-function-mq3-client-cgame-weapons-railtrail-function-railtrail-state-color1-color2-start-finish-retailactive-src-mq3-client-cgame-weapons-ml-2121265436"></a>
### railTrail

```ml
function railTrail(state, color1, color2, start, finish, retailActive)
```

CG_RailTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`, `state.railTrailTime`, `state.oldRail`. |
| `color1` | `dynamic` | — | Value used by `core=action(state,"render","rail-core",WP_RAILGUN,0,start,finish,zero3(),"","railCore","",0.0,0.0,color1,state.time+n.trunc32(state.railTrailT...`. |
| `color2` | `dynamic` | — | Value used by `result=result+[action(state,"render","rail-ring",WP_RAILGUN,0,point,point,q.VectorScale(ringAxis,6.0),"","railDisc","",1.1,0.0,color2,state.ti...`. |
| `start` | `dynamic` | — | Mutable sequence; this routine writes `start[2]`. |
| `finish` | `dynamic` | — | Mutable sequence; this routine writes `finish[2]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L451)

<a id="function-function-mq3-client-cgame-weapons-randint-function-randint-state-src-mq3-client-cgame-weapons-ml-52338425"></a>
### randInt

```ml
function randInt(state)
```

Updates `state.randomAt` during client game weapons `randInt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `state.randomAt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L361)

<a id="function-function-mq3-client-cgame-weapons-randomfloat-function-randomfloat-state-src-mq3-client-cgame-weapons-ml-190823191"></a>
### randomFloat

```ml
function randomFloat(state)
```

Adapts `mq3.compat.numeric.fdiv` to client game weapons `randomFloat`, returning its result for `randInt(state), 32767.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.compat.numeric.fdiv`; passed as `randInt(state)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L364)

<a id="function-function-mq3-client-cgame-weapons-registeritemvisuals-function-registeritemvisuals-state-itemnum-retailactive-src-mq3-client-cgame-weapons-ml-1963240469"></a>
### registerItemVisuals

```ml
function registerItemVisuals(state, itemNum, retailActive)
```

CG_RegisterItemVisuals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `state.items[itemNum]`. |
| `itemNum` | `dynamic` | — | Value used by `if itemNum<0 or itemNum>=len(state.items) then return error(7790,"item number out of range") end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L555)

<a id="function-function-mq3-client-cgame-weapons-registerweapon-function-registerweapon-state-weaponnum-item-retailactive-src-mq3-client-cgame-weapons-ml-1077995945"></a>
### registerWeapon

```ml
function registerWeapon(state, weaponNum, item, retailActive)
```

CG_RegisterWeapon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `state.weapons[weaponNum]`. |
| `weaponNum` | `dynamic` | — | Quake III weapon identifier. |
| `item` | `dynamic` | — | Record read through `item.pickupName`, `item.worldModel`, `item.icon`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L547)

<a id="function-function-mq3-client-cgame-weapons-rockettrail-function-rockettrail-state-cent-start-finish-liquidboth-retailactive-src-mq3-client-cgame-weapons-ml-793696834"></a>
### rocketTrail

```ml
function rocketTrail(state, cent, start, finish, liquidBoth, retailActive)
```

CG_RocketTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_weapons.smokeTrail`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_weapons.smokeTrail`. |
| `start` | `dynamic` | — | Argument 4 of `mq3.client.cgame_weapons.smokeTrail`. |
| `finish` | `dynamic` | — | Argument 5 of `mq3.client.cgame_weapons.smokeTrail`. |
| `liquidBoth` | `dynamic` | — | Argument 8 of `mq3.client.cgame_weapons.smokeTrail`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_weapons.smokeTrail`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L484)

<a id="function-function-mq3-client-cgame-weapons-selectweapon-function-selectweapon-state-num-src-mq3-client-cgame-weapons-ml-1150040483"></a>
### selectWeapon

```ml
function selectWeapon(state, num)
```

CG_Weapon_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `state.weaponSelectTime`, `state.weaponSelect`. |
| `num` | `dynamic` | — | Value assigned to `state.weaponSelect`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L679)

<a id="function-function-mq3-client-cgame-weapons-setrandomints-function-setrandomints-state-values-src-mq3-client-cgame-weapons-ml-784505705"></a>
### setRandomInts

```ml
function setRandomInts(state, values)
```

Updates `state.randomInts`, `state.randomAt` during client game weapons `setRandomInts`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `state.randomInts`, `state.randomAt`. |
| `values` | `dynamic` | — | Value assigned to `state.randomInts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L358)

<a id="function-function-mq3-client-cgame-weapons-shotgunejectbrass-function-shotgunejectbrass-state-cent-water-retailactive-src-mq3-client-cgame-weapons-ml-1032566811"></a>
### shotgunEjectBrass

```ml
function shotgunEjectBrass(state, cent, water, retailActive)
```

CG_ShotgunEjectBrass

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.brassTime`, `state.time`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.angles`, `cent.origin`, `cent.weapon`, `cent.number`. |
| `water` | `dynamic` | — | Value used by `if water then scale=0.1 end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L431)

<a id="function-function-mq3-client-cgame-weapons-shotgunfire-function-shotgunfire-state-origin-direction-seed-otherentnum-water-ragepro-retailactive-src-mq3-client-cgame-weapons-ml-1077952368"></a>
### shotgunFire

```ml
function shotgunFire(state, origin, direction, seed, otherEntNum, water, ragePro, retailActive)
```

CG_ShotgunFire

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. |
| `seed` | `dynamic` | — | Value used by `return result+shotgunPattern(state,origin,direction,seed,otherEntNum,retailActive)`. |
| `otherEntNum` | `dynamic` | — | Value used by `if not ragePro and not water then result=result+[action(state,"render","shotgun-smoke",WP_SHOTGUN,otherEntNum,smokeOrigin,smokeOrigin,[0.0,0.0...`. |
| `water` | `dynamic` | — | Value used by `if not ragePro and not water then result=result+[action(state,"render","shotgun-smoke",WP_SHOTGUN,otherEntNum,smokeOrigin,smokeOrigin,[0.0,0.0...`. |
| `ragePro` | `dynamic` | — | Value used by `if not ragePro and not water then result=result+[action(state,"render","shotgun-smoke",WP_SHOTGUN,otherEntNum,smokeOrigin,smokeOrigin,[0.0,0.0...`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L764)

<a id="function-function-mq3-client-cgame-weapons-shotgunpattern-function-shotgunpattern-state-origin-direction-seed-otherentnum-retailactive-src-mq3-client-cgame-weapons-ml-688322683"></a>
### shotgunPattern

```ml
function shotgunPattern(state, origin, direction, seed, otherEntNum, retailActive)
```

CG_ShotgunPattern

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game weapons state passed to the helper calls in `shotgunPattern`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. |
| `seed` | `dynamic` | — | Value used by `rng=q.RandomState(seed)`. |
| `otherEntNum` | `dynamic` | — | Value used by `result=result+[action(state,"trace","shotgun-pellet",WP_SHOTGUN,otherEntNum,origin,finish,zero3(),"","","",0.0,0.0,[1.0,1.0,1.0],rng.seed,reta...`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L752)

<a id="function-function-mq3-client-cgame-weapons-shotgunpellet-function-shotgunpellet-state-start-finish-skipnum-sourcecontents-destcontents-hitposition-normal-surfaceflags-hitplayer-hitentity-retailactive-src-mq3-client-cgame-weapons-ml-1785700770"></a>
### shotgunPellet

```ml
function shotgunPellet(state, start, finish, skipNum, sourceContents, destContents, hitPosition, normal, surfaceFlags, hitPlayer, hitEntity, retailActive)
```

CG_ShotgunPellet

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game weapons state passed to the helper calls in `shotgunPellet`. |
| `start` | `dynamic` | — | Value used by `if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,st...`. |
| `finish` | `dynamic` | — | Value used by `if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,st...`. |
| `skipNum` | `dynamic` | — | Value used by `if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,st...`. |
| `sourceContents` | `dynamic` | — | Value used by `if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,st...`. |
| `destContents` | `dynamic` | — | Value used by `if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,st...`. |
| `hitPosition` | `dynamic` | — | Value used by `if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,st...`. |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |
| `surfaceFlags` | `dynamic` | — | Value used by `if (surfaceFlags&SURF_NOIMPACT)!=0 then return result end if`. |
| `hitPlayer` | `dynamic` | — | Value used by `if hitPlayer then return result+missileHitPlayer(state,WP_SHOTGUN,hitPosition,normal,hitEntity,retailActive) end if`. |
| `hitEntity` | `dynamic` | — | Value used by `if hitPlayer then return result+missileHitPlayer(state,WP_SHOTGUN,hitPosition,normal,hitEntity,retailActive) end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L742)

<a id="function-function-mq3-client-cgame-weapons-smoketrail-function-smoketrail-state-kind-cent-start-finish-trailradius-trailtime-liquidboth-shader-retailactive-src-mq3-client-cgame-weapons-ml-898939106"></a>
### smokeTrail

```ml
function smokeTrail(state, kind, cent, start, finish, trailRadius, trailTime, liquidBoth, shader, retailActive)
```

Updates `cent.trailTime` during client game weapons `smokeTrail`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`, `state.noProjectileTrail`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `cent` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `cent.trailTime`. |
| `start` | `dynamic` | — | Sequence read at `start[0]`, `start[1]`, `start[2]`. |
| `finish` | `dynamic` | — | Sequence read at `finish[0]`, `finish[1]`, `finish[2]`. |
| `trailRadius` | `dynamic` | — | Value used by `result=result+[action(state,"render",kind,cent.weapon,cent.number,pos,pos,zero3(),"",shader,"",trailRadius,0.0,[1.0,1.0,1.0],t+trailTime,retai...`. |
| `trailTime` | `dynamic` | — | Value used by `startTime=cent.trailTime`. |
| `liquidBoth` | `dynamic` | — | Value used by `if liquidBoth then return [action(state,"render",kind+"-bubbles",cent.weapon,cent.number,start,finish,zero3(),"","waterBubble","",8.0,0.0,[1.0...`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L472)

<a id="function-function-mq3-client-cgame-weapons-spawnrailtrail-function-spawnrailtrail-state-cent-origin-color1-color2-retailactive-src-mq3-client-cgame-weapons-ml-2047645269"></a>
### spawnRailTrail

```ml
function spawnRailTrail(state, cent, origin, color1, color2, retailActive)
```

CG_SpawnRailTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game weapons state passed to the helper calls in `spawnRailTrail`. |
| `cent` | `dynamic` | — | Mutable client game weapons record/storage; this routine assigns `cent.railgunFlash`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `color1` | `dynamic` | — | Value used by `return railTrail(state,color1,color2,origin,cent.railgunImpact,retailActive)`. |
| `color2` | `dynamic` | — | Value used by `return railTrail(state,color1,color2,origin,cent.railgunImpact,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L601)

<a id="constant-constant-mq3-client-cgame-weapons-spin-speed-const-spin-speed-0-9-src-mq3-client-cgame-weapons-ml-1583319070"></a>
### SPIN_SPEED

```ml
const SPIN_SPEED = 0.9
```

Firing-state weapon-barrel rotation rate in degrees per millisecond.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L80)

- [mq3.client.cgame_weapons.State](Type-mq3-client-cgame-weapons-state-1824474221.md) — struct
<a id="function-function-mq3-client-cgame-weapons-strike-function-strike-state-weaponnum-origin-dir-retailactive-src-mq3-client-cgame-weapons-ml-487706345"></a>
### strike

```ml
function strike(state, weaponNum, origin, dir, retailActive)
```

Inventory scanner also reports the local identifiers `strike` and `weapon`. Keep stable semantic aliases so all 35 ledger candidates have a native target. strike

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_weapons.missileHitWall`. |
| `weaponNum` | `dynamic` | — | Quake III weapon identifier. Forwarded to `mq3.client.cgame_weapons.missileHitWall`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_weapons.missileHitWall`. |
| `dir` | `dynamic` | — | Argument 5 of `mq3.client.cgame_weapons.missileHitWall`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_weapons.missileHitWall`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L813)

<a id="constant-constant-mq3-client-cgame-weapons-surf-metalsteps-const-surf-metalsteps-4096-src-mq3-client-cgame-weapons-ml-985043738"></a>
### SURF_METALSTEPS

```ml
const SURF_METALSTEPS = 4096
```

Surface-property flag selecting metalsteps client collision or effect behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L70)

<a id="constant-constant-mq3-client-cgame-weapons-surf-noimpact-const-surf-noimpact-16-src-mq3-client-cgame-weapons-ml-2037278366"></a>
### SURF_NOIMPACT

```ml
const SURF_NOIMPACT = 16
```

Surface-property flag selecting noimpact client collision or effect behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L68)

<a id="function-function-mq3-client-cgame-weapons-tracer-function-tracer-state-source-dest-viewright-viewup-retailactive-src-mq3-client-cgame-weapons-ml-1824235650"></a>
### tracer

```ml
function tracer(state, source, dest, viewRight, viewUp, retailActive)
```

CG_Tracer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.tracerLength`, `state.tracerWidth`. |
| `source` | `dynamic` | — | Sequence read at `source[0]`, `source[1]`, `source[2]`. |
| `dest` | `dynamic` | — | Sequence read at `dest[0]`, `dest[1]`, `dest[2]`. |
| `viewRight` | `dynamic` | — | Value used by `line=[q.DotProduct(forward,viewRight),q.DotProduct(forward,viewUp),0.0]`. |
| `viewUp` | `dynamic` | — | Value used by `line=[q.DotProduct(forward,viewRight),q.DotProduct(forward,viewUp),0.0]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L775)

<a id="function-function-mq3-client-cgame-weapons-visual-function-visual-state-kind-weaponnum-entitynum-origin-finish-model-shader-radius-value-retailactive-src-mq3-client-cgame-weapons-ml-1901050397"></a>
### visual

```ml
function visual(state, kind, weaponNum, entityNum, origin, finish, model, shader, radius, value, retailActive)
```

Adapts `mq3.client.cgame_weapons.action` to client game weapons `visual`, returning its result for `state, "render", kind, weaponNum, entityNum, origin, finish, zero3(), model, shader, "", radius, 0.0, [1.0,1.0,1.0], value, retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_weapons.action`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_weapons.action`. |
| `weaponNum` | `dynamic` | — | Quake III weapon identifier. Forwarded to `mq3.client.cgame_weapons.action`. |
| `entityNum` | `dynamic` | — | Entity number identifying a world or player entity. Forwarded to `mq3.client.cgame_weapons.action`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_weapons.action`. |
| `finish` | `dynamic` | — | Argument 7 of `mq3.client.cgame_weapons.action`. |
| `model` | `dynamic` | — | Argument 9 of `mq3.client.cgame_weapons.action`. |
| `shader` | `dynamic` | — | Argument 10 of `mq3.client.cgame_weapons.action`. |
| `radius` | `dynamic` | — | Radius used by the spatial or visual calculation. Forwarded to `mq3.client.cgame_weapons.action`. |
| `value` | `dynamic` | — | Argument 15 of `mq3.client.cgame_weapons.action`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_weapons.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L404)

<a id="function-function-mq3-client-cgame-weapons-weapon-function-weapon-state-weaponnum-src-mq3-client-cgame-weapons-ml-137420851"></a>
### weapon

```ml
function weapon(state, weaponNum)
```

weapon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.weapons`. |
| `weaponNum` | `dynamic` | — | Quake III weapon identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L817)

- [mq3.client.cgame_weapons.WeaponInfo](Type-mq3-client-cgame-weapons-weaponinfo-2140386880.md) — struct
<a id="function-function-mq3-client-cgame-weapons-weaponselectable-function-weaponselectable-state-i-src-mq3-client-cgame-weapons-ml-1785854166"></a>
### weaponSelectable

```ml
function weaponSelectable(state, i)
```

CG_WeaponSelectable

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.ammo`, `state.owned`. |
| `i` | `dynamic` | — | Value used by `return i>=0 and i<len(state.ammo) and state.ammo[i]!=0 and (state.owned&(1<<i))!=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L669)

<a id="constant-constant-mq3-client-cgame-weapons-wp-bfg-const-wp-bfg-9-src-mq3-client-cgame-weapons-ml-1610984378"></a>
### WP_BFG

```ml
const WP_BFG = 9
```

Native weapon identifier selecting the BFG.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L34)

<a id="constant-constant-mq3-client-cgame-weapons-wp-chaingun-const-wp-chaingun-13-src-mq3-client-cgame-weapons-ml-1202957541"></a>
### WP_CHAINGUN

```ml
const WP_CHAINGUN = 13
```

Native weapon identifier selecting the chaingun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L42)

<a id="constant-constant-mq3-client-cgame-weapons-wp-gauntlet-const-wp-gauntlet-1-src-mq3-client-cgame-weapons-ml-1454888254"></a>
### WP_GAUNTLET

```ml
const WP_GAUNTLET = 1
```

Native weapon identifier selecting the gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L18)

<a id="constant-constant-mq3-client-cgame-weapons-wp-grappling-hook-const-wp-grappling-hook-10-src-mq3-client-cgame-weapons-ml-327648888"></a>
### WP_GRAPPLING_HOOK

```ml
const WP_GRAPPLING_HOOK = 10
```

Native weapon identifier selecting the grappling hook.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L36)

<a id="constant-constant-mq3-client-cgame-weapons-wp-grenade-launcher-const-wp-grenade-launcher-4-src-mq3-client-cgame-weapons-ml-1072088997"></a>
### WP_GRENADE_LAUNCHER

```ml
const WP_GRENADE_LAUNCHER = 4
```

Native weapon identifier selecting the grenade launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L24)

<a id="constant-constant-mq3-client-cgame-weapons-wp-lightning-const-wp-lightning-6-src-mq3-client-cgame-weapons-ml-1210602221"></a>
### WP_LIGHTNING

```ml
const WP_LIGHTNING = 6
```

Native weapon identifier selecting the lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L28)

<a id="constant-constant-mq3-client-cgame-weapons-wp-machinegun-const-wp-machinegun-2-src-mq3-client-cgame-weapons-ml-1706454231"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```

Native weapon identifier selecting the machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L20)

<a id="constant-constant-mq3-client-cgame-weapons-wp-nailgun-const-wp-nailgun-11-src-mq3-client-cgame-weapons-ml-1797525633"></a>
### WP_NAILGUN

```ml
const WP_NAILGUN = 11
```

Native weapon identifier selecting the nailgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L38)

<a id="constant-constant-mq3-client-cgame-weapons-wp-none-const-wp-none-0-src-mq3-client-cgame-weapons-ml-117773601"></a>
### WP_NONE

```ml
const WP_NONE = 0
```

Native weapon identifier selecting no selected weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L16)

<a id="constant-constant-mq3-client-cgame-weapons-wp-num-weapons-const-wp-num-weapons-14-src-mq3-client-cgame-weapons-ml-323321842"></a>
### WP_NUM_WEAPONS

```ml
const WP_NUM_WEAPONS = 14
```

Number of native weapon slots, used to size weapon-indexed tables rather than select a weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L44)

<a id="constant-constant-mq3-client-cgame-weapons-wp-plasmagun-const-wp-plasmagun-8-src-mq3-client-cgame-weapons-ml-1729874499"></a>
### WP_PLASMAGUN

```ml
const WP_PLASMAGUN = 8
```

Native weapon identifier selecting the plasma gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L32)

<a id="constant-constant-mq3-client-cgame-weapons-wp-prox-launcher-const-wp-prox-launcher-12-src-mq3-client-cgame-weapons-ml-1490065064"></a>
### WP_PROX_LAUNCHER

```ml
const WP_PROX_LAUNCHER = 12
```

Native weapon identifier selecting the proximity-mine launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L40)

<a id="constant-constant-mq3-client-cgame-weapons-wp-railgun-const-wp-railgun-7-src-mq3-client-cgame-weapons-ml-1509201722"></a>
### WP_RAILGUN

```ml
const WP_RAILGUN = 7
```

Native weapon identifier selecting the railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L30)

<a id="constant-constant-mq3-client-cgame-weapons-wp-rocket-launcher-const-wp-rocket-launcher-5-src-mq3-client-cgame-weapons-ml-1466088902"></a>
### WP_ROCKET_LAUNCHER

```ml
const WP_ROCKET_LAUNCHER = 5
```

Native weapon identifier selecting the rocket launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L26)

<a id="constant-constant-mq3-client-cgame-weapons-wp-shotgun-const-wp-shotgun-3-src-mq3-client-cgame-weapons-ml-796863726"></a>
### WP_SHOTGUN

```ml
const WP_SHOTGUN = 3
```

Native weapon identifier selecting the shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L22)

<a id="function-function-mq3-client-cgame-weapons-zero3-function-zero3-src-mq3-client-cgame-weapons-ml-835998288"></a>
### zero3

```ml
function zero3()
```

Creates a three-component zero vector for client game weapons.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_weapons.ml#L341)
