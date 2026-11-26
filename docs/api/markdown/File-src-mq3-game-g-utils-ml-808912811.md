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

Forward `AddRemap` to `mq3.game.targets.addRemap` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `shaderRemaps`. May update `level.shaderRemaps` in place. |
| `oldShader` | `dynamic` | — | Value passed as argument 1 to `std.string.equalsIgnoreCaseAscii`. |
| `newShader` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `timeOffset` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L75)

<a id="function-function-mq3-game-g-utils-buildshaderstateconfig-function-buildshaderstateconfig-level-src-mq3-game-g-utils-ml-2062757494"></a>
### BuildShaderStateConfig

```ml
function BuildShaderStateConfig(level)
```

Forward `BuildShaderStateConfig` to `mq3.game.targets.shaderState` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `shaderRemaps`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L81)

<a id="function-function-mq3-game-g-utils-debugline-function-debugline-start-finish-color-createfn-context-src-mq3-game-g-utils-ml-972891297"></a>
### DebugLine

```ml
function DebugLine(start, finish, color, createFn, context)
```

Apply `mq3.game.movement.copy` while evaluating `DebugLine`. Return paths include `createFn(context,color,points)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `color` | `dynamic` | — | Value passed as argument 2 to `createFn`. |
| `createFn` | `dynamic` | — | Operand used to evaluate the returned expression `createFn(context,color,points)`. |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L294)

<a id="function-function-mq3-game-g-utils-g-addevent-function-g-addevent-level-ent-event-eventparm-src-mq3-game-g-utils-ml-1929994329"></a>
### G_AddEvent

```ml
function G_AddEvent(level, ent, event, eventParm)
```

Apply `mq3.game.entities.diagnostic` and `mq3.game.events.add` while evaluating `G_AddEvent`. Return paths include `events.add(level,ent,event,eventParm)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `event` | `dynamic` | — | Player or entity event identifier. |
| `eventParm` | `dynamic` | — | Integer parameter stored alongside the player event. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L264)

<a id="function-function-mq3-game-g-utils-g-addpredictableevent-function-g-addpredictableevent-level-ent-event-eventparm-src-mq3-game-g-utils-ml-861888125"></a>
### G_AddPredictableEvent

```ml
function G_AddPredictableEvent(level, ent, event, eventParm)
```

Append a predictable event and parameter to the client player-state ring and increment its event sequence.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `G_AddPredictableEvent` signature. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. |
| `event` | `dynamic` | — | Player or entity event identifier. |
| `eventParm` | `dynamic` | — | Integer parameter stored alongside the player event. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L251)

<a id="function-function-mq3-game-g-utils-g-entitiesfree-function-g-entitiesfree-level-src-mq3-game-g-utils-ml-1604907658"></a>
### G_EntitiesFree

```ml
function G_EntitiesFree(level)
```

Forward `G_EntitiesFree` to `mq3.game.entities.entitiesFree` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L220)

<a id="function-function-mq3-game-g-utils-g-find-function-g-find-level-cursor-field-match-src-mq3-game-g-utils-ml-2080849275"></a>
### G_Find

```ml
function G_Find(level, cursor, field, match)
```

Apply `mq3.game.g_utils.namesEqual` and `mq3.game.g_utils.stringField` while evaluating `G_Find`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `cursor` | `dynamic` | — | Cursor record; accesses `slot`. |
| `field` | `dynamic` | — | Value used by `stringField` in `switch field`. |
| `match` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L138)

<a id="function-function-mq3-game-g-utils-g-findconfigstringindex-function-g-findconfigstringindex-level-name-start-max-create-src-mq3-game-g-utils-ml-1675771825"></a>
### G_FindConfigstringIndex

```ml
function G_FindConfigstringIndex(level, name, start, max, create)
```

Forward `G_FindConfigstringIndex` to `mq3.game.spawn_values.configIndex` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `start` | `dynamic` | — | Value used by `configIndex` in `if start < 0 or capacity < 1 or start+capacity > 1024 then return error(485,"Invalid configstring range") end if`. |
| `max` | `dynamic` | — | Maximum number of entries to allocate or retain. |
| `create` | `dynamic` | — | Value used by `configIndex` in `if not create then return 0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L91)

<a id="function-function-mq3-game-g-utils-g-freeentity-function-g-freeentity-level-ent-src-mq3-game-g-utils-ml-1721762751"></a>
### G_FreeEntity

```ml
function G_FreeEntity(level, ent)
```

Forward `G_FreeEntity` to `mq3.game.entities.free` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `neverFree`, `r`, `slot`, `s` and `client` and related fields. May update `ent.r`, `ent.s` and `ent.client` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L227)

<a id="function-function-mq3-game-g-utils-g-initgentity-function-g-initgentity-ent-src-mq3-game-g-utils-ml-1722090267"></a>
### G_InitGentity

```ml
function G_InitGentity(ent)
```

Forward `G_InitGentity` to `mq3.game.entities.initEntity` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `inuse`, `classname`, `s`, `slot` and `r`. May update `ent.inuse`, `ent.classname` and `ent.s.number` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L208)

<a id="function-function-mq3-game-g-utils-g-killbox-function-g-killbox-level-ent-src-mq3-game-g-utils-ml-1783476369"></a>
### G_KillBox

```ml
function G_KillBox(level, ent)
```

Forward `G_KillBox` to `mq3.game.teleport.killBox` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`, `entities` and `damageFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `client` and `r`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L242)

<a id="function-function-mq3-game-g-utils-g-modelindex-function-g-modelindex-level-name-src-mq3-game-g-utils-ml-2132885939"></a>
### G_ModelIndex

```ml
function G_ModelIndex(level, name)
```

Forward `G_ModelIndex` to `mq3.game.spawn_values.modelIndex` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L98)

<a id="function-function-mq3-game-g-utils-g-picktarget-function-g-picktarget-level-targetname-src-mq3-game-g-utils-ml-84911592"></a>
### G_PickTarget

```ml
function G_PickTarget(level, targetname)
```

Forward `G_PickTarget` to `mq3.game.entities.pickTarget` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`. |
| `targetname` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L154)

<a id="function-function-mq3-game-g-utils-g-setmovedir-function-g-setmovedir-angles-movedir-src-mq3-game-g-utils-ml-880358044"></a>
### G_SetMovedir

```ml
function G_SetMovedir(angles, movedir)
```

Set `movedir[axis]` to `result[axis]` and `angles[axis]` to `0.0` in `mq3.game.g_utils.G_SetMovedir`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. Entries may be updated in place. |
| `movedir` | `dynamic` | — | Array or byte sequence accessed at `axis`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L186)

<a id="function-function-mq3-game-g-utils-g-setorigin-function-g-setorigin-ent-origin-src-mq3-game-g-utils-ml-282054333"></a>
### G_SetOrigin

```ml
function G_SetOrigin(ent, origin)
```

Forward `G_SetOrigin` to `mq3.game.entities.setOrigin` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `s` and `r`. May update `ent.s.pos.trBase`, `ent.s.pos.trType` and `ent.s.pos.trTime` and additional fields in place. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L284)

<a id="function-function-mq3-game-g-utils-g-sound-function-g-sound-level-ent-channel-soundindex-src-mq3-game-g-utils-ml-17020299"></a>
### G_Sound

```ml
function G_Sound(level, ent, channel, soundIndex)
```

Forward `G_Sound` to `mq3.game.events.sound` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `r`. |
| `channel` | `dynamic` | — | Channel identifier for the requested action. |
| `soundIndex` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L277)

<a id="function-function-mq3-game-g-utils-g-soundindex-function-g-soundindex-level-name-src-mq3-game-g-utils-ml-1386850935"></a>
### G_SoundIndex

```ml
function G_SoundIndex(level, name)
```

Forward `G_SoundIndex` to `mq3.game.spawn_values.soundIndex` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L105)

<a id="function-function-mq3-game-g-utils-g-spawn-function-g-spawn-level-src-mq3-game-g-utils-ml-488110004"></a>
### G_Spawn

```ml
function G_Spawn(level)
```

Forward `G_Spawn` to `mq3.game.entities.spawn` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities`, `entities`, `startTime` and `time`. May update `level.num_entities` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L214)

<a id="function-function-mq3-game-g-utils-g-teamcommand-function-g-teamcommand-level-team-cmd-src-mq3-game-g-utils-ml-591989161"></a>
### G_TeamCommand

```ml
function G_TeamCommand(level, team, cmd)
```

Use `level.serverCommandFn` to perform `G_TeamCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`, `clients` and `serverCommandFn`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `cmd` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L113)

<a id="function-function-mq3-game-g-utils-g-tempentity-function-g-tempentity-level-origin-event-src-mq3-game-g-utils-ml-353618446"></a>
### G_TempEntity

```ml
function G_TempEntity(level, origin, event)
```

Forward `G_TempEntity` to `mq3.game.entities.tempEntity` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `event` | `dynamic` | — | Player or entity event identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L235)

<a id="function-function-mq3-game-g-utils-g-usetargets-function-g-usetargets-level-ent-activator-src-mq3-game-g-utils-ml-208348862"></a>
### G_UseTargets

```ml
function G_UseTargets(level, ent, activator)
```

Forward `G_UseTargets` to `mq3.game.targets.useTargets` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `spawner`, `num_entities` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `targetShaderName`, `targetShaderNewName`, `target` and `inuse`. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L162)

<a id="constant-constant-mq3-game-g-utils-maxchoices-const-maxchoices-32-src-mq3-game-g-utils-ml-649767850"></a>
### MAXCHOICES

```ml
const MAXCHOICES = 32
```

Maximum number of candidate choices collected before a random selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L18)

<a id="function-function-mq3-game-g-utils-namesequal-function-namesequal-first-second-src-mq3-game-g-utils-ml-1677218458"></a>
### namesEqual

```ml
function namesEqual(first, second)
```

Apply `mq3.game.g_utils.nativeText` while evaluating `namesEqual`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Text to parse, format or deliver. |
| `second` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L35)

<a id="function-function-mq3-game-g-utils-nativetext-function-nativetext-text-src-mq3-game-g-utils-ml-2005247959"></a>
### nativeText

```ml
function nativeText(text)
```

Read a native string through its first zero byte and reject non-string values while preserving void.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L22)

<a id="function-function-mq3-game-g-utils-stringfield-function-stringfield-ent-field-src-mq3-game-g-utils-ml-1903649065"></a>
### stringField

```ml
function stringField(ent, field)
```

Select a supported string field from a typed game entity and reject unsupported field names.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `classname`, `target`, `targetname`, `model` and `model2` and related fields. |
| `field` | `dynamic` | — | Value used by `stringField` in `switch field`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L55)

<a id="function-function-mq3-game-g-utils-tv-function-tv-x-y-z-src-mq3-game-g-utils-ml-1046810685"></a>
### tv

```ml
function tv(x, y, z)
```

Return a new array `[n.f32(x),n.f32(y),n.f32(z)]` for `tv`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.f32`. |
| `y` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.f32`. |
| `z` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L170)

<a id="function-function-mq3-game-g-utils-vectoyaw-function-vectoyaw-vector-src-mq3-game-g-utils-ml-1205583111"></a>
### vectoyaw

```ml
function vectoyaw(vector)
```

Convert the horizontal vector direction to yaw in the nonnegative degree range.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vector` | `dynamic` | — | Array or byte sequence accessed at `1` and `0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L196)

<a id="function-function-mq3-game-g-utils-vtos-function-vtos-level-vector-src-mq3-game-g-utils-ml-959688515"></a>
### vtos

```ml
function vtos(level, vector)
```

Forward `vtos` to `mq3.game.entities.vtos` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `vector` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_utils.ml#L179)
