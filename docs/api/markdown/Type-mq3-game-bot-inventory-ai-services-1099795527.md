# `mq3.game.bot_inventory_ai.Services`

[Home](README.md) · [Source file](File-src-mq3-game-bot-inventory-ai-ml-518509243.md)

<a id="struct-struct-mq3-game-bot-inventory-ai-services-struct-services-src-mq3-game-bot-inventory-ai-ml-1269268935"></a>
## Services

```ml
struct Services
```

`Services` record for bot inventory ai, containing `chooseBestFn`, `selectWeaponFn`, `floatTimeFn`, `entityInfoFn` and `checkItemPickupFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L74)

## Members

<a id="field-field-mq3-game-bot-inventory-ai-services-checkitempickupfn-checkitempickupfn-src-mq3-game-bot-inventory-ai-ml-29071655"></a>
### checkItemPickupFn

```ml
checkItemPickupFn
```

Injected callback for check item pickup; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L84)

<a id="field-field-mq3-game-bot-inventory-ai-services-choosebestfn-choosebestfn-src-mq3-game-bot-inventory-ai-ml-2020917421"></a>
### chooseBestFn

```ml
chooseBestFn
```

Injected callback for choose best; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L76)

<a id="field-field-mq3-game-bot-inventory-ai-services-context-context-src-mq3-game-bot-inventory-ai-ml-355965511"></a>
### context

```ml
context
```

Opaque caller-supplied context available to bot weapon selection, entity lookup, and item-pickup callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L87)

<a id="field-field-mq3-game-bot-inventory-ai-services-entityinfofn-entityinfofn-src-mq3-game-bot-inventory-ai-ml-1269367957"></a>
### entityInfoFn

```ml
entityInfoFn
```

Injected callback for entity info; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L82)

<a id="field-field-mq3-game-bot-inventory-ai-services-floattimefn-floattimefn-src-mq3-game-bot-inventory-ai-ml-1270265143"></a>
### floatTimeFn

```ml
floatTimeFn
```

Injected callback for float time; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L80)

<a id="field-field-mq3-game-bot-inventory-ai-services-selectweaponfn-selectweaponfn-src-mq3-game-bot-inventory-ai-ml-315371095"></a>
### selectWeaponFn

```ml
selectWeaponFn
```

Injected callback for select weapon; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L78)
