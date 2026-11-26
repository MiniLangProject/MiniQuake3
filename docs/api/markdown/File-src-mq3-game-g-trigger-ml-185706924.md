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

Update `self.s.origin2` and `self.s.origin2[2]` during `AimAtTarget`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `r`, `target` and `s`. May update `self.s.origin2` and `self.s.origin2[2]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L144)

<a id="function-function-mq3-game-g-trigger-between-function-between-value-minimum-maximum-src-mq3-game-g-trigger-ml-744869395"></a>
### between

```ml
function between(value, minimum, maximum)
```

Kept because the historical symbol inventory picked the word from the g_trigger.c comments. It is also useful to contracts that describe the inclusive trigger ranges; it is not an upstream C function.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value >= minimum and value <= maximum`. |
| `minimum` | `dynamic` | — | Operand used to evaluate the returned expression `value >= minimum and value <= maximum`. |
| `maximum` | `dynamic` | — | Upper bound applied by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L35)

<a id="constant-constant-mq3-game-g-trigger-contents-trigger-const-contents-trigger-headers-contents-trigger-src-mq3-game-g-trigger-ml-1559554540"></a>
### CONTENTS_TRIGGER

```ml
const CONTENTS_TRIGGER = headers.CONTENTS_TRIGGER
```

Collision-contents bit identifying trigger space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L23)

<a id="constant-constant-mq3-game-g-trigger-frametime-const-frametime-100-src-mq3-game-g-trigger-ml-2096376290"></a>
### FRAMETIME

```ml
const FRAMETIME = 100
```

Nominal game frame duration in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L27)

<a id="function-function-mq3-game-g-trigger-func-timer-think-function-func-timer-think-level-self-src-mq3-game-g-trigger-ml-1824956066"></a>
### func_timer_think

```ml
function func_timer_think(level, self)
```

Update `self.nextthink` during `func_timer_think`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `activator`, `nextthink`, `wait` and `random`. May update `self.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L279)

<a id="function-function-mq3-game-g-trigger-func-timer-use-function-func-timer-use-level-self-other-activator-src-mq3-game-g-trigger-ml-359357253"></a>
### func_timer_use

```ml
function func_timer_use(level, self, other, activator)
```

Set `self.activator` to `activator` and `self.nextthink` to `0` in `mq3.game.g_trigger.func_timer_use`. Return paths include `func_timer_think(level,self)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `activator` and `nextthink`. May update `self.activator` and `self.nextthink` in place. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `func_timer_use` signature. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L291)

<a id="function-function-mq3-game-g-trigger-hurt-touch-function-hurt-touch-level-self-other-trace-src-mq3-game-g-trigger-ml-18700875"></a>
### hurt_touch

```ml
function hurt_touch(level, self, other, trace)
```

Set `self.timestamp` to `n.add32(level.time,1000)` and `self.timestamp` to `n.add32(level.time,FRAMETIME)` in `mq3.game.g_trigger.hurt_touch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `timestamp`, `spawnflags`, `noise_index` and `damage`. May update `self.timestamp` in place. |
| `other` | `dynamic` | — | Other record; accesses `takedamage`. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `hurt_touch` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L251)

<a id="function-function-mq3-game-g-trigger-hurt-use-function-hurt-use-level-self-other-activator-src-mq3-game-g-trigger-ml-1243149985"></a>
### hurt_use

```ml
function hurt_use(level, self, other, activator)
```

Apply `mq3.game.entities.unlink` and `mq3.game.entities.link` while evaluating `hurt_use`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `r`. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `hurt_use` signature. |
| `activator` | `dynamic` | — | Not read by this implementation; retained in the `hurt_use` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L241)

<a id="function-function-mq3-game-g-trigger-inittrigger-function-inittrigger-level-self-src-mq3-game-g-trigger-ml-1957817082"></a>
### InitTrigger

```ml
function InitTrigger(level, self)
```

Update `self.movedir`, `self.s.angles`, `self.r.contents` and `self.r.svFlags` during `InitTrigger`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`, `movedir`, `model` and `r`. May update `self.movedir`, `self.s.angles` and `self.r.contents` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L42)

<a id="function-function-mq3-game-g-trigger-multi-trigger-function-multi-trigger-level-ent-activator-src-mq3-game-g-trigger-ml-54969488"></a>
### multi_trigger

```ml
function multi_trigger(level, ent, activator)
```

Update `ent.activator`, `ent.think`, `ent.nextthink` and `ent.touch` during `multi_trigger`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `activator`, `nextthink`, `spawnflags`, `wait` and `think` and related fields. May update `ent.activator`, `ent.think` and `ent.nextthink` and additional fields in place. |
| `activator` | `dynamic` | — | Activator record; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L63)

<a id="function-function-mq3-game-g-trigger-multi-wait-function-multi-wait-level-ent-src-mq3-game-g-trigger-ml-1599389707"></a>
### multi_wait

```ml
function multi_wait(level, ent)
```

Set `ent.nextthink` to `0` in `mq3.game.g_trigger.multi_wait`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `multi_wait` signature. |
| `ent` | `dynamic` | — | Game entity; accesses `nextthink`. May update `ent.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L54)

<a id="function-function-mq3-game-g-trigger-sp-func-timer-function-sp-func-timer-level-self-src-mq3-game-g-trigger-ml-848011862"></a>
### SP_func_timer

```ml
function SP_func_timer(level, self)
```

Update `self.random`, `self.wait`, `self.use` and `self.think` and related state during `SP_func_timer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `random`, `wait`, `use`, `think` and `s` and related fields. May update `self.random`, `self.wait` and `self.use` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L300)

<a id="function-function-mq3-game-g-trigger-sp-target-push-function-sp-target-push-level-self-src-mq3-game-g-trigger-ml-525313290"></a>
### SP_target_push

```ml
function SP_target_push(level, self)
```

Update `self.speed`, `self.s.origin2`, `self.s.angles` and `self.noise_index` and related state during `SP_target_push`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `speed`, `s`, `spawnflags`, `noise_index` and `target` and related fields. May update `self.speed`, `self.s.origin2` and `self.s.angles` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L195)

<a id="function-function-mq3-game-g-trigger-sp-trigger-always-function-sp-trigger-always-level-ent-src-mq3-game-g-trigger-ml-1078765967"></a>
### SP_trigger_always

```ml
function SP_trigger_always(level, ent)
```

Set `ent.nextthink` to `n.add32(level.time,300)` and `ent.think` to `trigger_always_think` in `mq3.game.g_trigger.SP_trigger_always`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `nextthink` and `think`. May update `ent.nextthink` and `ent.think` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L125)

<a id="function-function-mq3-game-g-trigger-sp-trigger-hurt-function-sp-trigger-hurt-level-self-src-mq3-game-g-trigger-ml-1087340914"></a>
### SP_trigger_hurt

```ml
function SP_trigger_hurt(level, self)
```

Update `self.noise_index`, `self.touch`, `self.damage` and `self.r.contents` and related state during `SP_trigger_hurt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `noise_index`, `touch`, `damage`, `r` and `spawnflags` and related fields. May update `self.noise_index`, `self.touch` and `self.damage` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L265)

<a id="function-function-mq3-game-g-trigger-sp-trigger-multiple-function-sp-trigger-multiple-level-ent-src-mq3-game-g-trigger-ml-644898245"></a>
### SP_trigger_multiple

```ml
function SP_trigger_multiple(level, ent)
```

Update `ent.wait`, `ent.random`, `ent.touch` and `ent.use` during `SP_trigger_multiple`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `wait`, `random`, `touch` and `use`. May update `ent.wait`, `ent.random` and `ent.touch` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L102)

<a id="function-function-mq3-game-g-trigger-sp-trigger-push-function-sp-trigger-push-level-self-src-mq3-game-g-trigger-ml-1230926440"></a>
### SP_trigger_push

```ml
function SP_trigger_push(level, self)
```

Update `self.r.svFlags`, `self.s.eType`, `self.touch` and `self.think` and related state during `SP_trigger_push`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `r`, `s`, `touch`, `think` and `nextthink`. May update `self.r.svFlags`, `self.s.eType` and `self.touch` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L165)

<a id="function-function-mq3-game-g-trigger-sp-trigger-teleport-function-sp-trigger-teleport-level-self-src-mq3-game-g-trigger-ml-2080722026"></a>
### SP_trigger_teleport

```ml
function SP_trigger_teleport(level, self)
```

Update `self.r.svFlags`, `self.s.eType` and `self.touch` during `SP_trigger_teleport`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `spawnflags`, `r`, `s` and `touch`. May update `self.r.svFlags`, `self.s.eType` and `self.touch` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L226)

<a id="constant-constant-mq3-game-g-trigger-svf-noclient-const-svf-noclient-1-src-mq3-game-g-trigger-ml-210703908"></a>
### SVF_NOCLIENT

```ml
const SVF_NOCLIENT = 1
```

Server entity-flag bit controlling noclient.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L25)

<a id="function-function-mq3-game-g-trigger-touch-multi-function-touch-multi-level-self-other-trace-src-mq3-game-g-trigger-ml-1139128053"></a>
### Touch_Multi

```ml
function Touch_Multi(level, self, other, trace)
```

Apply `mq3.game.g_trigger.multi_trigger` while evaluating `Touch_Multi`. Return paths include `multi_trigger(level,self,other)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Game entity; accesses `activator`, `nextthink`, `spawnflags`, `wait` and `think` and related fields. May update `self.activator`, `self.think` and `self.nextthink` and additional fields in place. |
| `other` | `dynamic` | — | Other record; accesses `client`. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `Touch_Multi` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L94)

<a id="function-function-mq3-game-g-trigger-trigger-always-think-function-trigger-always-think-level-ent-src-mq3-game-g-trigger-ml-1021407515"></a>
### trigger_always_think

```ml
function trigger_always_think(level, ent)
```

Apply `mq3.game.targets.useTargets` and `mq3.game.entities.free` while evaluating `trigger_always_think`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `spawner`, `num_entities` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `targetShaderName`, `targetShaderNewName`, `target` and `inuse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L117)

<a id="function-function-mq3-game-g-trigger-trigger-push-touch-function-trigger-push-touch-level-self-other-trace-src-mq3-game-g-trigger-ml-799395799"></a>
### trigger_push_touch

```ml
function trigger_push_touch(level, self, other, trace)
```

Apply `mq3.game.jumppad.touch` while evaluating `trigger_push_touch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `trigger_push_touch` signature. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`. |
| `other` | `dynamic` | — | Other record; accesses `client`. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `trigger_push_touch` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L135)

<a id="function-function-mq3-game-g-trigger-trigger-teleporter-touch-function-trigger-teleporter-touch-level-self-other-trace-src-mq3-game-g-trigger-ml-245538223"></a>
### trigger_teleporter_touch

```ml
function trigger_teleporter_touch(level, self, other, trace)
```

Apply `mq3.game.entities.pickTarget`, `mq3.game.entities.diagnostic` and `mq3.game.teleport.player` while evaluating `trigger_teleporter_touch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `spawnflags` and `target`. |
| `other` | `dynamic` | — | Other record; accesses `client`. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `trigger_teleporter_touch` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L214)

<a id="function-function-mq3-game-g-trigger-use-multi-function-use-multi-level-ent-other-activator-src-mq3-game-g-trigger-ml-631034130"></a>
### Use_Multi

```ml
function Use_Multi(level, ent, other, activator)
```

Forward `Use_Multi` to `mq3.game.g_trigger.multi_trigger` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `activator`, `nextthink`, `spawnflags`, `wait` and `think` and related fields. May update `ent.activator`, `ent.think` and `ent.nextthink` and additional fields in place. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `Use_Multi` signature. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L85)

<a id="function-function-mq3-game-g-trigger-use-target-push-function-use-target-push-level-self-other-activator-src-mq3-game-g-trigger-ml-1567165669"></a>
### Use_target_push

```ml
function Use_target_push(level, self, other, activator)
```

Set `activator.client.ps.velocity` to `movement.copy(self.s.origin2)` and `activator.fly_sound_debounce_time` to `n.add32(level.time,1500)` in `mq3.game.g_trigger.Use_target_push`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s` and `noise_index`. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `Use_target_push` signature. |
| `activator` | `dynamic` | — | Activator record; accesses `client` and `fly_sound_debounce_time`. May update `activator.client.ps.velocity` and `activator.fly_sound_debounce_time` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_trigger.ml#L180)
