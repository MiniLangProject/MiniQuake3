# `src/mq3/game/g_active.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_active`](Package-mq3-game-g-active-673356658.md)

Reachable from entry: **no**

## Imports

- `mq3/game/client_active.ml` as `clientActive` → [src/mq3/game/client_active.ml](File-src-mq3-game-client-active-ml-1919364260.md)
- `mq3/game/client_frame.ml` as `frame` → [src/mq3/game/client_frame.ml](File-src-mq3-game-client-frame-ml-1603528079.md)
- `mq3/game/triggers.ml` as `triggers` → [src/mq3/game/triggers.ml](File-src-mq3-game-triggers-ml-802018551.md)

## Declarations

<a id="function-function-mq3-game-g-active-clientendframe-function-clientendframe-level-ent-src-mq3-game-g-active-ml-1742710727"></a>
### ClientEndFrame

```ml
function ClientEndFrame(level, ent)
```

Forward `ClientEndFrame` to `mq3.game.client_frame.endFrame` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `intermissiontime` and `smoothClients`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `s` and `health`. May update `ent.s.eFlags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L82)

<a id="function-function-mq3-game-g-active-clientevents-function-clientevents-level-ent-oldeventsequence-src-mq3-game-g-active-ml-1980291045"></a>
### ClientEvents

```ml
function ClientEvents(level, ent, oldEventSequence)
```

Forward `ClientEvents` to `mq3.game.client_active.clientEvents` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `dmflags`, `time`, `fireWeaponFn`, `spawner` and `itemDropFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `s`, `pain_debounce_time` and `health`. May update `ent.pain_debounce_time` and `ent.health` in place. |
| `oldEventSequence` | `dynamic` | — | Player event sequence value before processing the current command. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L54)

<a id="function-function-mq3-game-g-active-clientimpacts-function-clientimpacts-level-ent-pm-src-mq3-game-g-active-ml-1762240560"></a>
### ClientImpacts

```ml
function ClientImpacts(level, ent, pm)
```

Forward `ClientImpacts` to `mq3.game.client_active.impacts` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `r` and `touch`. |
| `pm` | `dynamic` | — | Player movement context; accesses `k`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L27)

<a id="function-function-mq3-game-g-active-clientinactivitytimer-function-clientinactivitytimer-level-client-slot-src-mq3-game-g-active-ml-247891397"></a>
### ClientInactivityTimer

```ml
function ClientInactivityTimer(level, client, slot)
```

Forward `ClientInactivityTimer` to `mq3.game.client_active.inactivityTimer` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `inactivity`, `time`, `dropClientFn` and `serverCommandFn`. |
| `client` | `dynamic` | — | Client state; accesses `inactivityTime`, `inactivityWarning`, `cmdForwardmove`, `cmdRightmove` and `cmdUpmove` and related fields. May update `client.inactivityTime` and `client.inactivityWarning` in place. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L41)

<a id="function-function-mq3-game-g-active-clientintermissionthink-function-clientintermissionthink-client-src-mq3-game-g-active-ml-1847601497"></a>
### ClientIntermissionThink

```ml
function ClientIntermissionThink(client)
```

Forward `ClientIntermissionThink` to `mq3.game.client_active.intermissionThink` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Client state; accesses `ps`, `oldbuttons`, `buttons`, `cmdButtons` and `readyToExit`. May update `client.ps.eFlags`, `client.oldbuttons` and `client.buttons` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L49)

<a id="function-function-mq3-game-g-active-clientthink-function-clientthink-level-clientnum-src-mq3-game-g-active-ml-374278821"></a>
### ClientThink

```ml
function ClientThink(level, clientNum)
```

Forward `ClientThink` to `mq3.game.client_active.think` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`, `usercmdFn`, `time` and `synchronousClients`. |
| `clientNum` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L70)

<a id="function-function-mq3-game-g-active-clientthink-real-function-clientthink-real-level-ent-src-mq3-game-g-active-ml-343006707"></a>
### ClientThink_real

```ml
function ClientThink_real(level, ent)
```

Forward `ClientThink_real` to `mq3.game.client_active.realThink` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `pmoveMsec`, `cvarSetFn`, `pmoveFixed` and `intermissiontime` and related fields. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `slot`, `flags`, `r` and `eventTime` and related fields. May update `ent.flags`, `ent.r.mins` and `ent.r.maxs` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L66)

<a id="function-function-mq3-game-g-active-clienttimeractions-function-clienttimeractions-level-ent-msec-src-mq3-game-g-active-ml-2123601223"></a>
### ClientTimerActions

```ml
function ClientTimerActions(level, ent, msec)
```

Forward `ClientTimerActions` to `mq3.game.client_active.timerActions` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `client` and `health`. May update `ent.health` in place. |
| `msec` | `dynamic` | — | Elapsed time in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L46)

<a id="function-function-mq3-game-g-active-g-runclient-function-g-runclient-level-ent-src-mq3-game-g-active-ml-522133603"></a>
### G_RunClient

```ml
function G_RunClient(level, ent)
```

Forward `G_RunClient` to `mq3.game.client_active.runClient` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `synchronousClients` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `r` and `client`. May update `ent.client.cmdServerTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L74)

<a id="function-function-mq3-game-g-active-g-setclientsound-function-g-setclientsound-level-ent-src-mq3-game-g-active-ml-304867895"></a>
### G_SetClientSound

```ml
function G_SetClientSound(level, ent)
```

Forward `G_SetClientSound` to `mq3.game.client_frame.setClientSound` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `sndFry`. |
| `ent` | `dynamic` | — | Game entity; accesses `waterlevel`, `watertype` and `client`. May update `ent.client.ps.loopSound` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L22)

<a id="function-function-mq3-game-g-active-g-touchtriggers-function-g-touchtriggers-level-ent-src-mq3-game-g-active-ml-902422343"></a>
### G_TouchTriggers

```ml
function G_TouchTriggers(level, ent)
```

Forward `G_TouchTriggers` to `mq3.game.triggers.touch` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`, `entities`, `doorTouch` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `r` and `touch`. May update `ent.client.ps.jumppad_frame` and `ent.client.ps.jumppad_ent` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L31)

<a id="function-function-mq3-game-g-active-p-damagefeedback-function-p-damagefeedback-level-player-src-mq3-game-g-active-ml-1518947679"></a>
### P_DamageFeedback

```ml
function P_DamageFeedback(level, player)
```

Forward `P_DamageFeedback` to `mq3.game.client_frame.damageFeedback` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `player` | `dynamic` | — | Player entity; accesses `client`, `pain_debounce_time`, `flags` and `health`. May update `player.pain_debounce_time` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L14)

<a id="function-function-mq3-game-g-active-p-worldeffects-function-p-worldeffects-level-ent-src-mq3-game-g-active-ml-933939259"></a>
### P_WorldEffects

```ml
function P_WorldEffects(level, ent)
```

Forward `P_WorldEffects` to `mq3.game.client_frame.worldEffects` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `waterlevel`, `health`, `damage` and `pain_debounce_time` and related fields. May update `ent.damage` and `ent.pain_debounce_time` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L18)

<a id="function-function-mq3-game-g-active-sendpendingpredictableevents-function-sendpendingpredictableevents-level-ps-src-mq3-game-g-active-ml-630463059"></a>
### SendPendingPredictableEvents

```ml
function SendPendingPredictableEvents(level, ps)
```

Forward `SendPendingPredictableEvents` to `mq3.game.client_frame.sendPendingPredictableEvents` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ps` | `dynamic` | — | Player movement state; accesses `entityEventSequence`, `eventSequence`, `events`, `externalEvent` and `origin` and related fields. May update `ps.externalEvent` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L62)

<a id="function-function-mq3-game-g-active-spectatorclientendframe-function-spectatorclientendframe-level-ent-src-mq3-game-g-active-ml-1937696207"></a>
### SpectatorClientEndFrame

```ml
function SpectatorClientEndFrame(level, ent)
```

Forward `SpectatorClientEndFrame` to `mq3.game.client_frame.spectatorEndFrame` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `follow1`, `follow2`, `clients` and `clientBeginFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `client` and `slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L78)

<a id="function-function-mq3-game-g-active-spectatorthink-function-spectatorthink-level-ent-cmd-src-mq3-game-g-active-ml-1517558069"></a>
### SpectatorThink

```ml
function SpectatorThink(level, ent, cmd)
```

Forward `SpectatorThink` to `mq3.game.client_active.spectatorThink` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `followCycleFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `client` and `s`. May update `ent.s.origin` in place. |
| `cmd` | `dynamic` | — | Input user command; accesses `buttons`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L36)

<a id="function-function-mq3-game-g-active-stuckinotherclient-function-stuckinotherclient-level-ent-src-mq3-game-g-active-ml-2131903663"></a>
### StuckInOtherClient

```ml
function StuckInOtherClient(level, ent)
```

Forward `StuckInOtherClient` to `mq3.game.client_active.stuckInOtherClient` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `r`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L58)
