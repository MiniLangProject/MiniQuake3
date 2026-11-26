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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `oldShader` | `dynamic` | — |  |
| `newShader` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L13)

<a id="function-function-mq3-game-targets-alwaysthink-function-alwaysthink-level-ent-src-mq3-game-targets-ml-1663571773"></a>
### alwaysThink

```ml
function alwaysThink(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L117)

<a id="function-function-mq3-game-targets-delaythink-function-delaythink-level-ent-src-mq3-game-targets-ml-700729611"></a>
### delayThink

```ml
function delayThink(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L64)

<a id="function-function-mq3-game-targets-delaytime-function-delaytime-level-ent-src-mq3-game-targets-ml-917739771"></a>
### delayTime

```ml
function delayTime(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L58)

<a id="function-function-mq3-game-targets-delayuse-function-delayuse-level-ent-other-activator-src-mq3-game-targets-ml-866201832"></a>
### delayUse

```ml
function delayUse(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L67)

<a id="function-function-mq3-game-targets-locationlinkup-function-locationlinkup-level-ent-src-mq3-game-targets-ml-884236067"></a>
### locationLinkup

```ml
function locationLinkup(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L153)

<a id="function-function-mq3-game-targets-multitouch-function-multitouch-level-ent-other-trace-src-mq3-game-targets-ml-317557758"></a>
### multiTouch

```ml
function multiTouch(level, ent, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L113)

<a id="function-function-mq3-game-targets-multitrigger-function-multitrigger-level-ent-activator-src-mq3-game-targets-ml-813462460"></a>
### multiTrigger

```ml
function multiTrigger(level, ent, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L98)

<a id="function-function-mq3-game-targets-multiuse-function-multiuse-level-ent-other-activator-src-mq3-game-targets-ml-1683051264"></a>
### multiUse

```ml
function multiUse(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L110)

<a id="function-function-mq3-game-targets-multiwait-function-multiwait-level-ent-src-mq3-game-targets-ml-133815775"></a>
### multiWait

```ml
function multiWait(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L94)

<a id="function-function-mq3-game-targets-pushuse-function-pushuse-level-ent-other-activator-src-mq3-game-targets-ml-1513291566"></a>
### pushUse

```ml
function pushUse(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L133)

<a id="function-function-mq3-game-targets-relayuse-function-relayuse-level-ent-other-activator-src-mq3-game-targets-ml-1531265884"></a>
### relayUse

```ml
function relayUse(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L78)

<a id="function-function-mq3-game-targets-shaderstate-function-shaderstate-level-src-mq3-game-targets-ml-794820752"></a>
### shaderState

```ml
function shaderState(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L27)

<a id="function-function-mq3-game-targets-speakeruse-function-speakeruse-level-ent-other-activator-src-mq3-game-targets-ml-228338356"></a>
### speakerUse

```ml
function speakerUse(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L121)

<a id="function-function-mq3-game-targets-teamallowed-function-teamallowed-ent-activator-src-mq3-game-targets-ml-1996986236"></a>
### teamAllowed

```ml
function teamAllowed(ent, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L71)

<a id="function-function-mq3-game-targets-teleporteruse-function-teleporteruse-level-ent-other-activator-src-mq3-game-targets-ml-616924486"></a>
### teleporterUse

```ml
function teleporterUse(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L87)

<a id="function-function-mq3-game-targets-timerthink-function-timerthink-level-ent-src-mq3-game-targets-ml-619784935"></a>
### timerThink

```ml
function timerThink(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L142)

<a id="function-function-mq3-game-targets-timeruse-function-timeruse-level-ent-other-activator-src-mq3-game-targets-ml-632715412"></a>
### timerUse

```ml
function timerUse(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L148)

<a id="function-function-mq3-game-targets-usetargets-function-usetargets-level-ent-activator-src-mq3-game-targets-ml-786178704"></a>
### useTargets

```ml
function useTargets(level, ent, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/targets.ml#L40)
