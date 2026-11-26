# `src/mq3/game/map_targets.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.map_targets`](Package-mq3-game-map-targets-1396279701.md)

Reachable from entry: **no**

## Imports

- `mq3/collision/brush.ml` as `mapTargetBrush` → [src/mq3/collision/brush.ml](File-src-mq3-collision-brush-ml-582513812.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `mapTargetEntities` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/g_utils.ml` as `gUtils` → [src/mq3/game/g_utils.ml](File-src-mq3-game-g-utils-ml-808912811.md)
- `mq3/game/items.ml` as `mapTargetItems` → [src/mq3/game/items.ml](File-src-mq3-game-items-ml-152650830.md)
- `mq3/game/movement.ml` as `mapTargetMovement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/scores.ml` as `mapTargetScores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)

## Declarations

<a id="function-function-mq3-game-map-targets-givespawn-function-givespawn-level-ent-src-mq3-game-map-targets-ml-949800287"></a>
### giveSpawn

```ml
function giveSpawn(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L83)

<a id="function-function-mq3-game-map-targets-giveuse-function-giveuse-level-ent-other-activator-src-mq3-game-map-targets-ml-1482904080"></a>
### giveUse

```ml
function giveUse(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L60)

<a id="function-function-mq3-game-map-targets-maptargetscentercommand-function-maptargetscentercommand-ent-src-mq3-game-map-targets-ml-2007632639"></a>
### mapTargetsCenterCommand

```ml
function mapTargetsCenterCommand(ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L125)

<a id="function-function-mq3-game-map-targets-maptargetsclientlimit-function-maptargetsclientlimit-level-src-mq3-game-map-targets-ml-974661046"></a>
### mapTargetsClientLimit

```ml
function mapTargetsClientLimit(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L23)

<a id="function-function-mq3-game-map-targets-maptargetsentity-function-maptargetsentity-ent-src-mq3-game-map-targets-ml-1364278819"></a>
### mapTargetsEntity

```ml
function mapTargetsEntity(ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L13)

<a id="function-function-mq3-game-map-targets-maptargetsentitylimit-function-maptargetsentitylimit-level-src-mq3-game-map-targets-ml-83868818"></a>
### mapTargetsEntityLimit

```ml
function mapTargetsEntityLimit(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L17)

<a id="function-function-mq3-game-map-targets-maptargetsnamesequal-function-maptargetsnamesequal-first-second-src-mq3-game-map-targets-ml-445154546"></a>
### mapTargetsNamesEqual

```ml
function mapTargetsNamesEqual(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L41)

<a id="function-function-mq3-game-map-targets-maptargetspowerups-function-maptargetspowerups-activator-src-mq3-game-map-targets-ml-742300405"></a>
### mapTargetsPowerups

```ml
function mapTargetsPowerups(activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L87)

<a id="function-function-mq3-game-map-targets-maptargetsteamcommand-function-maptargetsteamcommand-level-team-command-src-mq3-game-map-targets-ml-695246890"></a>
### mapTargetsTeamCommand

```ml
function mapTargetsTeamCommand(level, team, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L130)

<a id="function-function-mq3-game-map-targets-maptargetstext-function-maptargetstext-text-limit-src-mq3-game-map-targets-ml-1044513422"></a>
### mapTargetsText

```ml
function mapTargetsText(text, limit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L29)

<a id="function-function-mq3-game-map-targets-printspawn-function-printspawn-level-ent-src-mq3-game-map-targets-ml-910607175"></a>
### printSpawn

```ml
function printSpawn(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L151)

<a id="function-function-mq3-game-map-targets-printuse-function-printuse-level-ent-other-activator-src-mq3-game-map-targets-ml-782448328"></a>
### printUse

```ml
function printUse(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L135)

<a id="function-function-mq3-game-map-targets-removepowerupsspawn-function-removepowerupsspawn-level-ent-src-mq3-game-map-targets-ml-1364910679"></a>
### removePowerupsSpawn

```ml
function removePowerupsSpawn(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L109)

<a id="function-function-mq3-game-map-targets-removepowerupsuse-function-removepowerupsuse-level-ent-other-activator-src-mq3-game-map-targets-ml-697155128"></a>
### removePowerupsUse

```ml
function removePowerupsUse(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L94)

<a id="function-function-mq3-game-map-targets-scorespawn-function-scorespawn-level-ent-src-mq3-game-map-targets-ml-1564610795"></a>
### scoreSpawn

```ml
function scoreSpawn(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L119)

<a id="function-function-mq3-game-map-targets-scoreuse-function-scoreuse-level-ent-other-activator-src-mq3-game-map-targets-ml-1711340620"></a>
### scoreUse

```ml
function scoreUse(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/map_targets.ml#L113)
