# `src/mq3/game/vote_commands.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.vote_commands`](Package-mq3-game-vote-commands-399322729.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/game/votes.ml` as `votes` → [src/mq3/game/votes.ml](File-src-mq3-game-votes-ml-1007667129.md)
- `mq3/qcommon/cvar.ml` as `cv` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-vote-commands-argument-function-argument-argv-index-capacity-src-mq3-game-vote-commands-ml-549747466"></a>
### argument

```ml
function argument(argv, index, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `argv` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L35)

<a id="function-function-mq3-game-vote-commands-boundedtext-function-boundedtext-text-capacity-src-mq3-game-vote-commands-ml-302313827"></a>
### boundedText

```ml
function boundedText(text, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L16)

<a id="function-function-mq3-game-vote-commands-callteamvote-function-callteamvote-level-ent-argv-src-mq3-game-vote-commands-ml-241544485"></a>
### callTeamVote

```ml
function callTeamVote(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L154)

<a id="function-function-mq3-game-vote-commands-callvote-function-callvote-level-ent-argv-src-mq3-game-vote-commands-ml-250711341"></a>
### callVote

```ml
function callVote(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L60)

<a id="function-function-mq3-game-vote-commands-castteamvote-function-castteamvote-level-ent-argv-src-mq3-game-vote-commands-ml-1980208501"></a>
### castTeamVote

```ml
function castTeamVote(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L208)

<a id="function-function-mq3-game-vote-commands-castvote-function-castvote-level-ent-argv-src-mq3-game-vote-commands-ml-1423905733"></a>
### castVote

```ml
function castVote(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L117)

<a id="function-function-mq3-game-vote-commands-cleanname-function-cleanname-text-src-mq3-game-vote-commands-ml-687753811"></a>
### cleanName

```ml
function cleanName(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L142)

<a id="constant-constant-mq3-game-vote-commands-ef-teamvoted-const-ef-teamvoted-524288-src-mq3-game-vote-commands-ml-1797066632"></a>
### EF_TEAMVOTED

```ml
const EF_TEAMVOTED = 524288
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L14)

<a id="constant-constant-mq3-game-vote-commands-ef-voted-const-ef-voted-16384-src-mq3-game-vote-commands-ml-980455761"></a>
### EF_VOTED

```ml
const EF_VOTED = 16384
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L13)

<a id="function-function-mq3-game-vote-commands-formattedtext-function-formattedtext-level-text-capacity-src-mq3-game-vote-commands-ml-1682942493"></a>
### formattedText

```ml
function formattedText(level, text, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L25)

<a id="function-function-mq3-game-vote-commands-invalidstring-function-invalidstring-first-second-src-mq3-game-vote-commands-ml-2081787534"></a>
### invalidString

```ml
function invalidString(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L57)

<a id="function-function-mq3-game-vote-commands-isyes-function-isyes-argv-src-mq3-game-vote-commands-ml-59008562"></a>
### isYes

```ml
function isYes(argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L110)

<a id="function-function-mq3-game-vote-commands-nextmap-function-nextmap-level-src-mq3-game-vote-commands-ml-631797420"></a>
### nextMap

```ml
function nextMap(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L51)

<a id="function-function-mq3-game-vote-commands-notice-function-notice-level-ent-text-src-mq3-game-vote-commands-ml-1982185522"></a>
### notice

```ml
function notice(level, ent, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L44)

<a id="function-function-mq3-game-vote-commands-teamarguments-function-teamarguments-argv-src-mq3-game-vote-commands-ml-378623810"></a>
### teamArguments

```ml
function teamArguments(argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L130)

<a id="function-function-mq3-game-vote-commands-voteclient-function-voteclient-level-ent-src-mq3-game-vote-commands-ml-1850731495"></a>
### voteClient

```ml
function voteClient(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L39)

<a id="function-function-mq3-game-vote-commands-voteconfig-function-voteconfig-level-index-value-src-mq3-game-vote-commands-ml-1179185729"></a>
### voteConfig

```ml
function voteConfig(level, index, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/vote_commands.ml#L47)
