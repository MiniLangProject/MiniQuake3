# `src/mq3/game/client_frame.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.client_frame`](Package-mq3-game-client-frame-325050419.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `mq3/game/playerstate.ml` as `playerstate` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `mq3/game/snapshot.ml` as `snapshot` → [src/mq3/game/snapshot.ml](File-src-mq3-game-snapshot-ml-1144176980.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="constant-constant-mq3-game-client-frame-chan-voice-const-chan-voice-2-src-mq3-game-client-frame-ml-1296275251"></a>
### CHAN_VOICE

```ml
const CHAN_VOICE = 2
```

Audio channel identifier selecting voice playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L40)

<a id="constant-constant-mq3-game-client-frame-contents-lava-const-contents-lava-headers-contents-lava-src-mq3-game-client-frame-ml-759461446"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = headers.CONTENTS_LAVA
```

Collision-contents bit identifying lava space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L32)

<a id="constant-constant-mq3-game-client-frame-contents-slime-const-contents-slime-headers-contents-slime-src-mq3-game-client-frame-ml-1177690656"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = headers.CONTENTS_SLIME
```

Collision-contents bit identifying slime space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L34)

<a id="constant-constant-mq3-game-client-frame-damage-no-armor-const-damage-no-armor-2-src-mq3-game-client-frame-ml-856943767"></a>
### DAMAGE_NO_ARMOR

```ml
const DAMAGE_NO_ARMOR = 2
```

Damage-processing flag enabling no armor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L38)

<a id="function-function-mq3-game-client-frame-damagefeedback-function-damagefeedback-level-player-src-mq3-game-client-frame-ml-509921203"></a>
### damageFeedback

```ml
function damageFeedback(level, player)
```

Set `player.pain_debounce_time` to `n.add32(level.time,700)` in `mq3.game.client_frame.damageFeedback`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `player` | `dynamic` | — | Player entity; accesses `client`, `pain_debounce_time`, `flags` and `health`. May update `player.pain_debounce_time` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L69)

<a id="constant-constant-mq3-game-client-frame-ef-connection-const-ef-connection-8192-src-mq3-game-client-frame-ml-945114799"></a>
### EF_CONNECTION

```ml
const EF_CONNECTION = 8192
```

Network entity-flag bit indicating connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L24)

<a id="constant-constant-mq3-game-client-frame-ef-player-event-const-ef-player-event-16-src-mq3-game-client-frame-ml-374640138"></a>
### EF_PLAYER_EVENT

```ml
const EF_PLAYER_EVENT = 16
```

Network entity-flag bit indicating player event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L22)

<a id="constant-constant-mq3-game-client-frame-ef-teamvoted-const-ef-teamvoted-524288-src-mq3-game-client-frame-ml-181765600"></a>
### EF_TEAMVOTED

```ml
const EF_TEAMVOTED = 524288
```

Network entity-flag bit indicating teamvoted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L28)

<a id="constant-constant-mq3-game-client-frame-ef-voted-const-ef-voted-16384-src-mq3-game-client-frame-ml-494443275"></a>
### EF_VOTED

```ml
const EF_VOTED = 16384
```

Network entity-flag bit indicating voted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L26)

<a id="function-function-mq3-game-client-frame-endframe-function-endframe-level-ent-src-mq3-game-client-frame-ml-1151010997"></a>
### endFrame

```ml
function endFrame(level, ent)
```

Set `ent.s.eFlags` to `ent.s.eFlags | EF_CONNECTION` and `ent.s.eFlags` to `ent.s.eFlags & ~EF_CONNECTION` in `mq3.game.client_frame.endFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `intermissiontime` and `smoothClients`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `s` and `health`. May update `ent.s.eFlags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L186)

<a id="constant-constant-mq3-game-client-frame-fl-godmode-const-fl-godmode-16-src-mq3-game-client-frame-ml-1342006948"></a>
### FL_GODMODE

```ml
const FL_GODMODE = 16
```

Game entity-flag bit enabling or marking godmode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L30)

<a id="function-function-mq3-game-client-frame-missionpack-function-missionpack-level-src-mq3-game-client-frame-ml-1431044140"></a>
### missionpack

```ml
function missionpack(level)
```

Test `level.spawner != void and level.spawner.missionpack` as the condition for `missionpack`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L52)

<a id="function-function-mq3-game-client-frame-persistenttag-function-persistenttag-level-client-src-mq3-game-client-frame-ml-336570875"></a>
### persistentTag

```ml
function persistentTag(level, client)
```

Apply `mq3.game.client_frame.missionpack` and `mq3.game.constants.missionpackItemTag` while evaluating `persistentTag`. Return paths include `c.missionpackItemTag(index)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `client` | `dynamic` | — | Client state; accesses `ps`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L59)

<a id="constant-constant-mq3-game-client-frame-pmf-follow-const-pmf-follow-4096-src-mq3-game-client-frame-ml-1245208154"></a>
### PMF_FOLLOW

```ml
const PMF_FOLLOW = 4096
```

Player movement-state bit indicating follow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L18)

<a id="constant-constant-mq3-game-client-frame-pmf-scoreboard-const-pmf-scoreboard-8192-src-mq3-game-client-frame-ml-1231367473"></a>
### PMF_SCOREBOARD

```ml
const PMF_SCOREBOARD = 8192
```

Player movement-state bit indicating scoreboard.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L20)

<a id="function-function-mq3-game-client-frame-sendpendingpredictableevents-function-sendpendingpredictableevents-level-ps-src-mq3-game-client-frame-ml-342203915"></a>
### sendPendingPredictableEvents

```ml
function sendPendingPredictableEvents(level, ps)
```

Set `ps.externalEvent` to `0` and `ps.externalEvent` to `external` in `mq3.game.client_frame.sendPendingPredictableEvents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ps` | `dynamic` | — | Player movement state; accesses `entityEventSequence`, `eventSequence`, `events`, `externalEvent` and `origin` and related fields. May update `ps.externalEvent` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L145)

<a id="function-function-mq3-game-client-frame-setclientsound-function-setclientsound-level-ent-src-mq3-game-client-frame-ml-258781757"></a>
### setClientSound

```ml
function setClientSound(level, ent)
```

Set `ent.client.ps.loopSound` to `level.sndFry` and `ent.client.ps.loopSound` to `0` in `mq3.game.client_frame.setClientSound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `sndFry`. |
| `ent` | `dynamic` | — | Game entity; accesses `waterlevel`, `watertype` and `client`. May update `ent.client.ps.loopSound` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L136)

<a id="function-function-mq3-game-client-frame-soundindex-function-soundindex-level-name-src-mq3-game-client-frame-ml-806078913"></a>
### soundIndex

```ml
function soundIndex(level, name)
```

Apply `mq3.game.spawn_values.soundIndex` while evaluating `soundIndex`. Return paths include `values.soundIndex(level.spawner,name)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L94)

<a id="constant-constant-mq3-game-client-frame-spectator-follow-const-spectator-follow-2-src-mq3-game-client-frame-ml-951532615"></a>
### SPECTATOR_FOLLOW

```ml
const SPECTATOR_FOLLOW = 2
```

Spectator-state identifier selecting follow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L44)

<a id="constant-constant-mq3-game-client-frame-spectator-free-const-spectator-free-1-src-mq3-game-client-frame-ml-177597202"></a>
### SPECTATOR_FREE

```ml
const SPECTATOR_FREE = 1
```

Spectator-state identifier selecting free.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L42)

<a id="constant-constant-mq3-game-client-frame-spectator-scoreboard-const-spectator-scoreboard-3-src-mq3-game-client-frame-ml-276654880"></a>
### SPECTATOR_SCOREBOARD

```ml
const SPECTATOR_SCOREBOARD = 3
```

Spectator-state identifier selecting scoreboard.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L46)

<a id="function-function-mq3-game-client-frame-spectatorendframe-function-spectatorendframe-level-ent-src-mq3-game-client-frame-ml-9531299"></a>
### spectatorEndFrame

```ml
function spectatorEndFrame(level, ent)
```

Use `level.clientBeginFn` to perform `spectatorEndFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `follow1`, `follow2`, `clients` and `clientBeginFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `client` and `slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L160)

<a id="constant-constant-mq3-game-client-frame-stat-persistant-powerup-const-stat-persistant-powerup-7-src-mq3-game-client-frame-ml-293818394"></a>
### STAT_PERSISTANT_POWERUP

```ml
const STAT_PERSISTANT_POWERUP = 7
```

Player-state statistics index storing persistant powerup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L48)

<a id="constant-constant-mq3-game-client-frame-svf-notsingleclient-const-svf-notsingleclient-2048-src-mq3-game-client-frame-ml-977819437"></a>
### SVF_NOTSINGLECLIENT

```ml
const SVF_NOTSINGLECLIENT = 2048
```

Server entity-flag bit controlling notsingleclient.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L36)

<a id="function-function-mq3-game-client-frame-worldeffects-function-worldeffects-level-ent-src-mq3-game-client-frame-ml-2076799157"></a>
### worldEffects

```ml
function worldEffects(level, ent)
```

Update `ent.damage` and `ent.pain_debounce_time` during `worldEffects`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `waterlevel`, `health`, `damage` and `pain_debounce_time` and related fields. May update `ent.damage` and `ent.pain_debounce_time` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_frame.ml#L102)
