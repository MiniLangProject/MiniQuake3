# `src/mq3/game/votes.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.votes`](Package-mq3-game-votes-664835351.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/client_info.ml` as `clientInfo` → [src/mq3/game/client_info.ml](File-src-mq3-game-client-info-ml-669662398.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-votes-check-function-check-level-src-mq3-game-votes-ml-67838102"></a>
### check

```ml
function check(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L40)

<a id="function-function-mq3-game-votes-checkteam-function-checkteam-level-team-src-mq3-game-votes-ml-2013583643"></a>
### checkTeam

```ml
function checkTeam(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L113)

<a id="function-function-mq3-game-votes-checkteamleader-function-checkteamleader-level-team-src-mq3-game-votes-ml-392217793"></a>
### checkTeamLeader

```ml
function checkTeamLeader(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L92)

<a id="function-function-mq3-game-votes-clientlimit-function-clientlimit-level-src-mq3-game-votes-ml-1076743630"></a>
### clientLimit

```ml
function clientLimit(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L58)

<a id="function-function-mq3-game-votes-commandtext-function-commandtext-text-src-mq3-game-votes-ml-597145955"></a>
### commandText

```ml
function commandText(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L27)

<a id="function-function-mq3-game-votes-config-function-config-level-index-src-mq3-game-votes-ml-499007704"></a>
### config

```ml
function config(level, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L23)

<a id="function-function-mq3-game-votes-console-function-console-level-text-src-mq3-game-votes-ml-1219750553"></a>
### console

```ml
function console(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L35)

<a id="function-function-mq3-game-votes-half-function-half-value-src-mq3-game-votes-ml-746670403"></a>
### half

```ml
function half(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L13)

<a id="function-function-mq3-game-votes-printteam-function-printteam-level-team-message-src-mq3-game-votes-ml-722334500"></a>
### printTeam

```ml
function printTeam(level, team, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L62)

<a id="function-function-mq3-game-votes-send-function-send-level-slot-message-src-mq3-game-votes-ml-227964361"></a>
### send

```ml
function send(level, slot, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L19)

<a id="function-function-mq3-game-votes-setleader-function-setleader-level-team-slot-src-mq3-game-votes-ml-736076811"></a>
### setLeader

```ml
function setLeader(level, team, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L76)

<a id="constant-constant-mq3-game-votes-svf-bot-const-svf-bot-8-src-mq3-game-votes-ml-124725787"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L11)

<a id="function-function-mq3-game-votes-userinfochanged-function-userinfochanged-level-slot-src-mq3-game-votes-ml-1653212924"></a>
### userinfoChanged

```ml
function userinfoChanged(level, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L71)
