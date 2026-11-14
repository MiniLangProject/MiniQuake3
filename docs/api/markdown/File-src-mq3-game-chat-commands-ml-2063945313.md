# `src/mq3/game/chat_commands.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.chat_commands`](Package-mq3-game-chat-commands-825751607.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/command_args.ml` as `commandArgs` → [src/mq3/game/command_args.ml](File-src-mq3-game-command-args-ml-1980826409.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/team_bonuses.ml` as `teamBonuses` → [src/mq3/game/team_bonuses.ml](File-src-mq3-game-team-bonuses-ml-406479811.md)
- `mq3/game/team_status.ml` as `teamStatus` → [src/mq3/game/team_status.ml](File-src-mq3-game-team-status-ml-1980544906.md)
- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-game-chat-commands-chatclient-function-chatclient-ent-src-mq3-game-chat-commands-ml-684274411"></a>
### chatClient

```ml
function chatClient(ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L22)

<a id="function-function-mq3-game-chat-commands-chatclientlimit-function-chatclientlimit-level-src-mq3-game-chat-commands-ml-1920074454"></a>
### chatClientLimit

```ml
function chatClientLimit(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L30)

<a id="function-function-mq3-game-chat-commands-chatformattedcopy-function-chatformattedcopy-level-text-capacity-src-mq3-game-chat-commands-ml-1992924257"></a>
### chatFormattedCopy

```ml
function chatFormattedCopy(level, text, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L46)

<a id="function-function-mq3-game-chat-commands-chatgametype-function-chatgametype-level-src-mq3-game-chat-commands-ml-1199592538"></a>
### chatGametype

```ml
function chatGametype(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L26)

<a id="function-function-mq3-game-chat-commands-chatlog-function-chatlog-level-text-src-mq3-game-chat-commands-ml-373871719"></a>
### chatLog

```ml
function chatLog(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L38)

<a id="function-function-mq3-game-chat-commands-chatprint-function-chatprint-level-text-src-mq3-game-chat-commands-ml-1897474657"></a>
### chatPrint

```ml
function chatPrint(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L42)

<a id="function-function-mq3-game-chat-commands-chatservercommand-function-chatservercommand-level-slot-text-src-mq3-game-chat-commands-ml-861444847"></a>
### chatServerCommand

```ml
function chatServerCommand(level, slot, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L34)

<a id="function-function-mq3-game-chat-commands-chatvoiceonly-function-chatvoiceonly-value-src-mq3-game-chat-commands-ml-3612887"></a>
### chatVoiceOnly

```ml
function chatVoiceOnly(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L112)

<a id="constant-constant-mq3-game-chat-commands-color-cyan-const-color-cyan-53-src-mq3-game-chat-commands-ml-732598489"></a>
### COLOR_CYAN

```ml
const COLOR_CYAN = 53
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L19)

<a id="constant-constant-mq3-game-chat-commands-color-green-const-color-green-50-src-mq3-game-chat-commands-ml-464110644"></a>
### COLOR_GREEN

```ml
const COLOR_GREEN = 50
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L18)

<a id="constant-constant-mq3-game-chat-commands-color-magenta-const-color-magenta-54-src-mq3-game-chat-commands-ml-130499204"></a>
### COLOR_MAGENTA

```ml
const COLOR_MAGENTA = 54
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L20)

<a id="function-function-mq3-game-chat-commands-gamecommand-function-gamecommand-level-ent-argv-src-mq3-game-chat-commands-ml-752290839"></a>
### gameCommand

```ml
function gameCommand(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L193)

<a id="function-function-mq3-game-chat-commands-say-function-say-level-ent-target-mode-chattext-src-mq3-game-chat-commands-ml-1044532284"></a>
### say

```ml
function say(level, ent, target, mode, chatText)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `chatText` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L62)

<a id="constant-constant-mq3-game-chat-commands-say-all-const-say-all-0-src-mq3-game-chat-commands-ml-956398927"></a>
### SAY_ALL

```ml
const SAY_ALL = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L14)

<a id="constant-constant-mq3-game-chat-commands-say-team-const-say-team-1-src-mq3-game-chat-commands-ml-1463949804"></a>
### SAY_TEAM

```ml
const SAY_TEAM = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L15)

<a id="constant-constant-mq3-game-chat-commands-say-tell-const-say-tell-2-src-mq3-game-chat-commands-ml-240468365"></a>
### SAY_TELL

```ml
const SAY_TELL = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L16)

<a id="function-function-mq3-game-chat-commands-saycommand-function-saycommand-level-ent-argv-mode-arg0-src-mq3-game-chat-commands-ml-571437576"></a>
### sayCommand

```ml
function sayCommand(level, ent, argv, mode, arg0)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `arg0` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L94)

<a id="function-function-mq3-game-chat-commands-sayto-function-sayto-level-ent-other-mode-color-name-message-src-mq3-game-chat-commands-ml-144419241"></a>
### sayTo

```ml
function sayTo(level, ent, other, mode, color, name, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L52)

<a id="constant-constant-mq3-game-chat-commands-svf-bot-const-svf-bot-8-src-mq3-game-chat-commands-ml-1444810447"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L17)

<a id="function-function-mq3-game-chat-commands-tellcommand-function-tellcommand-level-ent-argv-src-mq3-game-chat-commands-ml-1542796633"></a>
### tellCommand

```ml
function tellCommand(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L100)

<a id="function-function-mq3-game-chat-commands-voice-function-voice-level-ent-target-mode-id-voiceonly-src-mq3-game-chat-commands-ml-274338416"></a>
### voice

```ml
function voice(level, ent, target, mode, id, voiceOnly)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `voiceOnly` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L129)

<a id="function-function-mq3-game-chat-commands-voicecommand-function-voicecommand-level-ent-argv-mode-arg0-voiceonly-src-mq3-game-chat-commands-ml-514798186"></a>
### voiceCommand

```ml
function voiceCommand(level, ent, argv, mode, arg0, voiceOnly)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `arg0` | `dynamic` | — |  |
| `voiceOnly` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L140)

<a id="function-function-mq3-game-chat-commands-voicetaunt-function-voicetaunt-level-ent-src-mq3-game-chat-commands-ml-43043627"></a>
### voiceTaunt

```ml
function voiceTaunt(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L158)

<a id="function-function-mq3-game-chat-commands-voicetellcommand-function-voicetellcommand-level-ent-argv-voiceonly-src-mq3-game-chat-commands-ml-2094996945"></a>
### voiceTellCommand

```ml
function voiceTellCommand(level, ent, argv, voiceOnly)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |
| `voiceOnly` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L146)

<a id="function-function-mq3-game-chat-commands-voiceto-function-voiceto-level-ent-other-mode-id-voiceonly-src-mq3-game-chat-commands-ml-2069680053"></a>
### voiceTo

```ml
function voiceTo(level, ent, other, mode, id, voiceOnly)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `voiceOnly` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L118)

<a id="function-function-mq3-game-chat-commands-where-function-where-level-ent-src-mq3-game-chat-commands-ml-1327730689"></a>
### where

```ml
function where(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/chat_commands.ml#L202)
