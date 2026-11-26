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
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-g-target-sp-target-delay-function-sp-target-delay-level-ent-src-mq3-game-g-target-ml-1482571543"></a>
### SP_target_delay

```ml
function SP_target_delay(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L25)

<a id="function-function-mq3-game-g-target-sp-target-give-function-sp-target-give-level-ent-src-mq3-game-g-target-ml-1804813281"></a>
### SP_target_give

```ml
function SP_target_give(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L17)

<a id="function-function-mq3-game-g-target-sp-target-kill-function-sp-target-kill-level-self-src-mq3-game-g-target-ml-159105420"></a>
### SP_target_kill

```ml
function SP_target_kill(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L105)

<a id="function-function-mq3-game-g-target-sp-target-laser-function-sp-target-laser-level-self-src-mq3-game-g-target-ml-278391506"></a>
### SP_target_laser

```ml
function SP_target_laser(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L90)

<a id="function-function-mq3-game-g-target-sp-target-location-function-sp-target-location-level-self-src-mq3-game-g-target-ml-1557985024"></a>
### SP_target_location

```ml
function SP_target_location(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L108)

<a id="function-function-mq3-game-g-target-sp-target-position-function-sp-target-position-level-self-src-mq3-game-g-target-ml-1582424544"></a>
### SP_target_position

```ml
function SP_target_position(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L106)

<a id="function-function-mq3-game-g-target-sp-target-print-function-sp-target-print-level-ent-src-mq3-game-g-target-ml-692483023"></a>
### SP_target_print

```ml
function SP_target_print(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L38)

<a id="function-function-mq3-game-g-target-sp-target-relay-function-sp-target-relay-level-self-src-mq3-game-g-target-ml-1302861242"></a>
### SP_target_relay

```ml
function SP_target_relay(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L103)

<a id="function-function-mq3-game-g-target-sp-target-remove-powerups-function-sp-target-remove-powerups-level-ent-src-mq3-game-g-target-ml-1912853437"></a>
### SP_target_remove_powerups

```ml
function SP_target_remove_powerups(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L19)

<a id="function-function-mq3-game-g-target-sp-target-score-function-sp-target-score-level-ent-src-mq3-game-g-target-ml-758525937"></a>
### SP_target_score

```ml
function SP_target_score(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L34)

<a id="function-function-mq3-game-g-target-sp-target-speaker-function-sp-target-speaker-level-ent-src-mq3-game-g-target-ml-1819624599"></a>
### SP_target_speaker

```ml
function SP_target_speaker(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L43)

<a id="function-function-mq3-game-g-target-sp-target-teleporter-function-sp-target-teleporter-level-self-src-mq3-game-g-target-ml-155580372"></a>
### SP_target_teleporter

```ml
function SP_target_teleporter(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L95)

<a id="function-function-mq3-game-g-target-target-kill-use-function-target-kill-use-level-self-other-activator-src-mq3-game-g-target-ml-2043602405"></a>
### target_kill_use

```ml
function target_kill_use(level, self, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L104)

<a id="function-function-mq3-game-g-target-target-laser-off-function-target-laser-off-level-self-src-mq3-game-g-target-ml-294115456"></a>
### target_laser_off

```ml
function target_laser_off(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L68)

<a id="function-function-mq3-game-g-target-target-laser-on-function-target-laser-on-level-self-src-mq3-game-g-target-ml-871788738"></a>
### target_laser_on

```ml
function target_laser_on(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L64)

<a id="function-function-mq3-game-g-target-target-laser-start-function-target-laser-start-level-self-src-mq3-game-g-target-ml-1119541036"></a>
### target_laser_start

```ml
function target_laser_start(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L70)

<a id="function-function-mq3-game-g-target-target-laser-think-function-target-laser-think-level-self-src-mq3-game-g-target-ml-225888084"></a>
### target_laser_think

```ml
function target_laser_think(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L63)

<a id="function-function-mq3-game-g-target-target-laser-use-function-target-laser-use-level-self-other-activator-src-mq3-game-g-target-ml-1532686629"></a>
### target_laser_use

```ml
function target_laser_use(level, self, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L69)

<a id="function-function-mq3-game-g-target-target-location-linkup-function-target-location-linkup-level-ent-src-mq3-game-g-target-ml-678353025"></a>
### target_location_linkup

```ml
function target_location_linkup(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L107)

<a id="function-function-mq3-game-g-target-target-relay-use-function-target-relay-use-level-self-other-activator-src-mq3-game-g-target-ml-388403609"></a>
### target_relay_use

```ml
function target_relay_use(level, self, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L102)

<a id="function-function-mq3-game-g-target-target-teleporter-use-function-target-teleporter-use-level-self-other-activator-src-mq3-game-g-target-ml-1286800621"></a>
### target_teleporter_use

```ml
function target_teleporter_use(level, self, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L94)

<a id="function-function-mq3-game-g-target-think-target-delay-function-think-target-delay-level-ent-src-mq3-game-g-target-ml-1436718493"></a>
### Think_Target_Delay

```ml
function Think_Target_Delay(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L21)

<a id="function-function-mq3-game-g-target-use-target-delay-function-use-target-delay-level-ent-other-activator-src-mq3-game-g-target-ml-1758591368"></a>
### Use_Target_Delay

```ml
function Use_Target_Delay(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L22)

<a id="function-function-mq3-game-g-target-use-target-give-function-use-target-give-level-ent-other-activator-src-mq3-game-g-target-ml-1328052018"></a>
### Use_Target_Give

```ml
function Use_Target_Give(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L16)

<a id="function-function-mq3-game-g-target-use-target-print-function-use-target-print-level-ent-other-activator-src-mq3-game-g-target-ml-1988349688"></a>
### Use_Target_Print

```ml
function Use_Target_Print(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L37)

<a id="function-function-mq3-game-g-target-use-target-remove-powerups-function-use-target-remove-powerups-level-ent-other-activator-src-mq3-game-g-target-ml-29676616"></a>
### Use_target_remove_powerups

```ml
function Use_target_remove_powerups(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L18)

<a id="function-function-mq3-game-g-target-use-target-score-function-use-target-score-level-ent-other-activator-src-mq3-game-g-target-ml-1932876456"></a>
### Use_Target_Score

```ml
function Use_Target_Score(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L33)

<a id="function-function-mq3-game-g-target-use-target-speaker-function-use-target-speaker-level-ent-other-activator-src-mq3-game-g-target-ml-1193033636"></a>
### Use_Target_Speaker

```ml
function Use_Target_Speaker(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_target.ml#L42)
