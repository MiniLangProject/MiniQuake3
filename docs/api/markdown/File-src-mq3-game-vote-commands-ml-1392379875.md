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

Apply `mq3.game.vote_commands.boundedText` while evaluating `argument`. Return paths include `boundedText(argv[index],capacity)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `argv` | `dynamic` | — | Command argument strings in their original order. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `capacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L46)

<a id="function-function-mq3-game-vote-commands-boundedtext-function-boundedtext-text-capacity-src-mq3-game-vote-commands-ml-302313827"></a>
### boundedText

```ml
function boundedText(text, capacity)
```

Validate vote argument storage and reject embedded zero bytes, truncating text to leave space for the terminator.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `capacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L19)

<a id="function-function-mq3-game-vote-commands-callteamvote-function-callteamvote-level-ent-argv-src-mq3-game-vote-commands-ml-241544485"></a>
### callTeamVote

```ml
function callTeamVote(level, ent, argv)
```

Update `level.teamVoteString[offset]`, `level.teamVoteTime[offset]`, `level.teamVoteYes[offset]` and `level.teamVoteNo[offset]` during `callTeamVote`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `allowVote`, `teamVoteTime`, `maxclients`, `entities` and `clients` and related fields. May update `level.teamVoteString[offset]`, `level.teamVoteTime[offset]` and `level.teamVoteYes[offset]` and additional fields in place. |
| `ent` | `dynamic` | — | Game entity; accesses `slot` and `client`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L199)

<a id="function-function-mq3-game-vote-commands-callvote-function-callvote-level-ent-argv-src-mq3-game-vote-commands-ml-250711341"></a>
### callVote

```ml
function callVote(level, ent, argv)
```

Update `level.voteExecuteTime`, `level.voteString`, `level.voteDisplayString` and `level.voteTime` and related state during `callVote`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `allowVote`, `voteTime`, `voteExecuteTime`, `voteString` and `voteDisplayString` and related fields. May update `level.voteExecuteTime`, `level.voteString` and `level.voteDisplayString` and additional fields in place. |
| `ent` | `dynamic` | — | Game entity; accesses `slot` and `client`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L91)

<a id="function-function-mq3-game-vote-commands-castteamvote-function-castteamvote-level-ent-argv-src-mq3-game-vote-commands-ml-1980208501"></a>
### castTeamVote

```ml
function castTeamVote(level, ent, argv)
```

Set `level.teamVoteYes[offset]` to `n.add32(level.teamVoteYes[offset],1)` and `level.teamVoteNo[offset]` to `n.add32(level.teamVoteNo[offset],1)` in `mq3.game.vote_commands.castTeamVote`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamVoteTime`, `teamVoteYes` and `teamVoteNo`. May update `level.teamVoteYes[offset]` and `level.teamVoteNo[offset]` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `slot` and `client`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L257)

<a id="function-function-mq3-game-vote-commands-castvote-function-castvote-level-ent-argv-src-mq3-game-vote-commands-ml-1423905733"></a>
### castVote

```ml
function castVote(level, ent, argv)
```

Set `level.voteYes` to `n.add32(level.voteYes,1)` and `level.voteNo` to `n.add32(level.voteNo,1)` in `mq3.game.vote_commands.castVote`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `voteTime`, `voteYes` and `voteNo`. May update `level.voteYes` and `level.voteNo` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `slot` and `client`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L154)

<a id="function-function-mq3-game-vote-commands-cleanname-function-cleanname-text-src-mq3-game-vote-commands-ml-687753811"></a>
### cleanName

```ml
function cleanName(text)
```

Apply `mq3.game.vote_commands.boundedText` while evaluating `cleanName`. Return paths include `decode(bytes(result))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L183)

<a id="constant-constant-mq3-game-vote-commands-ef-teamvoted-const-ef-teamvoted-524288-src-mq3-game-vote-commands-ml-1797066632"></a>
### EF_TEAMVOTED

```ml
const EF_TEAMVOTED = 524288
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L14)

<a id="constant-constant-mq3-game-vote-commands-ef-voted-const-ef-voted-16384-src-mq3-game-vote-commands-ml-980455761"></a>
### EF_VOTED

```ml
const EF_VOTED = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L13)

<a id="function-function-mq3-game-vote-commands-formattedtext-function-formattedtext-level-text-capacity-src-mq3-game-vote-commands-ml-1682942493"></a>
### formattedText

```ml
function formattedText(level, text, capacity)
```

Use `level.gamePrintFn` to perform `formattedText`. Return paths include `boundedText(text,capacity)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `capacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L32)

<a id="function-function-mq3-game-vote-commands-invalidstring-function-invalidstring-first-second-src-mq3-game-vote-commands-ml-2081787534"></a>
### invalidString

```ml
function invalidString(first, second)
```

Test `strings.indexOf(first,";",0) >= 0 or strings.indexOf(second,";",0) >= 0` as the condition for `invalidString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Value passed as argument 1 to `std.string.indexOf`. |
| `second` | `dynamic` | — | Value passed as argument 1 to `std.string.indexOf`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L84)

<a id="function-function-mq3-game-vote-commands-isyes-function-isyes-argv-src-mq3-game-vote-commands-ml-59008562"></a>
### isYes

```ml
function isYes(argv)
```

Apply `mq3.game.vote_commands.argument` while evaluating `isYes`. Return paths include `first == 121 or second == 89 or second == 49`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L143)

<a id="function-function-mq3-game-vote-commands-nextmap-function-nextmap-level-src-mq3-game-vote-commands-ml-631797420"></a>
### nextMap

```ml
function nextMap(level)
```

Apply `mq3.qcommon.cvar.find` and `mq3.game.vote_commands.boundedText` while evaluating `nextMap`. Return paths include `boundedText(variable.string,1024)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L75)

<a id="function-function-mq3-game-vote-commands-notice-function-notice-level-ent-text-src-mq3-game-vote-commands-ml-1982185522"></a>
### notice

```ml
function notice(level, ent, text)
```

Forward `notice` to `mq3.game.votes.send` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `serverCommandFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `slot`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L62)

<a id="function-function-mq3-game-vote-commands-teamarguments-function-teamarguments-argv-src-mq3-game-vote-commands-ml-378623810"></a>
### teamArguments

```ml
function teamArguments(argv)
```

Apply `mq3.game.vote_commands.argument` while evaluating `teamArguments`. Return paths include `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L169)

<a id="function-function-mq3-game-vote-commands-voteclient-function-voteclient-level-ent-src-mq3-game-vote-commands-ml-1850731495"></a>
### voteClient

```ml
function voteClient(level, ent)
```

Apply `mq3.game.votes.clientLimit` while evaluating `voteClient`. Return paths include `ent.client`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`. |
| `ent` | `dynamic` | — | Game entity; accesses `slot` and `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L53)

<a id="function-function-mq3-game-vote-commands-voteconfig-function-voteconfig-level-index-value-src-mq3-game-vote-commands-ml-1179185729"></a>
### voteConfig

```ml
function voteConfig(level, index, value)
```

Apply `mq3.game.spawn_values.setConfig` while evaluating `voteConfig`. Return paths include `values.setConfig(level.spawner,index,value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `value` | `dynamic` | — | Value passed as argument 5 to `state.effectFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/vote_commands.ml#L69)
