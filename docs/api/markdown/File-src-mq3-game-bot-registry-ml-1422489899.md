# `src/mq3/game/bot_registry.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_registry`](Package-mq3-game-bot-registry-1783512115.md)

Reachable from entry: **no**

## Imports

- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-bot-registry-create-function-create-readfilefn-listfilesfn-printfn-context-src-mq3-game-bot-registry-ml-1517617243"></a>
### create

```ml
function create(readFileFn, listFilesFn, printFn, context)
```

Create a `mq3.game.bot_registry.Registry` record, initializing `readFileFn` from `readFileFn`, `listFilesFn` from `listFilesFn` and `printFn` from `printFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `readFileFn` | `dynamic` | — | Initial value stored in `mq3.game.bot_registry.Registry.readFileFn`. |
| `listFilesFn` | `dynamic` | — | Initial value stored in `mq3.game.bot_registry.Registry.listFilesFn`. |
| `printFn` | `dynamic` | — | Initial value stored in `mq3.game.bot_registry.Registry.printFn`. |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L27)

<a id="function-function-mq3-game-bot-registry-filedata-function-filedata-state-filename-src-mq3-game-bot-registry-ml-341744468"></a>
### fileData

```ml
function fileData(state, filename)
```

Use `state.readFileFn` to perform `fileData`. Return paths include `state.readFileFn(state.context,filename)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `readFileFn` and `context`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L71)

<a id="function-function-mq3-game-bot-registry-getarenainfobymap-function-getarenainfobymap-state-map-src-mq3-game-bot-registry-ml-404539183"></a>
### getArenaInfoByMap

```ml
function getArenaInfoByMap(state, map)
```

Apply `mq3.shared.info.value` while evaluating `getArenaInfoByMap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `arenaInfos`. |
| `map` | `dynamic` | — | Value passed as argument 2 to `std.string.equalsIgnoreCaseAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L163)

<a id="function-function-mq3-game-bot-registry-getbotinfobyname-function-getbotinfobyname-state-name-src-mq3-game-bot-registry-ml-913399118"></a>
### getBotInfoByName

```ml
function getBotInfoByName(state, name)
```

Apply `mq3.shared.info.value` while evaluating `getBotInfoByName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `botInfos`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L183)

<a id="function-function-mq3-game-bot-registry-getbotinfobynumber-function-getbotinfobynumber-state-num-src-mq3-game-bot-registry-ml-2094867101"></a>
### getBotInfoByNumber

```ml
function getBotInfoByNumber(state, num)
```

Apply `mq3.game.bot_registry.output` while evaluating `getBotInfoByNumber`. Return paths include `state.botInfos[num]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `botInfos`. |
| `num` | `dynamic` | — | Value passed as argument 1 to `str`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L173)

<a id="function-function-mq3-game-bot-registry-listedfiles-function-listedfiles-state-extension-src-mq3-game-bot-registry-ml-1668054484"></a>
### listedFiles

```ml
function listedFiles(state, extension)
```

Use `state.listFilesFn` to perform `listedFiles`. Return paths include `files`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `listFilesFn` and `context`. |
| `extension` | `dynamic` | — | Value passed as argument 3 to `state.listFilesFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L110)

<a id="function-function-mq3-game-bot-registry-loadarenas-function-loadarenas-state-arenasfile-src-mq3-game-bot-registry-ml-230659527"></a>
### loadArenas

```ml
function loadArenas(state, arenasFile)
```

Set `state.arenaInfos` to `[]` and `state.arenaInfos` to `numbered` in `mq3.game.bot_registry.loadArenas`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `arenaInfos`, `context` and `printFn`. May update `state.arenaInfos` in place. |
| `arenasFile` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L130)

<a id="function-function-mq3-game-bot-registry-loadarenasfromfile-function-loadarenasfromfile-state-filename-src-mq3-game-bot-registry-ml-1484088228"></a>
### loadArenasFromFile

```ml
function loadArenasFromFile(state, filename)
```

Set `state.arenaInfos` to `loadFromFile(state,filename,state.arenaInfos)` in `mq3.game.bot_registry.loadArenasFromFile`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `arenaInfos`. May update `state.arenaInfos` in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L96)

<a id="function-function-mq3-game-bot-registry-loadbots-function-loadbots-state-botenable-botsfile-src-mq3-game-bot-registry-ml-445156535"></a>
### loadBots

```ml
function loadBots(state, botEnable, botsFile)
```

Load bot definitions into the registry using the configured file and diagnostic services.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `botInfos`. May update `state.botInfos` in place. |
| `botEnable` | `dynamic` | — | Value used by `loadBots` in `if not botEnable then return void end if`. |
| `botsFile` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L149)

<a id="function-function-mq3-game-bot-registry-loadbotsfromfile-function-loadbotsfromfile-state-filename-src-mq3-game-bot-registry-ml-1599104248"></a>
### loadBotsFromFile

```ml
function loadBotsFromFile(state, filename)
```

Set `state.botInfos` to `loadFromFile(state,filename,state.botInfos)` in `mq3.game.bot_registry.loadBotsFromFile`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `botInfos`. May update `state.botInfos` in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L103)

<a id="function-function-mq3-game-bot-registry-loadfromfile-function-loadfromfile-state-filename-destination-src-mq3-game-bot-registry-ml-777211318"></a>
### loadFromFile

```ml
function loadFromFile(state, filename, destination)
```

Apply `mq3.game.bot_registry.fileData`, `mq3.game.bot_registry.output` and `mq3.game.bot_registry.parseInfos` while evaluating `loadFromFile`. Return paths include `destination+parseInfos(state,data,available)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `readFileFn` and `context`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `destination` | `dynamic` | — | Sequence whose length bounds the iteration or lookup in `loadFromFile`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L80)

<a id="constant-constant-mq3-game-bot-registry-max-info-text-const-max-info-text-8192-src-mq3-game-bot-registry-ml-1922505083"></a>
### MAX_INFO_TEXT

```ml
const MAX_INFO_TEXT = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L10)

<a id="constant-constant-mq3-game-bot-registry-max-infos-const-max-infos-1024-src-mq3-game-bot-registry-ml-1594952030"></a>
### MAX_INFOS

```ml
const MAX_INFOS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L9)

<a id="function-function-mq3-game-bot-registry-output-function-output-state-text-src-mq3-game-bot-registry-ml-1831207462"></a>
### output

```ml
function output(state, text)
```

Use `state.printFn` to perform `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `printFn` and `context`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L34)

<a id="function-function-mq3-game-bot-registry-parseinfos-function-parseinfos-state-text-max-src-mq3-game-bot-registry-ml-2091311498"></a>
### parseInfos

```ml
function parseInfos(state, text, max)
```

Record or dispatch `"Missing { in info file\n"`, `"Max infos exceeded\n"` and `"Unexpected end of info file\n"` actions in `parseInfos`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `context` and `printFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `max` | `dynamic` | — | Value used by `parseInfos` in `if max < 0 then return error(490,"Negative info capacity") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L43)

- [mq3.game.bot_registry.Registry](Type-mq3-game-bot-registry-registry-1702601920.md) — struct
<a id="function-function-mq3-game-bot-registry-scriptpath-function-scriptpath-name-src-mq3-game-bot-registry-ml-1998571885"></a>
### scriptPath

```ml
function scriptPath(name)
```

Prefix a bot registry filename with scripts/ and reject paths exceeding the native path buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_registry.ml#L119)
