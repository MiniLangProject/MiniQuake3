# `src/mq3/game/targets.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.targets`](Package-mq3-game-targets-543434792.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/game/teleport.ml` as `teleport` → [src/mq3/game/teleport.ml](File-src-mq3-game-teleport-ml-594448221.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-targets-addremap-function-addremap-level-oldshader-newshader-time-src-mq3-game-targets-ml-148871310"></a>
### addRemap

```ml
function addRemap(level, oldShader, newShader, time)
```

Set `level.shaderRemaps` to `level.shaderRemaps+[[oldShader,newShader,time]]` in `mq3.game.targets.addRemap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `shaderRemaps`. May update `level.shaderRemaps` in place. |
| `oldShader` | `dynamic` | — | Value passed as argument 1 to `std.string.equalsIgnoreCaseAscii`. |
| `newShader` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L18)

<a id="function-function-mq3-game-targets-alwaysthink-function-alwaysthink-level-ent-src-mq3-game-targets-ml-1663571773"></a>
### alwaysThink

```ml
function alwaysThink(level, ent)
```

Apply `mq3.game.targets.useTargets` and `mq3.game.entities.free` while evaluating `alwaysThink`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `spawner`, `num_entities` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `targetShaderName`, `targetShaderNewName`, `target` and `inuse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L172)

<a id="function-function-mq3-game-targets-delaythink-function-delaythink-level-ent-src-mq3-game-targets-ml-700729611"></a>
### delayThink

```ml
function delayThink(level, ent)
```

Forward `delayThink` to `mq3.game.targets.useTargets` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `spawner`, `num_entities` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `activator`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L81)

<a id="function-function-mq3-game-targets-delaytime-function-delaytime-level-ent-src-mq3-game-targets-ml-917739771"></a>
### delayTime

```ml
function delayTime(level, ent)
```

Apply `mq3.game.entities.random` while evaluating `delayTime`. Return paths include `textnum.truncDouble32(time)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `wait` and `random`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L72)

<a id="function-function-mq3-game-targets-delayuse-function-delayuse-level-ent-other-activator-src-mq3-game-targets-ml-866201832"></a>
### delayUse

```ml
function delayUse(level, ent, other, activator)
```

Update `ent.nextthink`, `ent.think` and `ent.activator` during `delayUse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `nextthink`, `think` and `activator`. May update `ent.nextthink`, `ent.think` and `ent.activator` in place. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `delayUse` signature. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L89)

<a id="function-function-mq3-game-targets-locationlinkup-function-locationlinkup-level-ent-src-mq3-game-targets-ml-884236067"></a>
### locationLinkup

```ml
function locationLinkup(level, ent)
```

Update `level.locationLinked` and `level.locationHead` during `locationLinkup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `locationLinked`, `locationHead`, `spawner`, `num_entities` and `entities`. May update `level.locationLinked` and `level.locationHead` in place. |
| `ent` | `dynamic` | — | Not read by this implementation; retained in the `locationLinkup` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L229)

<a id="function-function-mq3-game-targets-multitouch-function-multitouch-level-ent-other-trace-src-mq3-game-targets-ml-317557758"></a>
### multiTouch

```ml
function multiTouch(level, ent, other, trace)
```

Apply `mq3.game.targets.multiTrigger` while evaluating `multiTouch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `activator`, `nextthink`, `wait`, `think` and `touch`. May update `ent.activator`, `ent.think` and `ent.nextthink` and additional fields in place. |
| `other` | `dynamic` | — | Other record; accesses `client`. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `multiTouch` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L165)

<a id="function-function-mq3-game-targets-multitrigger-function-multitrigger-level-ent-activator-src-mq3-game-targets-ml-813462460"></a>
### multiTrigger

```ml
function multiTrigger(level, ent, activator)
```

Update `ent.activator`, `ent.think`, `ent.nextthink` and `ent.touch` during `multiTrigger`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `activator`, `nextthink`, `wait`, `think` and `touch`. May update `ent.activator`, `ent.think` and `ent.nextthink` and additional fields in place. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L140)

<a id="function-function-mq3-game-targets-multiuse-function-multiuse-level-ent-other-activator-src-mq3-game-targets-ml-1683051264"></a>
### multiUse

```ml
function multiUse(level, ent, other, activator)
```

Forward `multiUse` to `mq3.game.targets.multiTrigger` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `activator`, `nextthink`, `wait`, `think` and `touch`. May update `ent.activator`, `ent.think` and `ent.nextthink` and additional fields in place. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `multiUse` signature. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L157)

<a id="function-function-mq3-game-targets-multiwait-function-multiwait-level-ent-src-mq3-game-targets-ml-133815775"></a>
### multiWait

```ml
function multiWait(level, ent)
```

Set `ent.nextthink` to `0` in `mq3.game.targets.multiWait`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `multiWait` signature. |
| `ent` | `dynamic` | — | Game entity; accesses `nextthink`. May update `ent.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L132)

<a id="function-function-mq3-game-targets-pushuse-function-pushuse-level-ent-other-activator-src-mq3-game-targets-ml-1513291566"></a>
### pushUse

```ml
function pushUse(level, ent, other, activator)
```

Set `activator.client.ps.velocity` to `movement.copy(ent.s.origin2)` and `activator.fly_sound_debounce_time` to `n.add32(level.time,1500)` in `mq3.game.targets.pushUse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s` and `noise_index`. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `pushUse` signature. |
| `activator` | `dynamic` | — | Activator record; accesses `client` and `fly_sound_debounce_time`. May update `activator.client.ps.velocity` and `activator.fly_sound_debounce_time` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L198)

<a id="function-function-mq3-game-targets-relayuse-function-relayuse-level-ent-other-activator-src-mq3-game-targets-ml-1531265884"></a>
### relayUse

```ml
function relayUse(level, ent, other, activator)
```

Apply `mq3.game.targets.teamAllowed`, `mq3.game.entities.pickTarget` and `mq3.game.targets.useTargets` while evaluating `relayUse`. Return paths include `useTargets(level,ent,activator)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `spawnflags` and `target`. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `relayUse` signature. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L108)

<a id="function-function-mq3-game-targets-shaderstate-function-shaderstate-level-src-mq3-game-targets-ml-794820752"></a>
### shaderState

```ml
function shaderState(level)
```

Serialize shader remappings into the bounded configuration-string representation, including remap time values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `shaderRemaps`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L34)

<a id="function-function-mq3-game-targets-speakeruse-function-speakeruse-level-ent-other-activator-src-mq3-game-targets-ml-228338356"></a>
### speakerUse

```ml
function speakerUse(level, ent, other, activator)
```

Set `ent.s.loopSound` to `0` and `ent.s.loopSound` to `ent.noise_index` in `mq3.game.targets.speakerUse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `spawnflags`, `s` and `noise_index`. May update `ent.s.loopSound` in place. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `speakerUse` signature. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L181)

<a id="function-function-mq3-game-targets-teamallowed-function-teamallowed-ent-activator-src-mq3-game-targets-ml-1996986236"></a>
### teamAllowed

```ml
function teamAllowed(ent, activator)
```

Apply target spawnflag restrictions to red- or blue-team client activators.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `spawnflags`. |
| `activator` | `dynamic` | — | Activator record; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L96)

<a id="function-function-mq3-game-targets-teleporteruse-function-teleporteruse-level-ent-other-activator-src-mq3-game-targets-ml-616924486"></a>
### teleporterUse

```ml
function teleporterUse(level, ent, other, activator)
```

Apply `mq3.game.entities.pickTarget`, `mq3.game.teleport.player` and `mq3.game.entities.diagnostic` while evaluating `teleporterUse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `target`. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `teleporterUse` signature. |
| `activator` | `dynamic` | — | Activator record; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L122)

<a id="function-function-mq3-game-targets-timerthink-function-timerthink-level-ent-src-mq3-game-targets-ml-619784935"></a>
### timerThink

```ml
function timerThink(level, ent)
```

Update `ent.nextthink` during `timerThink`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `activator`, `nextthink`, `wait` and `random`. May update `ent.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L210)

<a id="function-function-mq3-game-targets-timeruse-function-timeruse-level-ent-other-activator-src-mq3-game-targets-ml-632715412"></a>
### timerUse

```ml
function timerUse(level, ent, other, activator)
```

Set `ent.activator` to `activator` and `ent.nextthink` to `0` in `mq3.game.targets.timerUse`. Return paths include `timerThink(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `activator` and `nextthink`. May update `ent.activator` and `ent.nextthink` in place. |
| `other` | `dynamic` | — | Not read by this implementation; retained in the `timerUse` signature. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L221)

<a id="function-function-mq3-game-targets-usetargets-function-usetargets-level-ent-activator-src-mq3-game-targets-ml-786178704"></a>
### useTargets

```ml
function useTargets(level, ent, activator)
```

Apply `mq3.game.targets.addRemap`, `mq3.game.spawn_values.setConfig` and `mq3.game.targets.shaderState` while evaluating `useTargets`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `spawner`, `num_entities` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `targetShaderName`, `targetShaderNewName`, `target` and `inuse`. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L51)
