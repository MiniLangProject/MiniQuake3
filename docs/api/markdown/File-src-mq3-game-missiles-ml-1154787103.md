# `src/mq3/game/missiles.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.missiles`](Package-mq3-game-missiles-1363713983.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/snapshot.ml` as `snapshot` → [src/mq3/game/snapshot.ml](File-src-mq3-game-snapshot-ml-1144176980.md)
- `mq3/game/trajectory.ml` as `trajectory` → [src/mq3/game/trajectory.ml](File-src-mq3-game-trajectory-ml-1278285327.md)
- `mq3/shared/directions.ml` as `directions` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-missiles-accuracy-function-accuracy-level-ent-src-mq3-game-missiles-ml-399353473"></a>
### accuracy

```ml
function accuracy(level, ent)
```

Increment the owning client's accuracy-hit count and reject missiles without a client owner.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `r`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/missiles.ml#L29)

<a id="function-function-mq3-game-missiles-bounce-function-bounce-level-ent-hit-src-mq3-game-missiles-ml-1775339680"></a>
### bounce

```ml
function bounce(level, ent, hit)
```

Update `ent.s.pos.trDelta`, `ent.s.pos.trDelta[axis]`, `ent.r.currentOrigin[axis]` and `ent.s.pos.trBase` and related state during `bounce`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `previousTime` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s` and `r`. May update `ent.s.pos.trDelta`, `ent.s.pos.trDelta[axis]` and `ent.r.currentOrigin[axis]` and additional fields in place. |
| `hit` | `dynamic` | — | Hit record; accesses `trace` and `endpos`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/missiles.ml#L71)

<a id="function-function-mq3-game-missiles-explode-function-explode-level-ent-src-mq3-game-missiles-ml-1318663987"></a>
### explode

```ml
function explode(level, ent)
```

Set `ent.s.eType` to `c.ET_GENERAL` and `ent.freeAfterEvent` to `true` in `mq3.game.missiles.explode`. Return paths include `game.link(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `freeAfterEvent`, `splashDamage`, `r` and `parent` and related fields. May update `ent.s.eType` and `ent.freeAfterEvent` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/missiles.ml#L91)

<a id="function-function-mq3-game-missiles-fire-function-fire-level-self-start-dir-weapon-src-mq3-game-missiles-ml-2085538035"></a>
### fire

```ml
function fire(level, self, start, dir, weapon)
```

Apply `mq3.game.entities.spawn`, `mq3.game.movement.copy` and `mq3.game.snapshot.snapVector` while evaluating `fire`. Return paths include `ent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `dir` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.VectorNormalize`. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/missiles.ml#L168)

<a id="function-function-mq3-game-missiles-hookclient-function-hookclient-ent-src-mq3-game-missiles-ml-715130013"></a>
### hookClient

```ml
function hookClient(ent)
```

Require and return the parent client of a grappling-hook entity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `parent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/missiles.ml#L37)

<a id="function-function-mq3-game-missiles-hookfree-function-hookfree-level-ent-src-mq3-game-missiles-ml-1084910121"></a>
### hookFree

```ml
function hookFree(level, ent)
```

Apply `mq3.game.missiles.hookClient` and `mq3.game.entities.free` while evaluating `hookFree`. Return paths include `game.free(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `parent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/missiles.ml#L44)

<a id="function-function-mq3-game-missiles-hookpoint-function-hookpoint-other-src-mq3-game-missiles-ml-1114785480"></a>
### hookPoint

```ml
function hookPoint(other)
```

Calculate the hooked entity's bounding-box center relative to its current world origin.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `other` | `dynamic` | — | Other record; accesses `r`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/missiles.ml#L50)

<a id="function-function-mq3-game-missiles-hookthink-function-hookthink-level-ent-src-mq3-game-missiles-ml-371921023"></a>
### hookThink

```ml
function hookThink(level, ent)
```

Apply `mq3.game.missiles.hookPoint`, `mq3.game.missiles.snapTowards` and `mq3.game.entities.setOrigin` while evaluating `hookThink`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `hookThink` signature. |
| `ent` | `dynamic` | — | Game entity; accesses `enemy` and `r`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/missiles.ml#L60)

<a id="function-function-mq3-game-missiles-impact-function-impact-level-ent-hit-src-mq3-game-missiles-ml-1409096684"></a>
### impact

```ml
function impact(level, ent, hit)
```

Update `ent.enemy`, `ent.s.eType`, `ent.think` and `ent.nextthink` and related state during `impact`. Return paths include `game.link(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `damage`, `r`, `methodOfDeath` and `classname` and related fields. May update `ent.enemy`, `ent.s.eType` and `ent.think` and additional fields in place. |
| `hit` | `dynamic` | — | Hit record; accesses `trace`, `entityNum` and `endpos`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/missiles.ml#L104)

<a id="function-function-mq3-game-missiles-run-function-run-level-ent-src-mq3-game-missiles-ml-50430007"></a>
### run

```ml
function run(level, ent)
```

Set `ent.r.currentOrigin` to `movement.copy(hit.endpos)` and `ent.parent.client.hook` to `void` in `mq3.game.missiles.run`. Return paths include `game.runThink(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `r`, `target_ent`, `clipmask` and `parent`. May update `ent.r.currentOrigin` and `ent.parent.client.hook` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/missiles.ml#L142)

<a id="function-function-mq3-game-missiles-snaptowards-function-snaptowards-v-towards-src-mq3-game-missiles-ml-1913883608"></a>
### snapTowards

```ml
function snapTowards(v, towards)
```

Set `v[axis]` to `n.f32(value)` in `mq3.game.missiles.snapTowards`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Array or byte sequence accessed at `axis`. Entries are written in place. |
| `towards` | `dynamic` | — | Array or byte sequence accessed at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/missiles.ml#L18)
