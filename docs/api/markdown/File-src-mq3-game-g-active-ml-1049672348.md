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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L27)

<a id="function-function-mq3-game-g-active-clientevents-function-clientevents-level-ent-oldeventsequence-src-mq3-game-g-active-ml-1980291045"></a>
### ClientEvents

```ml
function ClientEvents(level, ent, oldEventSequence)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `oldEventSequence` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L20)

<a id="function-function-mq3-game-g-active-clientimpacts-function-clientimpacts-level-ent-pm-src-mq3-game-g-active-ml-1762240560"></a>
### ClientImpacts

```ml
function ClientImpacts(level, ent, pm)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `pm` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L14)

<a id="function-function-mq3-game-g-active-clientinactivitytimer-function-clientinactivitytimer-level-client-slot-src-mq3-game-g-active-ml-247891397"></a>
### ClientInactivityTimer

```ml
function ClientInactivityTimer(level, client, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L17)

<a id="function-function-mq3-game-g-active-clientintermissionthink-function-clientintermissionthink-client-src-mq3-game-g-active-ml-1847601497"></a>
### ClientIntermissionThink

```ml
function ClientIntermissionThink(client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L19)

<a id="function-function-mq3-game-g-active-clientthink-function-clientthink-level-clientnum-src-mq3-game-g-active-ml-374278821"></a>
### ClientThink

```ml
function ClientThink(level, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L24)

<a id="function-function-mq3-game-g-active-clientthink-real-function-clientthink-real-level-ent-src-mq3-game-g-active-ml-343006707"></a>
### ClientThink_real

```ml
function ClientThink_real(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L23)

<a id="function-function-mq3-game-g-active-clienttimeractions-function-clienttimeractions-level-ent-msec-src-mq3-game-g-active-ml-2123601223"></a>
### ClientTimerActions

```ml
function ClientTimerActions(level, ent, msec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `msec` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L18)

<a id="function-function-mq3-game-g-active-g-runclient-function-g-runclient-level-ent-src-mq3-game-g-active-ml-522133603"></a>
### G_RunClient

```ml
function G_RunClient(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L25)

<a id="function-function-mq3-game-g-active-g-setclientsound-function-g-setclientsound-level-ent-src-mq3-game-g-active-ml-304867895"></a>
### G_SetClientSound

```ml
function G_SetClientSound(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L13)

<a id="function-function-mq3-game-g-active-g-touchtriggers-function-g-touchtriggers-level-ent-src-mq3-game-g-active-ml-902422343"></a>
### G_TouchTriggers

```ml
function G_TouchTriggers(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L15)

<a id="function-function-mq3-game-g-active-p-damagefeedback-function-p-damagefeedback-level-player-src-mq3-game-g-active-ml-1518947679"></a>
### P_DamageFeedback

```ml
function P_DamageFeedback(level, player)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `player` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L11)

<a id="function-function-mq3-game-g-active-p-worldeffects-function-p-worldeffects-level-ent-src-mq3-game-g-active-ml-933939259"></a>
### P_WorldEffects

```ml
function P_WorldEffects(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L12)

<a id="function-function-mq3-game-g-active-sendpendingpredictableevents-function-sendpendingpredictableevents-level-ps-src-mq3-game-g-active-ml-630463059"></a>
### SendPendingPredictableEvents

```ml
function SendPendingPredictableEvents(level, ps)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ps` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L22)

<a id="function-function-mq3-game-g-active-spectatorclientendframe-function-spectatorclientendframe-level-ent-src-mq3-game-g-active-ml-1937696207"></a>
### SpectatorClientEndFrame

```ml
function SpectatorClientEndFrame(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L26)

<a id="function-function-mq3-game-g-active-spectatorthink-function-spectatorthink-level-ent-cmd-src-mq3-game-g-active-ml-1517558069"></a>
### SpectatorThink

```ml
function SpectatorThink(level, ent, cmd)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `cmd` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L16)

<a id="function-function-mq3-game-g-active-stuckinotherclient-function-stuckinotherclient-level-ent-src-mq3-game-g-active-ml-2131903663"></a>
### StuckInOtherClient

```ml
function StuckInOtherClient(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_active.ml#L21)
