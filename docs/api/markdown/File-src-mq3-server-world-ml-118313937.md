# `src/mq3/server/world.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.world`](Package-mq3-server-world-357248007.md)

Reachable from entry: **yes**

## Imports

- `mq3/collision/brush.ml` as `brush` → [src/mq3/collision/brush.ml](File-src-mq3-collision-brush-ml-582513812.md)
- `mq3/collision/visibility.ml` as `vis` → [src/mq3/collision/visibility.ml](File-src-mq3-collision-visibility-ml-1423508826.md)
- `mq3/collision/world.ml` as `cm` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency
- `std/ds/list.ml` as `spatialAreaLists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

<a id="function-function-mq3-server-world-areaentities-function-areaentities-scene-mins-maxs-capacity-src-mq3-server-world-ml-1993397470"></a>
### areaEntities

```ml
function areaEntities(scene, mins, maxs, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L190)

<a id="function-function-mq3-server-world-cliphandleforentity-function-cliphandleforentity-scene-ent-src-mq3-server-world-ml-627773269"></a>
### clipHandleForEntity

```ml
function clipHandleForEntity(scene, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L219)

<a id="function-function-mq3-server-world-cliptoentity-function-cliptoentity-scene-start-finish-mins-maxs-number-mask-capsule-src-mq3-server-world-ml-1301694165"></a>
### clipToEntity

```ml
function clipToEntity(scene, start, finish, mins, maxs, number, mask, capsule)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L223)

<a id="function-function-mq3-server-world-create-function-create-world-src-mq3-server-world-ml-79069600"></a>
### create

```ml
function create(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L82)

<a id="function-function-mq3-server-world-createsector-function-createsector-scene-depth-mins-maxs-src-mq3-server-world-ml-412428779"></a>
### createSector

```ml
function createSector(scene, depth, mins, maxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — |  |
| `depth` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L69)

<a id="function-function-mq3-server-world-entity-function-entity-number-src-mq3-server-world-ml-597149977"></a>
### entity

```ml
function entity(number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L53)

- [mq3.server.world.Entity](Type-mq3-server-world-entity-81524084.md) — struct
<a id="function-function-mq3-server-world-entitycontact-function-entitycontact-scene-mins-maxs-number-capsule-src-mq3-server-world-ml-765350366"></a>
### entityContact

```ml
function entityContact(scene, mins, maxs, number, capsule)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L287)

<a id="function-function-mq3-server-world-getentity-function-getentity-scene-number-src-mq3-server-world-ml-998856317"></a>
### getEntity

```ml
function getEntity(scene, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L56)

<a id="function-function-mq3-server-world-inpvs-function-inpvs-scene-p1-p2-src-mq3-server-world-ml-573800115"></a>
### inPVS

```ml
function inPVS(scene, p1, p2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — |  |
| `p1` | `dynamic` | — |  |
| `p2` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L60)

<a id="function-function-mq3-server-world-linkentity-function-linkentity-scene-number-src-mq3-server-world-ml-1777207911"></a>
### linkEntity

```ml
function linkEntity(scene, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L128)

<a id="function-function-mq3-server-world-packedextent-function-packedextent-value-src-mq3-server-world-ml-1831734143"></a>
### packedExtent

```ml
function packedExtent(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L125)

<a id="function-function-mq3-server-world-pmovecontents-function-pmovecontents-p-point-src-mq3-server-world-ml-761886690"></a>
### pmoveContents

```ml
function pmoveContents(p, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L284)

<a id="function-function-mq3-server-world-pmovetrace-function-pmovetrace-p-start-finish-src-mq3-server-world-ml-1865127243"></a>
### pmoveTrace

```ml
function pmoveTrace(p, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L281)

<a id="function-function-mq3-server-world-pointcontents-function-pointcontents-scene-point-passentity-src-mq3-server-world-ml-30362442"></a>
### pointContents

```ml
function pointContents(scene, point, passEntity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `passEntity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L271)

- [mq3.server.world.Scene](Type-mq3-server-world-scene-1257075529.md) — struct
- [mq3.server.world.Sector](Type-mq3-server-world-sector-552023813.md) — struct
<a id="function-function-mq3-server-world-sectorlist-function-sectorlist-scene-src-mq3-server-world-ml-357917860"></a>
### sectorList

```ml
function sectorList(scene)
```

SV_SectorList_f is a diagnostic command, but it deliberately walks the same intrusive sector chains used by collision queries.  Baseq3 prints all 64 statically allocated slots; only the first 31 belong to the depth-four tree and the remaining slots consequently report zero entities.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L92)

<a id="function-function-mq3-server-world-sv-sectorlist-f-function-sv-sectorlist-f-scene-printfn-context-src-mq3-server-world-ml-576195340"></a>
### SV_SectorList_f

```ml
function SV_SectorList_f(scene, printFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — |  |
| `printFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L107)

<a id="function-function-mq3-server-world-trace-function-trace-scene-start-finish-mins-maxs-passentity-mask-capsule-src-mq3-server-world-ml-995559152"></a>
### trace

```ml
function trace(scene, start, finish, mins, maxs, passEntity, mask, capsule)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `passEntity` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L233)

<a id="function-function-mq3-server-world-unlinkentity-function-unlinkentity-scene-number-src-mq3-server-world-ml-900267787"></a>
### unlinkEntity

```ml
function unlinkEntity(scene, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L112)
