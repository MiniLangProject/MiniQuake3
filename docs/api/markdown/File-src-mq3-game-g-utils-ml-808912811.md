# `src/mq3/game/g_utils.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_utils`](Package-mq3-game-g-utils-1579513381.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/game/targets.ml` as `targets` → [src/mq3/game/targets.ml](File-src-mq3-game-targets-ml-1419507080.md)
- `mq3/game/teleport.ml` as `teleport` → [src/mq3/game/teleport.ml](File-src-mq3-game-teleport-ml-594448221.md)
- `mq3/shared/directions.ml` as `directions` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-g-utils-addremap-function-addremap-level-oldshader-newshader-timeoffset-src-mq3-game-g-utils-ml-75206145"></a>
### AddRemap

```ml
function AddRemap(level, oldShader, newShader, timeOffset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `oldShader` | `dynamic` | — |  |
| `newShader` | `dynamic` | — |  |
| `timeOffset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L61)

<a id="function-function-mq3-game-g-utils-buildshaderstateconfig-function-buildshaderstateconfig-level-src-mq3-game-g-utils-ml-2062757494"></a>
### BuildShaderStateConfig

```ml
function BuildShaderStateConfig(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L65)

<a id="function-function-mq3-game-g-utils-debugline-function-debugline-start-finish-color-createfn-context-src-mq3-game-g-utils-ml-972891297"></a>
### DebugLine

```ml
function DebugLine(start, finish, color, createFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `createFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L198)

<a id="function-function-mq3-game-g-utils-g-addevent-function-g-addevent-level-ent-event-eventparm-src-mq3-game-g-utils-ml-1929994329"></a>
### G_AddEvent

```ml
function G_AddEvent(level, ent, event, eventParm)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |
| `eventParm` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L182)

<a id="function-function-mq3-game-g-utils-g-addpredictableevent-function-g-addpredictableevent-level-ent-event-eventparm-src-mq3-game-g-utils-ml-861888125"></a>
### G_AddPredictableEvent

```ml
function G_AddPredictableEvent(level, ent, event, eventParm)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |
| `eventParm` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L174)

<a id="function-function-mq3-game-g-utils-g-entitiesfree-function-g-entitiesfree-level-src-mq3-game-g-utils-ml-1604907658"></a>
### G_EntitiesFree

```ml
function G_EntitiesFree(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L158)

<a id="function-function-mq3-game-g-utils-g-find-function-g-find-level-cursor-field-match-src-mq3-game-g-utils-ml-2080849275"></a>
### G_Find

```ml
function G_Find(level, cursor, field, match)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `cursor` | `dynamic` | — |  |
| `field` | `dynamic` | — |  |
| `match` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L101)

<a id="function-function-mq3-game-g-utils-g-findconfigstringindex-function-g-findconfigstringindex-level-name-start-max-create-src-mq3-game-g-utils-ml-1675771825"></a>
### G_FindConfigstringIndex

```ml
function G_FindConfigstringIndex(level, name, start, max, create)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `max` | `dynamic` | — |  |
| `create` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L69)

<a id="function-function-mq3-game-g-utils-g-freeentity-function-g-freeentity-level-ent-src-mq3-game-g-utils-ml-1721762751"></a>
### G_FreeEntity

```ml
function G_FreeEntity(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L162)

<a id="function-function-mq3-game-g-utils-g-initgentity-function-g-initgentity-ent-src-mq3-game-g-utils-ml-1722090267"></a>
### G_InitGentity

```ml
function G_InitGentity(ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L150)

<a id="function-function-mq3-game-g-utils-g-killbox-function-g-killbox-level-ent-src-mq3-game-g-utils-ml-1783476369"></a>
### G_KillBox

```ml
function G_KillBox(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L170)

<a id="function-function-mq3-game-g-utils-g-modelindex-function-g-modelindex-level-name-src-mq3-game-g-utils-ml-2132885939"></a>
### G_ModelIndex

```ml
function G_ModelIndex(level, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L73)

<a id="function-function-mq3-game-g-utils-g-picktarget-function-g-picktarget-level-targetname-src-mq3-game-g-utils-ml-84911592"></a>
### G_PickTarget

```ml
function G_PickTarget(level, targetname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `targetname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L114)

<a id="function-function-mq3-game-g-utils-g-setmovedir-function-g-setmovedir-angles-movedir-src-mq3-game-g-utils-ml-880358044"></a>
### G_SetMovedir

```ml
function G_SetMovedir(angles, movedir)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — |  |
| `movedir` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L132)

<a id="function-function-mq3-game-g-utils-g-setorigin-function-g-setorigin-ent-origin-src-mq3-game-g-utils-ml-282054333"></a>
### G_SetOrigin

```ml
function G_SetOrigin(ent, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L194)

<a id="function-function-mq3-game-g-utils-g-sound-function-g-sound-level-ent-channel-soundindex-src-mq3-game-g-utils-ml-17020299"></a>
### G_Sound

```ml
function G_Sound(level, ent, channel, soundIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |
| `soundIndex` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L190)

<a id="function-function-mq3-game-g-utils-g-soundindex-function-g-soundindex-level-name-src-mq3-game-g-utils-ml-1386850935"></a>
### G_SoundIndex

```ml
function G_SoundIndex(level, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L77)

<a id="function-function-mq3-game-g-utils-g-spawn-function-g-spawn-level-src-mq3-game-g-utils-ml-488110004"></a>
### G_Spawn

```ml
function G_Spawn(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L154)

<a id="function-function-mq3-game-g-utils-g-teamcommand-function-g-teamcommand-level-team-cmd-src-mq3-game-g-utils-ml-591989161"></a>
### G_TeamCommand

```ml
function G_TeamCommand(level, team, cmd)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `cmd` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L81)

<a id="function-function-mq3-game-g-utils-g-tempentity-function-g-tempentity-level-origin-event-src-mq3-game-g-utils-ml-353618446"></a>
### G_TempEntity

```ml
function G_TempEntity(level, origin, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L166)

<a id="function-function-mq3-game-g-utils-g-usetargets-function-g-usetargets-level-ent-activator-src-mq3-game-g-utils-ml-208348862"></a>
### G_UseTargets

```ml
function G_UseTargets(level, ent, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L118)

<a id="constant-constant-mq3-game-g-utils-maxchoices-const-maxchoices-32-src-mq3-game-g-utils-ml-649767850"></a>
### MAXCHOICES

```ml
const MAXCHOICES = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L17)

<a id="function-function-mq3-game-g-utils-namesequal-function-namesequal-first-second-src-mq3-game-g-utils-ml-1677218458"></a>
### namesEqual

```ml
function namesEqual(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L29)

<a id="function-function-mq3-game-g-utils-nativetext-function-nativetext-text-src-mq3-game-g-utils-ml-2005247959"></a>
### nativeText

```ml
function nativeText(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L19)

<a id="function-function-mq3-game-g-utils-stringfield-function-stringfield-ent-field-src-mq3-game-g-utils-ml-1903649065"></a>
### stringField

```ml
function stringField(ent, field)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |
| `field` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L46)

<a id="function-function-mq3-game-g-utils-tv-function-tv-x-y-z-src-mq3-game-g-utils-ml-1046810685"></a>
### tv

```ml
function tv(x, y, z)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `z` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L122)

<a id="function-function-mq3-game-g-utils-vectoyaw-function-vectoyaw-vector-src-mq3-game-g-utils-ml-1205583111"></a>
### vectoyaw

```ml
function vectoyaw(vector)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vector` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L140)

<a id="function-function-mq3-game-g-utils-vtos-function-vtos-level-vector-src-mq3-game-g-utils-ml-959688515"></a>
### vtos

```ml
function vtos(level, vector)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `vector` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_utils.ml#L128)
