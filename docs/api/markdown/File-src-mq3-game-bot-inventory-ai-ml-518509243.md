# `src/mq3/game/bot_inventory_ai.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_inventory_ai`](Package-mq3-game-bot-inventory-ai-1974900935.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)

## Declarations

<a id="function-function-mq3-game-bot-inventory-ai-bit-function-bit-value-src-mq3-game-bot-inventory-ai-ml-1983466427"></a>
### bit

```ml
function bit(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L43)

<a id="function-function-mq3-game-bot-inventory-ai-chooseweapon-function-chooseweapon-services-bot-src-mq3-game-bot-inventory-ai-ml-1583053677"></a>
### chooseWeapon

```ml
function chooseWeapon(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L44)

<a id="function-function-mq3-game-bot-inventory-ai-create-function-create-src-mq3-game-bot-inventory-ai-ml-407876202"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L42)

<a id="constant-constant-mq3-game-bot-inventory-ai-enemy-height-const-enemy-height-headers-enemy-height-src-mq3-game-bot-inventory-ai-ml-1383456247"></a>
### ENEMY_HEIGHT

```ml
const ENEMY_HEIGHT = headers.ENEMY_HEIGHT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L10)

<a id="constant-constant-mq3-game-bot-inventory-ai-enemy-horizontal-dist-const-enemy-horizontal-dist-headers-enemy-horizontal-dist-src-mq3-game-bot-inventory-ai-ml-1857888119"></a>
### ENEMY_HORIZONTAL_DIST

```ml
const ENEMY_HORIZONTAL_DIST = headers.ENEMY_HORIZONTAL_DIST
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L9)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-armor-const-inventory-armor-headers-inventory-armor-src-mq3-game-bot-inventory-ai-ml-1432967073"></a>
### INVENTORY_ARMOR

```ml
const INVENTORY_ARMOR = headers.INVENTORY_ARMOR
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L11)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-bfg10k-const-inventory-bfg10k-headers-inventory-bfg10k-src-mq3-game-bot-inventory-ai-ml-2000012761"></a>
### INVENTORY_BFG10K

```ml
const INVENTORY_BFG10K = headers.INVENTORY_BFG10K
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L20)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-bfgammo-const-inventory-bfgammo-headers-inventory-bfgammo-src-mq3-game-bot-inventory-ai-ml-872208421"></a>
### INVENTORY_BFGAMMO

```ml
const INVENTORY_BFGAMMO = headers.INVENTORY_BFGAMMO
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L29)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-blueflag-const-inventory-blueflag-headers-inventory-blueflag-src-mq3-game-bot-inventory-ai-ml-569598866"></a>
### INVENTORY_BLUEFLAG

```ml
const INVENTORY_BLUEFLAG = headers.INVENTORY_BLUEFLAG
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L40)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-bullets-const-inventory-bullets-headers-inventory-bullets-src-mq3-game-bot-inventory-ai-ml-1444510767"></a>
### INVENTORY_BULLETS

```ml
const INVENTORY_BULLETS = headers.INVENTORY_BULLETS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L23)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-cells-const-inventory-cells-headers-inventory-cells-src-mq3-game-bot-inventory-ai-ml-783521043"></a>
### INVENTORY_CELLS

```ml
const INVENTORY_CELLS = headers.INVENTORY_CELLS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L25)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-environmentsuit-const-inventory-environmentsuit-headers-inventory-environmentsuit-src-mq3-game-bot-inventory-ai-ml-1978215684"></a>
### INVENTORY_ENVIRONMENTSUIT

```ml
const INVENTORY_ENVIRONMENTSUIT = headers.INVENTORY_ENVIRONMENTSUIT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L34)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-flight-const-inventory-flight-headers-inventory-flight-src-mq3-game-bot-inventory-ai-ml-1118364754"></a>
### INVENTORY_FLIGHT

```ml
const INVENTORY_FLIGHT = headers.INVENTORY_FLIGHT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L38)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-gauntlet-const-inventory-gauntlet-headers-inventory-gauntlet-src-mq3-game-bot-inventory-ai-ml-53385962"></a>
### INVENTORY_GAUNTLET

```ml
const INVENTORY_GAUNTLET = headers.INVENTORY_GAUNTLET
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L12)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-grapplinghook-const-inventory-grapplinghook-headers-inventory-grapplinghook-src-mq3-game-bot-inventory-ai-ml-1643491005"></a>
### INVENTORY_GRAPPLINGHOOK

```ml
const INVENTORY_GRAPPLINGHOOK = headers.INVENTORY_GRAPPLINGHOOK
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L21)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-grenadelauncher-const-inventory-grenadelauncher-headers-inventory-grenadelauncher-src-mq3-game-bot-inventory-ai-ml-1775737254"></a>
### INVENTORY_GRENADELAUNCHER

```ml
const INVENTORY_GRENADELAUNCHER = headers.INVENTORY_GRENADELAUNCHER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L15)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-grenades-const-inventory-grenades-headers-inventory-grenades-src-mq3-game-bot-inventory-ai-ml-300441487"></a>
### INVENTORY_GRENADES

```ml
const INVENTORY_GRENADES = headers.INVENTORY_GRENADES
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L24)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-haste-const-inventory-haste-headers-inventory-haste-src-mq3-game-bot-inventory-ai-ml-227186037"></a>
### INVENTORY_HASTE

```ml
const INVENTORY_HASTE = headers.INVENTORY_HASTE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L35)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-health-const-inventory-health-headers-inventory-health-src-mq3-game-bot-inventory-ai-ml-1622556426"></a>
### INVENTORY_HEALTH

```ml
const INVENTORY_HEALTH = headers.INVENTORY_HEALTH
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L30)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-invisibility-const-inventory-invisibility-headers-inventory-invisibility-src-mq3-game-bot-inventory-ai-ml-471653347"></a>
### INVENTORY_INVISIBILITY

```ml
const INVENTORY_INVISIBILITY = headers.INVENTORY_INVISIBILITY
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L36)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-lightning-const-inventory-lightning-headers-inventory-lightning-src-mq3-game-bot-inventory-ai-ml-802543214"></a>
### INVENTORY_LIGHTNING

```ml
const INVENTORY_LIGHTNING = headers.INVENTORY_LIGHTNING
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L17)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-lightningammo-const-inventory-lightningammo-headers-inventory-lightningammo-src-mq3-game-bot-inventory-ai-ml-1701297908"></a>
### INVENTORY_LIGHTNINGAMMO

```ml
const INVENTORY_LIGHTNINGAMMO = headers.INVENTORY_LIGHTNINGAMMO
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L26)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-machinegun-const-inventory-machinegun-headers-inventory-machinegun-src-mq3-game-bot-inventory-ai-ml-1005704661"></a>
### INVENTORY_MACHINEGUN

```ml
const INVENTORY_MACHINEGUN = headers.INVENTORY_MACHINEGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L14)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-medkit-const-inventory-medkit-headers-inventory-medkit-src-mq3-game-bot-inventory-ai-ml-660192718"></a>
### INVENTORY_MEDKIT

```ml
const INVENTORY_MEDKIT = headers.INVENTORY_MEDKIT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L32)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-plasmagun-const-inventory-plasmagun-headers-inventory-plasmagun-src-mq3-game-bot-inventory-ai-ml-286769068"></a>
### INVENTORY_PLASMAGUN

```ml
const INVENTORY_PLASMAGUN = headers.INVENTORY_PLASMAGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L19)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-quad-const-inventory-quad-headers-inventory-quad-src-mq3-game-bot-inventory-ai-ml-312171355"></a>
### INVENTORY_QUAD

```ml
const INVENTORY_QUAD = headers.INVENTORY_QUAD
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L33)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-railgun-const-inventory-railgun-headers-inventory-railgun-src-mq3-game-bot-inventory-ai-ml-924224294"></a>
### INVENTORY_RAILGUN

```ml
const INVENTORY_RAILGUN = headers.INVENTORY_RAILGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L18)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-redflag-const-inventory-redflag-headers-inventory-redflag-src-mq3-game-bot-inventory-ai-ml-1312947687"></a>
### INVENTORY_REDFLAG

```ml
const INVENTORY_REDFLAG = headers.INVENTORY_REDFLAG
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L39)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-regen-const-inventory-regen-headers-inventory-regen-src-mq3-game-bot-inventory-ai-ml-823006499"></a>
### INVENTORY_REGEN

```ml
const INVENTORY_REGEN = headers.INVENTORY_REGEN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L37)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-rocketlauncher-const-inventory-rocketlauncher-headers-inventory-rocketlauncher-src-mq3-game-bot-inventory-ai-ml-1310056804"></a>
### INVENTORY_ROCKETLAUNCHER

```ml
const INVENTORY_ROCKETLAUNCHER = headers.INVENTORY_ROCKETLAUNCHER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L16)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-rockets-const-inventory-rockets-headers-inventory-rockets-src-mq3-game-bot-inventory-ai-ml-542079979"></a>
### INVENTORY_ROCKETS

```ml
const INVENTORY_ROCKETS = headers.INVENTORY_ROCKETS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L27)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-shells-const-inventory-shells-headers-inventory-shells-src-mq3-game-bot-inventory-ai-ml-1937135819"></a>
### INVENTORY_SHELLS

```ml
const INVENTORY_SHELLS = headers.INVENTORY_SHELLS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L22)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-shotgun-const-inventory-shotgun-headers-inventory-shotgun-src-mq3-game-bot-inventory-ai-ml-10669822"></a>
### INVENTORY_SHOTGUN

```ml
const INVENTORY_SHOTGUN = headers.INVENTORY_SHOTGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L13)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-slugs-const-inventory-slugs-headers-inventory-slugs-src-mq3-game-bot-inventory-ai-ml-541550440"></a>
### INVENTORY_SLUGS

```ml
const INVENTORY_SLUGS = headers.INVENTORY_SLUGS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L28)

<a id="constant-constant-mq3-game-bot-inventory-ai-inventory-teleporter-const-inventory-teleporter-headers-inventory-teleporter-src-mq3-game-bot-inventory-ai-ml-1203309540"></a>
### INVENTORY_TELEPORTER

```ml
const INVENTORY_TELEPORTER = headers.INVENTORY_TELEPORTER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L31)

- [mq3.game.bot_inventory_ai.Services](Type-mq3-game-bot-inventory-ai-services-1099795527.md) — struct
<a id="function-function-mq3-game-bot-inventory-ai-updatebattleinventory-function-updatebattleinventory-services-bot-enemy-src-mq3-game-bot-inventory-ai-ml-403686023"></a>
### updateBattleInventory

```ml
function updateBattleInventory(services, bot, enemy)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `enemy` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L52)

<a id="function-function-mq3-game-bot-inventory-ai-updateinventory-function-updateinventory-services-bot-src-mq3-game-bot-inventory-ai-ml-98171451"></a>
### updateInventory

```ml
function updateInventory(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_inventory_ai.ml#L58)
