# `src/mq3/game/client_commands.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.client_commands`](Package-mq3-game-client-commands-1700243664.md)

Reachable from entry: **no**

## Imports

- `mq3/game/chat_commands.ml` as `chat` → [src/mq3/game/chat_commands.ml](File-src-mq3-game-chat-commands-ml-2063945313.md)
- `mq3/game/command_args.ml` as `commandArgs` → [src/mq3/game/command_args.ml](File-src-mq3-game-command-args-ml-1980826409.md)
- `mq3/game/follow_commands.ml` as `followCommands` → [src/mq3/game/follow_commands.ml](File-src-mq3-game-follow-commands-ml-511973794.md)
- `mq3/game/scores.ml` as `scores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)
- `mq3/game/team_changes.ml` as `teamChanges` → [src/mq3/game/team_changes.ml](File-src-mq3-game-team-changes-ml-909995461.md)
- `mq3/game/utility_commands.ml` as `utility` → [src/mq3/game/utility_commands.ml](File-src-mq3-game-utility-commands-ml-2099018205.md)
- `mq3/game/vote_commands.ml` as `voteCommands` → [src/mq3/game/vote_commands.ml](File-src-mq3-game-vote-commands-ml-1392379875.md)
- `mq3/game/votes.ml` as `votes` → [src/mq3/game/votes.ml](File-src-mq3-game-votes-ml-1007667129.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-client-commands-command-function-command-level-clientnum-argv-src-mq3-game-client-commands-ml-262728819"></a>
### command

```ml
function command(level, clientNum, argv)
```

Apply `mq3.game.command_args.argument`, `mq3.game.chat_commands.sayCommand` and `mq3.game.chat_commands.tellCommand` while evaluating `command`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities` and `intermissiontime`. |
| `clientNum` | `dynamic` | — | Client slot number. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_commands.ml#L19)
