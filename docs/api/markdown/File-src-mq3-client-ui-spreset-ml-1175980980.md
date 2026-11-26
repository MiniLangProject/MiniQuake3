# `src/mq3/client/ui_spreset.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_spreset`](Package-mq3-client-ui-spreset-1504101822.md)

Reachable from entry: **no**

## Imports

- `mq3/client/cgame_drawtools.ml` as `drawtools` → [src/mq3/client/cgame_drawtools.ml](File-src-mq3-client-cgame-drawtools-ml-249217190.md)
- `mq3/client/ui_gameinfo.ml` as `gameinfo` → [src/mq3/client/ui_gameinfo.ml](File-src-mq3-client-ui-gameinfo-ml-965434910.md)
- `mq3/client/ui_qmenu.ml` as `qmenu` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="constant-constant-mq3-client-ui-spreset-ca-connected-const-ca-connected-5-src-mq3-client-ui-spreset-ml-1624593918"></a>
### CA_CONNECTED

```ml
const CA_CONNECTED = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_spreset.ml#L13)

<a id="function-function-mq3-client-ui-spreset-create-function-create-game-src-mq3-client-ui-spreset-ml-2133069358"></a>
### create

```ml
function create(game)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `game` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_spreset.ml#L17)

<a id="function-function-mq3-client-ui-spreset-draw-function-draw-kind-x-y-w-h-text-style-color-asset-src-mq3-client-ui-spreset-ml-1866641539"></a>
### draw

```ml
function draw(kind, x, y, w, h, text, style, color, asset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `asset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_spreset.ml#L18)

<a id="constant-constant-mq3-client-ui-spreset-id-no-const-id-no-100-src-mq3-client-ui-spreset-ml-324471700"></a>
### ID_NO

```ml
const ID_NO = 100
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_spreset.ml#L11)

<a id="constant-constant-mq3-client-ui-spreset-id-yes-const-id-yes-101-src-mq3-client-ui-spreset-ml-1023816989"></a>
### ID_YES

```ml
const ID_YES = 101
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_spreset.ml#L12)

- [mq3.client.ui_spreset.Reset](Type-mq3-client-ui-spreset-reset-871040143.md) — struct
<a id="function-function-mq3-client-ui-spreset-reset-cache-function-reset-cache-src-mq3-client-ui-spreset-ml-25776064"></a>
### Reset_Cache

```ml
function Reset_Cache()
```

Reset_Cache


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_spreset.ml#L42)

<a id="function-function-mq3-client-ui-spreset-reset-menudraw-function-reset-menudraw-value-realtime-src-mq3-client-ui-spreset-ml-1315880376"></a>
### Reset_MenuDraw

```ml
function Reset_MenuDraw(value, realtime)
```

Reset_MenuDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_spreset.ml#L37)

<a id="function-function-mq3-client-ui-spreset-reset-menuevent-function-reset-menuevent-value-id-event-src-mq3-client-ui-spreset-ml-1084441138"></a>
### Reset_MenuEvent

```ml
function Reset_MenuEvent(value, id, event)
```

Reset_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_spreset.ml#L21)

<a id="function-function-mq3-client-ui-spreset-reset-menukey-function-reset-menukey-value-key-cursorx-cursory-src-mq3-client-ui-spreset-ml-102937423"></a>
### Reset_MenuKey

```ml
function Reset_MenuKey(value, key, cursorx, cursory)
```

Reset_MenuKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `cursorx` | `dynamic` | — |  |
| `cursory` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_spreset.ml#L26)

<a id="function-function-mq3-client-ui-spreset-ui-resetmenu-function-ui-resetmenu-game-connectionstate-src-mq3-client-ui-spreset-ml-1865268047"></a>
### UI_ResetMenu

```ml
function UI_ResetMenu(game, connectionState)
```

UI_ResetMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `game` | `dynamic` | — |  |
| `connectionState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_spreset.ml#L45)
