# `src/mq3/game/g_target.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_target`](Package-mq3-game-g-target-863522881.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/hazards.ml` as `hazards` → [src/mq3/game/hazards.ml](File-src-mq3-game-hazards-ml-330250313.md)
- `mq3/game/map_targets.ml` as `mapTargets` → [src/mq3/game/map_targets.ml](File-src-mq3-game-map-targets-ml-50586407.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/game/targets.ml` as `targets` → [src/mq3/game/targets.ml](File-src-mq3-game-targets-ml-1419507080.md)
- `mq3/shared/directions.ml` as `dirs` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-g-target-sp-target-delay-function-sp-target-delay-level-ent-src-mq3-game-g-target-ml-1482571543"></a>
### SP_target_delay

```ml
function SP_target_delay(level, ent)
```

Update `ent.wait` and `ent.use` during `SP_target_delay`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `wait` and `use`. May update `ent.wait` and `ent.use` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L52)

<a id="function-function-mq3-game-g-target-sp-target-give-function-sp-target-give-level-ent-src-mq3-game-g-target-ml-1804813281"></a>
### SP_target_give

```ml
function SP_target_give(level, ent)
```

Set `ent.use` to `Use_Target_Give` in `mq3.game.g_target.SP_target_give`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `mq3.game.map_targets.giveSpawn`. |
| `ent` | `dynamic` | — | Game entity; accesses `use`. May update `ent.use` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L25)

<a id="function-function-mq3-game-g-target-sp-target-kill-function-sp-target-kill-level-self-src-mq3-game-g-target-ml-159105420"></a>
### SP_target_kill

```ml
function SP_target_kill(level, self)
```

Set `self.use` to `target_kill_use` in `mq3.game.g_target.SP_target_kill`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `SP_target_kill` signature. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `use`. May update `self.use` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L200)

<a id="function-function-mq3-game-g-target-sp-target-laser-function-sp-target-laser-level-self-src-mq3-game-g-target-ml-278391506"></a>
### SP_target_laser

```ml
function SP_target_laser(level, self)
```

Set `self.think` to `target_laser_start` and `self.nextthink` to `n.add32(level.time,100)` in `mq3.game.g_target.SP_target_laser`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `think` and `nextthink`. May update `self.think` and `self.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L161)

<a id="function-function-mq3-game-g-target-sp-target-location-function-sp-target-location-level-self-src-mq3-game-g-target-ml-1557985024"></a>
### SP_target_location

```ml
function SP_target_location(level, self)
```

Set `self.think` to `target_location_linkup` and `self.nextthink` to `n.add32(level.time,200)` in `mq3.game.g_target.SP_target_location`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `think`, `nextthink` and `s`. May update `self.think` and `self.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L212)

<a id="function-function-mq3-game-g-target-sp-target-position-function-sp-target-position-level-self-src-mq3-game-g-target-ml-1582424544"></a>
### SP_target_position

```ml
function SP_target_position(level, self)
```

Apply `mq3.game.entities.setOrigin` while evaluating `SP_target_position`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `SP_target_position` signature. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L204)

<a id="function-function-mq3-game-g-target-sp-target-print-function-sp-target-print-level-ent-src-mq3-game-g-target-ml-692483023"></a>
### SP_target_print

```ml
function SP_target_print(level, ent)
```

Set `ent.use` to `Use_Target_Print` in `mq3.game.g_target.SP_target_print`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `mq3.game.map_targets.printSpawn`. |
| `ent` | `dynamic` | — | Game entity; accesses `use`. May update `ent.use` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L81)

<a id="function-function-mq3-game-g-target-sp-target-relay-function-sp-target-relay-level-self-src-mq3-game-g-target-ml-1302861242"></a>
### SP_target_relay

```ml
function SP_target_relay(level, self)
```

Set `self.use` to `target_relay_use` in `mq3.game.g_target.SP_target_relay`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `SP_target_relay` signature. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `use`. May update `self.use` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L190)

<a id="function-function-mq3-game-g-target-sp-target-remove-powerups-function-sp-target-remove-powerups-level-ent-src-mq3-game-g-target-ml-1912853437"></a>
### SP_target_remove_powerups

```ml
function SP_target_remove_powerups(level, ent)
```

Set `ent.use` to `Use_target_remove_powerups` in `mq3.game.g_target.SP_target_remove_powerups`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `mq3.game.map_targets.removePowerupsSpawn`. |
| `ent` | `dynamic` | — | Game entity; accesses `use`. May update `ent.use` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L35)

<a id="function-function-mq3-game-g-target-sp-target-score-function-sp-target-score-level-ent-src-mq3-game-g-target-ml-758525937"></a>
### SP_target_score

```ml
function SP_target_score(level, ent)
```

Set `ent.use` to `Use_Target_Score` in `mq3.game.g_target.SP_target_score`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `mq3.game.map_targets.scoreSpawn`. |
| `ent` | `dynamic` | — | Game entity; accesses `use`. May update `ent.use` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L69)

<a id="function-function-mq3-game-g-target-sp-target-speaker-function-sp-target-speaker-level-ent-src-mq3-game-g-target-ml-1819624599"></a>
### SP_target_speaker

```ml
function SP_target_speaker(level, ent)
```

Update `ent.wait`, `ent.random`, `ent.spawnflags` and `ent.noise_index` and related state during `SP_target_speaker`. Return paths include `game.link(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `wait`, `random`, `spawnflags`, `noise_index` and `s` and related fields. May update `ent.wait`, `ent.random` and `ent.spawnflags` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L94)

<a id="function-function-mq3-game-g-target-sp-target-teleporter-function-sp-target-teleporter-level-self-src-mq3-game-g-target-ml-155580372"></a>
### SP_target_teleporter

```ml
function SP_target_teleporter(level, self)
```

Set `self.use` to `target_teleporter_use` in `mq3.game.g_target.SP_target_teleporter`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `targetname`, `classname`, `s` and `use`. May update `self.use` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L174)

<a id="function-function-mq3-game-g-target-target-kill-use-function-target-kill-use-level-self-other-activator-src-mq3-game-g-target-ml-2043602405"></a>
### target_kill_use

```ml
function target_kill_use(level, self, other, activator)
```

Forward `target_kill_use` to `mq3.game.hazards.killUse` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissionQueued`, `time`, `entities`, `obeliskAttackFn` and `knockback` and related fields. |
| `self` | `dynamic` | — | Value passed as argument 2 to `mq3.game.hazards.killUse`. |
| `other` | `dynamic` | — | Value passed as argument 3 to `mq3.game.hazards.killUse`. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L196)

<a id="function-function-mq3-game-g-target-target-laser-off-function-target-laser-off-level-self-src-mq3-game-g-target-ml-294115456"></a>
### target_laser_off

```ml
function target_laser_off(level, self)
```

Forward `target_laser_off` to `mq3.game.hazards.laserOff` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `nextthink`. May update `self.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L128)

<a id="function-function-mq3-game-g-target-target-laser-on-function-target-laser-on-level-self-src-mq3-game-g-target-ml-871788738"></a>
### target_laser_on

```ml
function target_laser_on(level, self)
```

Set `self.activator` to `self` in `mq3.game.g_target.target_laser_on`. Return paths include `target_laser_think(level,self)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities` and `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `activator`. May update `self.activator` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L121)

<a id="function-function-mq3-game-g-target-target-laser-start-function-target-laser-start-level-self-src-mq3-game-g-target-ml-1119541036"></a>
### target_laser_start

```ml
function target_laser_start(level, self)
```

Update `self.s.eType`, `self.enemy`, `self.movedir` and `self.s.angles` and related state during `target_laser_start`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`, `target`, `classname`, `enemy` and `movedir` and related fields. May update `self.s.eType`, `self.enemy` and `self.movedir` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L138)

<a id="function-function-mq3-game-g-target-target-laser-think-function-target-laser-think-level-self-src-mq3-game-g-target-ml-225888084"></a>
### target_laser_think

```ml
function target_laser_think(level, self)
```

Forward `target_laser_think` to `mq3.game.hazards.laserThink` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities` and `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `enemy`, `movedir`, `s`, `activator` and `damage` and related fields. May update `self.movedir`, `self.s.origin2` and `self.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L117)

<a id="function-function-mq3-game-g-target-target-laser-use-function-target-laser-use-level-self-other-activator-src-mq3-game-g-target-ml-1532686629"></a>
### target_laser_use

```ml
function target_laser_use(level, self, other, activator)
```

Forward `target_laser_use` to `mq3.game.hazards.laserUse` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `activator` and `nextthink`. May update `self.activator` in place. |
| `other` | `dynamic` | — | Value passed as argument 3 to `mq3.game.hazards.laserUse`. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L134)

<a id="function-function-mq3-game-g-target-target-location-linkup-function-target-location-linkup-level-ent-src-mq3-game-g-target-ml-678353025"></a>
### target_location_linkup

```ml
function target_location_linkup(level, ent)
```

Forward `target_location_linkup` to `mq3.game.targets.locationLinkup` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `locationLinked`, `locationHead`, `spawner`, `num_entities` and `entities`. May update `level.locationLinked` and `level.locationHead` in place. |
| `ent` | `dynamic` | — | Value passed as argument 2 to `mq3.game.targets.locationLinkup`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L208)

<a id="function-function-mq3-game-g-target-target-relay-use-function-target-relay-use-level-self-other-activator-src-mq3-game-g-target-ml-388403609"></a>
### target_relay_use

```ml
function target_relay_use(level, self, other, activator)
```

Forward `target_relay_use` to `mq3.game.targets.relayUse` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`. |
| `self` | `dynamic` | — | Game entity; accesses `spawnflags` and `target`. |
| `other` | `dynamic` | — | Value passed as argument 3 to `mq3.game.targets.relayUse`. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L186)

<a id="function-function-mq3-game-g-target-target-teleporter-use-function-target-teleporter-use-level-self-other-activator-src-mq3-game-g-target-ml-1286800621"></a>
### target_teleporter_use

```ml
function target_teleporter_use(level, self, other, activator)
```

Forward `target_teleporter_use` to `mq3.game.targets.teleporterUse` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`. |
| `self` | `dynamic` | — | Game entity; accesses `target`. |
| `other` | `dynamic` | — | Value passed as argument 3 to `mq3.game.targets.teleporterUse`. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L170)

<a id="function-function-mq3-game-g-target-think-target-delay-function-think-target-delay-level-ent-src-mq3-game-g-target-ml-1436718493"></a>
### Think_Target_Delay

```ml
function Think_Target_Delay(level, ent)
```

Forward `Think_Target_Delay` to `mq3.game.targets.delayThink` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `spawner`, `num_entities` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `activator`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L40)

<a id="function-function-mq3-game-g-target-use-target-delay-function-use-target-delay-level-ent-other-activator-src-mq3-game-g-target-ml-1758591368"></a>
### Use_Target_Delay

```ml
function Use_Target_Delay(level, ent, other, activator)
```

Update `ent.nextthink`, `ent.think` and `ent.activator` during `Use_Target_Delay`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `nextthink`, `think` and `activator`. May update `ent.nextthink`, `ent.think` and `ent.activator` in place. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `Use_Target_Delay` signature. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L46)

<a id="function-function-mq3-game-g-target-use-target-give-function-use-target-give-level-ent-other-activator-src-mq3-game-g-target-ml-1328052018"></a>
### Use_Target_Give

```ml
function Use_Target_Give(level, ent, other, activator)
```

Forward `Use_Target_Give` to `mq3.game.map_targets.giveUse` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `target`. |
| `other` | `dynamic` | — | Value passed as argument 3 to `mq3.game.map_targets.giveUse`. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L21)

<a id="function-function-mq3-game-g-target-use-target-print-function-use-target-print-level-ent-other-activator-src-mq3-game-g-target-ml-1988349688"></a>
### Use_Target_Print

```ml
function Use_Target_Print(level, ent, other, activator)
```

Forward `Use_Target_Print` to `mq3.game.map_targets.printUse` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `spawnflags`. |
| `other` | `dynamic` | — | Value passed as argument 3 to `mq3.game.map_targets.printUse`. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L77)

<a id="function-function-mq3-game-g-target-use-target-remove-powerups-function-use-target-remove-powerups-level-ent-other-activator-src-mq3-game-g-target-ml-29676616"></a>
### Use_target_remove_powerups

```ml
function Use_target_remove_powerups(level, ent, other, activator)
```

Forward `Use_target_remove_powerups` to `mq3.game.map_targets.removePowerupsUse` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamMessageFn`. |
| `ent` | `dynamic` | — | Value passed as argument 2 to `mq3.game.map_targets.removePowerupsUse`. |
| `other` | `dynamic` | — | Value passed as argument 3 to `mq3.game.map_targets.removePowerupsUse`. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L31)

<a id="function-function-mq3-game-g-target-use-target-score-function-use-target-score-level-ent-other-activator-src-mq3-game-g-target-ml-1932876456"></a>
### Use_Target_Score

```ml
function Use_Target_Score(level, ent, other, activator)
```

Forward `Use_Target_Score` to `mq3.game.map_targets.scoreUse` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `teamScores`. May update `level.teamScores[team]` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `r` and `count`. |
| `other` | `dynamic` | — | Value passed as argument 3 to `mq3.game.map_targets.scoreUse`. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L65)

<a id="function-function-mq3-game-g-target-use-target-speaker-function-use-target-speaker-level-ent-other-activator-src-mq3-game-g-target-ml-1193033636"></a>
### Use_Target_Speaker

```ml
function Use_Target_Speaker(level, ent, other, activator)
```

Forward `Use_Target_Speaker` to `mq3.game.targets.speakerUse` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `spawnflags`, `s` and `noise_index`. May update `ent.s.loopSound` in place. |
| `other` | `dynamic` | — | Value passed as argument 3 to `mq3.game.targets.speakerUse`. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_target.ml#L90)
