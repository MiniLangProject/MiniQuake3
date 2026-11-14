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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `readFileFn` | `dynamic` | — |  |
| `listFilesFn` | `dynamic` | — |  |
| `printFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L21)

<a id="function-function-mq3-game-bot-registry-filedata-function-filedata-state-filename-src-mq3-game-bot-registry-ml-341744468"></a>
### fileData

```ml
function fileData(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L55)

<a id="function-function-mq3-game-bot-registry-getarenainfobymap-function-getarenainfobymap-state-map-src-mq3-game-bot-registry-ml-404539183"></a>
### getArenaInfoByMap

```ml
function getArenaInfoByMap(state, map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L122)

<a id="function-function-mq3-game-bot-registry-getbotinfobyname-function-getbotinfobyname-state-name-src-mq3-game-bot-registry-ml-913399118"></a>
### getBotInfoByName

```ml
function getBotInfoByName(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L136)

<a id="function-function-mq3-game-bot-registry-getbotinfobynumber-function-getbotinfobynumber-state-num-src-mq3-game-bot-registry-ml-2094867101"></a>
### getBotInfoByNumber

```ml
function getBotInfoByNumber(state, num)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L129)

<a id="function-function-mq3-game-bot-registry-listedfiles-function-listedfiles-state-extension-src-mq3-game-bot-registry-ml-1668054484"></a>
### listedFiles

```ml
function listedFiles(state, extension)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L81)

<a id="function-function-mq3-game-bot-registry-loadarenas-function-loadarenas-state-arenasfile-src-mq3-game-bot-registry-ml-230659527"></a>
### loadArenas

```ml
function loadArenas(state, arenasFile)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `arenasFile` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L96)

<a id="function-function-mq3-game-bot-registry-loadarenasfromfile-function-loadarenasfromfile-state-filename-src-mq3-game-bot-registry-ml-1484088228"></a>
### loadArenasFromFile

```ml
function loadArenasFromFile(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L73)

<a id="function-function-mq3-game-bot-registry-loadbots-function-loadbots-state-botenable-botsfile-src-mq3-game-bot-registry-ml-445156535"></a>
### loadBots

```ml
function loadBots(state, botEnable, botsFile)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `botEnable` | `dynamic` | — |  |
| `botsFile` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L111)

<a id="function-function-mq3-game-bot-registry-loadbotsfromfile-function-loadbotsfromfile-state-filename-src-mq3-game-bot-registry-ml-1599104248"></a>
### loadBotsFromFile

```ml
function loadBotsFromFile(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L77)

<a id="function-function-mq3-game-bot-registry-loadfromfile-function-loadfromfile-state-filename-destination-src-mq3-game-bot-registry-ml-777211318"></a>
### loadFromFile

```ml
function loadFromFile(state, filename, destination)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `destination` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L60)

<a id="constant-constant-mq3-game-bot-registry-max-info-text-const-max-info-text-8192-src-mq3-game-bot-registry-ml-1922505083"></a>
### MAX_INFO_TEXT

```ml
const MAX_INFO_TEXT = 8192
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L10)

<a id="constant-constant-mq3-game-bot-registry-max-infos-const-max-infos-1024-src-mq3-game-bot-registry-ml-1594952030"></a>
### MAX_INFOS

```ml
const MAX_INFOS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L9)

<a id="function-function-mq3-game-bot-registry-output-function-output-state-text-src-mq3-game-bot-registry-ml-1831207462"></a>
### output

```ml
function output(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L25)

<a id="function-function-mq3-game-bot-registry-parseinfos-function-parseinfos-state-text-max-src-mq3-game-bot-registry-ml-2091311498"></a>
### parseInfos

```ml
function parseInfos(state, text, max)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `max` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L30)

- [mq3.game.bot_registry.Registry](Type-mq3-game-bot-registry-registry-1702601920.md) — struct
<a id="function-function-mq3-game-bot-registry-scriptpath-function-scriptpath-name-src-mq3-game-bot-registry-ml-1998571885"></a>
### scriptPath

```ml
function scriptPath(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_registry.ml#L88)
