# `src/mq3/game/bot_client_resources.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_client_resources`](Package-mq3-game-bot-client-resources-1475215729.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/bot_lifecycle.ml` as `botLifecycle` → [src/mq3/game/bot_lifecycle.ml](File-src-mq3-game-bot-lifecycle-ml-1736646636.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)

## Declarations

<a id="constant-constant-mq3-game-bot-client-resources-characteristic-chat-file-const-characteristic-chat-file-headers-characteristic-chat-file-src-mq3-game-bot-client-resources-ml-865713610"></a>
### CHARACTERISTIC_CHAT_FILE

```ml
const CHARACTERISTIC_CHAT_FILE = headers.CHARACTERISTIC_CHAT_FILE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L11)

<a id="constant-constant-mq3-game-bot-client-resources-characteristic-chat-name-const-characteristic-chat-name-headers-characteristic-chat-name-src-mq3-game-bot-client-resources-ml-2096304647"></a>
### CHARACTERISTIC_CHAT_NAME

```ml
const CHARACTERISTIC_CHAT_NAME = headers.CHARACTERISTIC_CHAT_NAME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L12)

<a id="constant-constant-mq3-game-bot-client-resources-characteristic-gender-const-characteristic-gender-headers-characteristic-gender-src-mq3-game-bot-client-resources-ml-800072616"></a>
### CHARACTERISTIC_GENDER

```ml
const CHARACTERISTIC_GENDER = headers.CHARACTERISTIC_GENDER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L9)

<a id="constant-constant-mq3-game-bot-client-resources-characteristic-itemweights-const-characteristic-itemweights-headers-characteristic-itemweights-src-mq3-game-bot-client-resources-ml-564052175"></a>
### CHARACTERISTIC_ITEMWEIGHTS

```ml
const CHARACTERISTIC_ITEMWEIGHTS = headers.CHARACTERISTIC_ITEMWEIGHTS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L13)

<a id="constant-constant-mq3-game-bot-client-resources-characteristic-walker-const-characteristic-walker-headers-characteristic-walker-src-mq3-game-bot-client-resources-ml-1947604113"></a>
### CHARACTERISTIC_WALKER

```ml
const CHARACTERISTIC_WALKER = headers.CHARACTERISTIC_WALKER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L14)

<a id="constant-constant-mq3-game-bot-client-resources-characteristic-weaponweights-const-characteristic-weaponweights-headers-characteristic-weaponweights-src-mq3-game-bot-client-resources-ml-295488478"></a>
### CHARACTERISTIC_WEAPONWEIGHTS

```ml
const CHARACTERISTIC_WEAPONWEIGHTS = headers.CHARACTERISTIC_WEAPONWEIGHTS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L10)

<a id="constant-constant-mq3-game-bot-client-resources-chat-all-const-chat-all-0-src-mq3-game-bot-client-resources-ml-75235911"></a>
### CHAT_ALL

```ml
const CHAT_ALL = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L18)

<a id="constant-constant-mq3-game-bot-client-resources-chat-genderfemale-const-chat-genderfemale-1-src-mq3-game-bot-client-resources-ml-1540954888"></a>
### CHAT_GENDERFEMALE

```ml
const CHAT_GENDERFEMALE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L16)

<a id="constant-constant-mq3-game-bot-client-resources-chat-genderless-const-chat-genderless-0-src-mq3-game-bot-client-resources-ml-809120897"></a>
### CHAT_GENDERLESS

```ml
const CHAT_GENDERLESS = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L15)

<a id="constant-constant-mq3-game-bot-client-resources-chat-gendermale-const-chat-gendermale-2-src-mq3-game-bot-client-resources-ml-1403940175"></a>
### CHAT_GENDERMALE

```ml
const CHAT_GENDERMALE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L17)

<a id="function-function-mq3-game-bot-client-resources-clearbot-function-clearbot-bot-src-mq3-game-bot-client-resources-ml-1942158289"></a>
### clearBot

```ml
function clearBot(bot)
```

Update `bot.inuse`, `bot.client`, `bot.entitynum` and `bot.settings` and related state during `clearBot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bot` | `dynamic` | — | Bot AI state; accesses `inuse`, `client`, `entitynum`, `settings` and `curPs` and related fields. May update `bot.inuse`, `bot.client` and `bot.entitynum` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L166)

<a id="function-function-mq3-game-bot-client-resources-create-function-create-state-src-mq3-game-bot-client-resources-ml-2106990309"></a>
### create

```ml
function create(state)
```

Build the `mq3.game.bot_client_resources.Services` result for `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial value stored in `mq3.game.bot_client_resources.Services.lifecycleState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L65)

<a id="function-function-mq3-game-bot-client-resources-diagnostic-function-diagnostic-services-kind-client-settings-src-mq3-game-bot-client-resources-ml-694697962"></a>
### diagnostic

```ml
function diagnostic(services, kind, client, settings)
```

Use `services.diagnosticFn` to perform `diagnostic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `diagnosticFn`. |
| `kind` | `dynamic` | — | Value passed as argument 2 to `services.diagnosticFn`. |
| `client` | `dynamic` | — | Value passed as argument 3 to `services.diagnosticFn`. |
| `settings` | `dynamic` | — | Value passed as argument 4 to `services.diagnosticFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L91)

<a id="function-function-mq3-game-bot-client-resources-inactivebot-function-inactivebot-client-src-mq3-game-bot-client-resources-ml-259645317"></a>
### inactiveBot

```ml
function inactiveBot(client)
```

Apply `mq3.game.bot_lifecycle.createBot` while evaluating `inactiveBot`. Return paths include `bot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.bot_lifecycle.BotState.client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L98)

<a id="function-function-mq3-game-bot-client-resources-need-function-need-callback-label-src-mq3-game-bot-client-resources-ml-237431995"></a>
### need

```ml
function need(callback, label)
```

Require a callback used to allocate or release bot client resources.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `callback` | `dynamic` | — | Callback invoked by this operation. |
| `label` | `dynamic` | — | Label retained with the diagnostic or action record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L81)

- [mq3.game.bot_client_resources.Services](Type-mq3-game-bot-client-resources-services-676364621.md) — struct
- [mq3.game.bot_client_resources.Settings](Type-mq3-game-bot-client-resources-settings-533718480.md) — struct
<a id="function-function-mq3-game-bot-client-resources-setupclient-function-setupclient-services-client-settings-restart-src-mq3-game-bot-client-resources-ml-22278933"></a>
### setupClient

```ml
function setupClient(services, client, settings, restart)
```

Use `services.characteristicStringFn` to perform `setupClient`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState`, `aasInitializedFn`, `loadCharacterFn`, `allocGoalStateFn` and `characteristicStringFn` and related fields. |
| `client` | `dynamic` | — | Value passed as argument 1 to `typeof`. |
| `settings` | `dynamic` | — | Settings record; accesses `characterfile`, `skill` and `team`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L107)

<a id="function-function-mq3-game-bot-client-resources-shutdownclient-function-shutdownclient-services-client-restart-src-mq3-game-bot-client-resources-ml-2124841046"></a>
### shutdownClient

```ml
function shutdownClient(services, client, restart)
```

Apply `mq3.game.bot_client_resources.validClient`, `mq3.game.bot_client_resources.need` and `mq3.game.bot_client_resources.clearBot` while evaluating `shutdownClient`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState`, `writeSessionFn`, `chatExitGameFn`, `enterChatFn` and `freeMoveStateFn` and related fields. |
| `client` | `dynamic` | — | Value passed as argument 1 to `typeof`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L177)

<a id="function-function-mq3-game-bot-client-resources-validclient-function-validclient-client-src-mq3-game-bot-client-resources-ml-128060471"></a>
### validClient

```ml
function validClient(client)
```

Require an integer bot client slot within the fixed bot-client capacity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L73)
