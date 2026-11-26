# `src/mq3/game/hazards.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.hazards`](Package-mq3-game-hazards-465460243.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-hazards-hurttouch-function-hurttouch-level-self-other-trace-src-mq3-game-hazards-ml-855921177"></a>
### hurtTouch

```ml
function hurtTouch(level, self, other, trace)
```

Set `self.timestamp` to `n.add32(level.time,1000)` and `self.timestamp` to `n.add32(level.time,100)` in `mq3.game.hazards.hurtTouch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `timestamp`, `spawnflags`, `noise_index` and `damage`. May update `self.timestamp` in place. |
| `other` | `dynamic` | — | Other record; accesses `takedamage`. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `hurtTouch` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/hazards.ml#L70)

<a id="function-function-mq3-game-hazards-hurtuse-function-hurtuse-level-self-other-activator-src-mq3-game-hazards-ml-287052607"></a>
### hurtUse

```ml
function hurtUse(level, self, other, activator)
```

Apply `mq3.game.entities.unlink` and `mq3.game.entities.link` while evaluating `hurtUse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `r`. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `hurtUse` signature. |
| `activator` | `dynamic` | — | Not read by this implementation; retained in the `hurtUse` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/hazards.ml#L61)

<a id="function-function-mq3-game-hazards-killuse-function-killuse-level-self-other-activator-src-mq3-game-hazards-ml-94901481"></a>
### killUse

```ml
function killUse(level, self, other, activator)
```

Forward `killUse` to `mq3.game.combat.damage` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissionQueued`, `time`, `entities`, `obeliskAttackFn` and `knockback` and related fields. |
| `self` | `dynamic` | — | Not read by this implementation; retained in the `killUse` signature. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `killUse` signature. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/hazards.ml#L84)

<a id="function-function-mq3-game-hazards-laseroff-function-laseroff-level-self-src-mq3-game-hazards-ml-375225108"></a>
### laserOff

```ml
function laserOff(level, self)
```

Set `self.nextthink` to `0` in `mq3.game.hazards.laserOff`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `nextthink`. May update `self.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/hazards.ml#L42)

<a id="function-function-mq3-game-hazards-laseron-function-laseron-level-self-src-mq3-game-hazards-ml-1119559564"></a>
### laserOn

```ml
function laserOn(level, self)
```

Set `self.activator` to `self` in `mq3.game.hazards.laserOn`. Return paths include `laserThink(level,self)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities` and `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `activator`. May update `self.activator` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/hazards.ml#L35)

<a id="function-function-mq3-game-hazards-laserthink-function-laserthink-level-self-src-mq3-game-hazards-ml-1306509692"></a>
### laserThink

```ml
function laserThink(level, self)
```

Update `self.movedir`, `self.s.origin2` and `self.nextthink` during `laserThink`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities` and `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `enemy`, `movedir`, `s`, `activator` and `damage` and related fields. May update `self.movedir`, `self.s.origin2` and `self.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/hazards.ml#L14)

<a id="function-function-mq3-game-hazards-laseruse-function-laseruse-level-self-other-activator-src-mq3-game-hazards-ml-1209378407"></a>
### laserUse

```ml
function laserUse(level, self, other, activator)
```

Set `self.activator` to `activator` in `mq3.game.hazards.laserUse`. Return paths include `laserOn(level,self)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `activator` and `nextthink`. May update `self.activator` in place. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `laserUse` signature. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/hazards.ml#L51)
