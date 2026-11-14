# `src/mq3/game/g_trigger.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_trigger`](Package-mq3-game-g-trigger-896788692.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `mq3/game/jumppad.ml` as `pad` → [src/mq3/game/jumppad.ml](File-src-mq3-game-jumppad-ml-1270203041.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/movers.ml` as `movers` → [src/mq3/game/movers.ml](File-src-mq3-game-movers-ml-1935580466.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/game/targets.ml` as `targets` → [src/mq3/game/targets.ml](File-src-mq3-game-targets-ml-1419507080.md)
- `mq3/game/teleport.ml` as `teleport` → [src/mq3/game/teleport.ml](File-src-mq3-game-teleport-ml-594448221.md)
- `mq3/shared/directions.ml` as `directions` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-g-trigger-aimattarget-function-aimattarget-level-self-src-mq3-game-g-trigger-ml-1748455648"></a>
### AimAtTarget

```ml
function AimAtTarget(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L101)

<a id="function-function-mq3-game-g-trigger-between-function-between-value-minimum-maximum-src-mq3-game-g-trigger-ml-744869395"></a>
### between

```ml
function between(value, minimum, maximum)
```

Kept because the historical symbol inventory picked the word from the g_trigger.c comments. It is also useful to contracts that describe the inclusive trigger ranges; it is not an upstream C function.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `minimum` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L29)

<a id="constant-constant-mq3-game-g-trigger-contents-trigger-const-contents-trigger-headers-contents-trigger-src-mq3-game-g-trigger-ml-1559554540"></a>
### CONTENTS_TRIGGER

```ml
const CONTENTS_TRIGGER = headers.CONTENTS_TRIGGER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L22)

<a id="constant-constant-mq3-game-g-trigger-frametime-const-frametime-100-src-mq3-game-g-trigger-ml-2096376290"></a>
### FRAMETIME

```ml
const FRAMETIME = 100
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L24)

<a id="function-function-mq3-game-g-trigger-func-timer-think-function-func-timer-think-level-self-src-mq3-game-g-trigger-ml-1824956066"></a>
### func_timer_think

```ml
function func_timer_think(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L201)

<a id="function-function-mq3-game-g-trigger-func-timer-use-function-func-timer-use-level-self-other-activator-src-mq3-game-g-trigger-ml-359357253"></a>
### func_timer_use

```ml
function func_timer_use(level, self, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L208)

<a id="function-function-mq3-game-g-trigger-hurt-touch-function-hurt-touch-level-self-other-trace-src-mq3-game-g-trigger-ml-18700875"></a>
### hurt_touch

```ml
function hurt_touch(level, self, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L179)

<a id="function-function-mq3-game-g-trigger-hurt-use-function-hurt-use-level-self-other-activator-src-mq3-game-g-trigger-ml-1243149985"></a>
### hurt_use

```ml
function hurt_use(level, self, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L174)

<a id="function-function-mq3-game-g-trigger-inittrigger-function-inittrigger-level-self-src-mq3-game-g-trigger-ml-1957817082"></a>
### InitTrigger

```ml
function InitTrigger(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L33)

<a id="function-function-mq3-game-g-trigger-multi-trigger-function-multi-trigger-level-ent-activator-src-mq3-game-g-trigger-ml-54969488"></a>
### multi_trigger

```ml
function multi_trigger(level, ent, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L47)

<a id="function-function-mq3-game-g-trigger-multi-wait-function-multi-wait-level-ent-src-mq3-game-g-trigger-ml-1599389707"></a>
### multi_wait

```ml
function multi_wait(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L42)

<a id="function-function-mq3-game-g-trigger-sp-func-timer-function-sp-func-timer-level-self-src-mq3-game-g-trigger-ml-848011862"></a>
### SP_func_timer

```ml
function SP_func_timer(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L214)

<a id="function-function-mq3-game-g-trigger-sp-target-push-function-sp-target-push-level-self-src-mq3-game-g-trigger-ml-525313290"></a>
### SP_target_push

```ml
function SP_target_push(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L141)

<a id="function-function-mq3-game-g-trigger-sp-trigger-always-function-sp-trigger-always-level-ent-src-mq3-game-g-trigger-ml-1078765967"></a>
### SP_trigger_always

```ml
function SP_trigger_always(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L90)

<a id="function-function-mq3-game-g-trigger-sp-trigger-hurt-function-sp-trigger-hurt-level-self-src-mq3-game-g-trigger-ml-1087340914"></a>
### SP_trigger_hurt

```ml
function SP_trigger_hurt(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L190)

<a id="function-function-mq3-game-g-trigger-sp-trigger-multiple-function-sp-trigger-multiple-level-ent-src-mq3-game-g-trigger-ml-644898245"></a>
### SP_trigger_multiple

```ml
function SP_trigger_multiple(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L73)

<a id="function-function-mq3-game-g-trigger-sp-trigger-push-function-sp-trigger-push-level-self-src-mq3-game-g-trigger-ml-1230926440"></a>
### SP_trigger_push

```ml
function SP_trigger_push(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L119)

<a id="function-function-mq3-game-g-trigger-sp-trigger-teleport-function-sp-trigger-teleport-level-self-src-mq3-game-g-trigger-ml-2080722026"></a>
### SP_trigger_teleport

```ml
function SP_trigger_teleport(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L164)

<a id="constant-constant-mq3-game-g-trigger-svf-noclient-const-svf-noclient-1-src-mq3-game-g-trigger-ml-210703908"></a>
### SVF_NOCLIENT

```ml
const SVF_NOCLIENT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L23)

<a id="function-function-mq3-game-g-trigger-touch-multi-function-touch-multi-level-self-other-trace-src-mq3-game-g-trigger-ml-1139128053"></a>
### Touch_Multi

```ml
function Touch_Multi(level, self, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L68)

<a id="function-function-mq3-game-g-trigger-trigger-always-think-function-trigger-always-think-level-ent-src-mq3-game-g-trigger-ml-1021407515"></a>
### trigger_always_think

```ml
function trigger_always_think(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L85)

<a id="function-function-mq3-game-g-trigger-trigger-push-touch-function-trigger-push-touch-level-self-other-trace-src-mq3-game-g-trigger-ml-799395799"></a>
### trigger_push_touch

```ml
function trigger_push_touch(level, self, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L95)

<a id="function-function-mq3-game-g-trigger-trigger-teleporter-touch-function-trigger-teleporter-touch-level-self-other-trace-src-mq3-game-g-trigger-ml-245538223"></a>
### trigger_teleporter_touch

```ml
function trigger_teleporter_touch(level, self, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L155)

<a id="function-function-mq3-game-g-trigger-use-multi-function-use-multi-level-ent-other-activator-src-mq3-game-g-trigger-ml-631034130"></a>
### Use_Multi

```ml
function Use_Multi(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L64)

<a id="function-function-mq3-game-g-trigger-use-target-push-function-use-target-push-level-self-other-activator-src-mq3-game-g-trigger-ml-1567165669"></a>
### Use_target_push

```ml
function Use_target_push(level, self, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_trigger.ml#L129)
