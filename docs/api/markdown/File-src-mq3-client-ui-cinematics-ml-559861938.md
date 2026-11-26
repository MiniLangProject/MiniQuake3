# `src/mq3/client/ui_cinematics.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_cinematics`](Package-mq3-client-ui-cinematics-1742576150.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_gameinfo.ml` as `game` → [src/mq3/client/ui_gameinfo.ml](File-src-mq3-client-ui-gameinfo-ml-965434910.md)

## Declarations

- [mq3.client.ui_cinematics.Action](Type-mq3-client-ui-cinematics-action-121786194.md) — struct
<a id="constant-constant-mq3-client-ui-cinematics-art-back0-const-art-back0-menu-art-back-0-src-mq3-client-ui-cinematics-ml-156503875"></a>
### ART_BACK0

```ml
const ART_BACK0 = "menu/art/back_0"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L12)

<a id="constant-constant-mq3-client-ui-cinematics-art-back1-const-art-back1-menu-art-back-1-src-mq3-client-ui-cinematics-ml-265206294"></a>
### ART_BACK1

```ml
const ART_BACK1 = "menu/art/back_1"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L13)

<a id="constant-constant-mq3-client-ui-cinematics-art-framel-const-art-framel-menu-art-frame2-l-src-mq3-client-ui-cinematics-ml-365301897"></a>
### ART_FRAMEL

```ml
const ART_FRAMEL = "menu/art/frame2_l"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L14)

<a id="constant-constant-mq3-client-ui-cinematics-art-framer-const-art-framer-menu-art-frame1-r-src-mq3-client-ui-cinematics-ml-1512447104"></a>
### ART_FRAMER

```ml
const ART_FRAMER = "menu/art/frame1_r"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L15)

<a id="function-function-mq3-client-ui-cinematics-backevent-function-backevent-state-event-src-mq3-client-ui-cinematics-ml-205193549"></a>
### backEvent

```ml
function backEvent(state, event)
```

UI_CinematicsMenu_BackEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L23)

<a id="function-function-mq3-client-ui-cinematics-cache-function-cache-state-src-mq3-client-ui-cinematics-ml-1652009565"></a>
### cache

```ml
function cache(state)
```

UI_CinematicsMenu_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L29)

<a id="function-function-mq3-client-ui-cinematics-cinematicsmenu-function-cinematicsmenu-state-src-mq3-client-ui-cinematics-ml-869257725"></a>
### cinematicsMenu

```ml
function cinematicsMenu(state)
```

UI_CinematicsMenu / UI_CinematicsMenu_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L35)

<a id="function-function-mq3-client-ui-cinematics-cinematicsmenuf-function-cinematicsmenuf-state-index-src-mq3-client-ui-cinematics-ml-342854849"></a>
### cinematicsMenuF

```ml
function cinematicsMenuF(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L36)

<a id="function-function-mq3-client-ui-cinematics-create-function-create-data-demoversion-retailactive-src-mq3-client-ui-cinematics-ml-1558847890"></a>
### create

```ml
function create(data, demoVersion, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `demoVersion` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L20)

<a id="function-function-mq3-client-ui-cinematics-emit-function-emit-state-kind-name-text-value-src-mq3-client-ui-cinematics-ml-844257530"></a>
### emit

```ml
function emit(state, kind, name, text, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L21)

<a id="constant-constant-mq3-client-ui-cinematics-id-back-const-id-back-10-src-mq3-client-ui-cinematics-ml-1814383444"></a>
### ID_BACK

```ml
const ID_BACK = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L9)

<a id="constant-constant-mq3-client-ui-cinematics-id-cin-end-const-id-cin-end-20-src-mq3-client-ui-cinematics-ml-1297285553"></a>
### ID_CIN_END

```ml
const ID_CIN_END = 20
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L11)

<a id="constant-constant-mq3-client-ui-cinematics-id-cin-idlogo-const-id-cin-idlogo-11-src-mq3-client-ui-cinematics-ml-113619923"></a>
### ID_CIN_IDLOGO

```ml
const ID_CIN_IDLOGO = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L10)

<a id="function-function-mq3-client-ui-cinematics-init-function-init-state-src-mq3-client-ui-cinematics-ml-365588285"></a>
### init

```ml
function init(state)
```

UI_CinematicsMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L31)

<a id="function-function-mq3-client-ui-cinematics-menuevent-function-menuevent-state-id-event-src-mq3-client-ui-cinematics-ml-1875642280"></a>
### menuEvent

```ml
function menuEvent(state, id, event)
```

UI_CinematicsMenu_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L25)

<a id="constant-constant-mq3-client-ui-cinematics-qm-activated-const-qm-activated-3-src-mq3-client-ui-cinematics-ml-1678810118"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_cinematics.ml#L8)

- [mq3.client.ui_cinematics.State](Type-mq3-client-ui-cinematics-state-481223309.md) — struct
