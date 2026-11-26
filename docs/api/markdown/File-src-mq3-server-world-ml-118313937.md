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

Compute area entities in server.world; the normal completion returns `result.toArray()`.

Validation failures include `Invalid server area-list capacity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — | Record exposing `sectors`, `entities`. |
| `mins` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `maxs` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `capacity` | `dynamic` | — | Capacity used in `(capacity < 0)` and `typeof(capacity)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L266)

<a id="function-function-mq3-server-world-cliphandleforentity-function-cliphandleforentity-scene-ent-src-mq3-server-world-ml-627773269"></a>
### clipHandleForEntity

```ml
function clipHandleForEntity(scene, ent)
```

Compute clip handle for entity in server.world; the normal completion returns `cm.tempBoxModel(scene.world, ent.mins, ent.maxs, ((ent.svFlags & 1024) != 0))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — | Record exposing `world`. |
| `ent` | `dynamic` | — | Record exposing `bmodel`, `modelindex`, `mins`, `maxs`, `svFlags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L298)

<a id="function-function-mq3-server-world-cliptoentity-function-cliptoentity-scene-start-finish-mins-maxs-number-mask-capsule-src-mq3-server-world-ml-1301694165"></a>
### clipToEntity

```ml
function clipToEntity(scene, start, finish, mins, maxs, number, mask, capsule)
```

Compute clip to entity in server.world; the normal completion returns `movement.Collision(result.trace, result.endpos, hit)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — | Record exposing `world`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.world.transformedTrace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.collision.world.transformedTrace`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.world.transformedTrace`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.world.transformedTrace`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.server.world.getEntity`. |
| `mask` | `dynamic` | — | Mask passed as `mask` to `mq3.collision.world.transformedTrace`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.collision.world.transformedTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L311)

<a id="function-function-mq3-server-world-create-function-create-world-src-mq3-server-world-ml-79069600"></a>
### create

```ml
function create(world)
```

Create world in server.world; the normal completion returns `scene`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Initial `world` field stored in the returned or constructed `mq3.server.world.Scene` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L136)

<a id="function-function-mq3-server-world-createsector-function-createsector-scene-depth-mins-maxs-src-mq3-server-world-ml-412428779"></a>
### createSector

```ml
function createSector(scene, depth, mins, maxs)
```

Create sector in server.world; the normal completion returns `index`.

Direct state writes: `scene.sectors`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — | Record exposing `sectors`. Updated in place: `sectors`. |
| `depth` | `dynamic` | — | Depth used in `(depth + 1)` and `(depth == 4)`. |
| `mins` | `dynamic` | — | V passed as `v` to `mq3.game.movement.copy`. |
| `maxs` | `dynamic` | — | V passed as `v` to `mq3.game.movement.copy`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L121)

<a id="function-function-mq3-server-world-entity-function-entity-number-src-mq3-server-world-ml-597149977"></a>
### entity

```ml
function entity(number)
```

Create `mq3.server.world.Entity` with number=number; modelindex=0; solid=0; origin=[0.0, 0.0, 0.0]; 20 further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Initial `number` field stored in the returned or constructed `mq3.server.world.Entity` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L89)

- [mq3.server.world.Entity](Type-mq3-server-world-entity-81524084.md) — struct
<a id="function-function-mq3-server-world-entitycontact-function-entitycontact-scene-mins-maxs-number-capsule-src-mq3-server-world-ml-765350366"></a>
### entityContact

```ml
function entityContact(scene, mins, maxs, number, capsule)
```

Compute entity contact in server.world; the normal completion returns `hit.trace.startsolid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — | Record exposing `world`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.world.transformedTrace`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.world.transformedTrace`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.server.world.getEntity`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.collision.world.transformedTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L401)

<a id="function-function-mq3-server-world-getentity-function-getentity-scene-number-src-mq3-server-world-ml-998856317"></a>
### getEntity

```ml
function getEntity(scene, number)
```

Get entity in server.world; the normal completion returns `scene.entities[number]`.

Validation failures include `Invalid server entity number`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — | Record exposing `entities`. |
| `number` | `dynamic` | — | Zero-based index into `scene.entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L97)

<a id="function-function-mq3-server-world-inpvs-function-inpvs-scene-p1-p2-src-mq3-server-world-ml-573800115"></a>
### inPVS

```ml
function inPVS(scene, p1, p2)
```

Compute in pvs in server.world; the normal completion returns `vis.areasConnected(visibility, area1, area2)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — | Record exposing `world`. |
| `p1` | `dynamic` | — | Point passed as `point` to `mq3.collision.world.pointLeafnum`. |
| `p2` | `dynamic` | — | Point passed as `point` to `mq3.collision.world.pointLeafnum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L105)

<a id="function-function-mq3-server-world-linkentity-function-linkentity-scene-number-src-mq3-server-world-ml-1777207911"></a>
### linkEntity

```ml
function linkEntity(scene, number)
```

Compute link entity in server.world.

Validation failures include `Server entity number does not match its slot`; `Inverted entity bounds`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — | Record exposing `world`, `sectors`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.server.world.getEntity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L197)

<a id="function-function-mq3-server-world-packedextent-function-packedextent-value-src-mq3-server-world-ml-1831734143"></a>
### packedExtent

```ml
function packedExtent(value)
```

Return `mq3.collision.world.max(1, cm.min(255, n.trunc32(value)))` from `server.world.packedExtent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point value to convert to signed 32-bit integer semantics. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L189)

<a id="function-function-mq3-server-world-pmovecontents-function-pmovecontents-p-point-src-mq3-server-world-ml-761886690"></a>
### pmoveContents

```ml
function pmoveContents(p, point)
```

Return `mq3.server.world.pointContents(p.context, point, p.ps.clientNum)` from `server.world.pmoveContents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Record exposing `context`, `ps`. |
| `point` | `dynamic` | — | Point passed as `point` to `mq3.server.world.pointContents`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L392)

<a id="function-function-mq3-server-world-pmovetrace-function-pmovetrace-p-start-finish-src-mq3-server-world-ml-1865127243"></a>
### pmoveTrace

```ml
function pmoveTrace(p, start, finish)
```

Return `mq3.server.world.trace(p.context, start, finish, p.k.mins, p.k.maxs, p.ps.clientNum, p.k.mask, false)` from `server.world.pmoveTrace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Record exposing `context`, `k`, `ps`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.server.world.trace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.server.world.trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L386)

<a id="function-function-mq3-server-world-pointcontents-function-pointcontents-scene-point-passentity-src-mq3-server-world-ml-30362442"></a>
### pointContents

```ml
function pointContents(scene, point, passEntity)
```

Compute point contents in server.world; the normal completion returns `contents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — | Record exposing `world`, `entities`. |
| `point` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `passEntity` | `dynamic` | — | Pass entity used in `(number == passEntity)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L372)

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
| `scene` | `dynamic` | — | Record exposing `sectors`, `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L147)

<a id="function-function-mq3-server-world-sv-sectorlist-f-function-sv-sectorlist-f-scene-printfn-context-src-mq3-server-world-ml-576195340"></a>
### SV_SectorList_f

```ml
function SV_SectorList_f(scene, printFn, context)
```

Compute sector list f in server.world; the normal completion returns `len(lines)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — | Scene passed as `scene` to `mq3.server.world.sectorList`. |
| `printFn` | `dynamic` | — | Callback invoked for print; the call sites below define the callback arguments. |
| `context` | `dynamic` | — | Context used in `printFn(context, line)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L166)

<a id="function-function-mq3-server-world-trace-function-trace-scene-start-finish-mins-maxs-passentity-mask-capsule-src-mq3-server-world-ml-995559152"></a>
### trace

```ml
function trace(scene, start, finish, mins, maxs, passEntity, mask, capsule)
```

Trace world in server.world; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — | Record exposing `world`, `entities`. |
| `start` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `finish` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `mins` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `maxs` | `dynamic` | — | Value passed as `value` to `mq3.collision.world.vector32`. |
| `passEntity` | `dynamic` | — | Number passed as `number` to `mq3.server.world.getEntity`. |
| `mask` | `dynamic` | — | Mask passed as `mask` to `mq3.collision.world.trace`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.collision.world.trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L330)

<a id="function-function-mq3-server-world-unlinkentity-function-unlinkentity-scene-number-src-mq3-server-world-ml-900267787"></a>
### unlinkEntity

```ml
function unlinkEntity(scene, number)
```

Compute unlink entity in server.world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — | Record exposing `sectors`, `entities`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.server.world.getEntity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/world.ml#L174)
