# `src/mq3/client/ui_confirm.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_confirm`](Package-mq3-client-ui-confirm-1341482028.md)

Reachable from entry: **no**

## Declarations

<a id="constant-constant-mq3-client-ui-confirm-art-confirm-frame-const-art-confirm-frame-menu-art-cut-frame-src-mq3-client-ui-confirm-ml-1986237325"></a>
### ART_CONFIRM_FRAME

```ml
const ART_CONFIRM_FRAME = "menu/art/cut_frame"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L10)

<a id="constant-constant-mq3-client-ui-confirm-ca-connected-const-ca-connected-5-src-mq3-client-ui-confirm-ml-1639926946"></a>
### CA_CONNECTED

```ml
const CA_CONNECTED = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L7)

<a id="function-function-mq3-client-ui-confirm-cache-function-cache-src-mq3-client-ui-confirm-ml-475156892"></a>
### cache

```ml
function cache()
```

ConfirmMenu_Cache


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L52)

- [mq3.client.ui_confirm.ConfirmItem](Type-mq3-client-ui-confirm-confirmitem-370753701.md) — struct
- [mq3.client.ui_confirm.ConfirmMenu](Type-mq3-client-ui-confirm-confirmmenu-178757785.md) — struct
<a id="function-function-mq3-client-ui-confirm-draw-function-draw-menu-src-mq3-client-ui-confirm-ml-312098759"></a>
### draw

```ml
function draw(menu)
```

ConfirmMenu_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L45)

<a id="function-function-mq3-client-ui-confirm-drawmessage-function-drawmessage-menu-src-mq3-client-ui-confirm-ml-204459285"></a>
### drawMessage

```ml
function drawMessage(menu)
```

MessageMenu_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L35)

<a id="function-function-mq3-client-ui-confirm-event-function-event-menu-id-eventcode-src-mq3-client-ui-confirm-ml-632281715"></a>
### event

```ml
function event(menu, id, eventCode)
```

ConfirmMenu_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `eventCode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L16)

<a id="constant-constant-mq3-client-ui-confirm-id-confirm-no-const-id-confirm-no-10-src-mq3-client-ui-confirm-ml-761994326"></a>
### ID_CONFIRM_NO

```ml
const ID_CONFIRM_NO = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L8)

<a id="constant-constant-mq3-client-ui-confirm-id-confirm-yes-const-id-confirm-yes-11-src-mq3-client-ui-confirm-ml-1484175053"></a>
### ID_CONFIRM_YES

```ml
const ID_CONFIRM_YES = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L9)

<a id="function-function-mq3-client-ui-confirm-key-function-key-menu-keyname-src-mq3-client-ui-confirm-ml-106692751"></a>
### key

```ml
function key(menu, keyName)
```

ConfirmMenu_Key

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — |  |
| `keyName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L25)

<a id="function-function-mq3-client-ui-confirm-message-function-message-lines-connectionstate-okwidth-src-mq3-client-ui-confirm-ml-178557796"></a>
### message

```ml
function message(lines, connectionState, okWidth)
```

UI_Message

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lines` | `dynamic` | — |  |
| `connectionState` | `dynamic` | — |  |
| `okWidth` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L67)

<a id="function-function-mq3-client-ui-confirm-open-function-open-question-drawcallback-actioncallback-connectionstate-yesnowidth-yeswidth-slashwidth-src-mq3-client-ui-confirm-ml-1218554923"></a>
### open

```ml
function open(question, drawCallback, actionCallback, connectionState, yesNoWidth, yesWidth, slashWidth)
```

UI_ConfirmMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `question` | `dynamic` | — |  |
| `drawCallback` | `dynamic` | — |  |
| `actionCallback` | `dynamic` | — |  |
| `connectionState` | `dynamic` | — |  |
| `yesNoWidth` | `dynamic` | — |  |
| `yesWidth` | `dynamic` | — |  |
| `slashWidth` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L62)

<a id="function-function-mq3-client-ui-confirm-openstyle-function-openstyle-question-style-drawcallback-actioncallback-connectionstate-yesnowidth-yeswidth-slashwidth-src-mq3-client-ui-confirm-ml-1801257246"></a>
### openStyle

```ml
function openStyle(question, style, drawCallback, actionCallback, connectionState, yesNoWidth, yesWidth, slashWidth)
```

UI_ConfirmMenu_Style

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `question` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `drawCallback` | `dynamic` | — |  |
| `actionCallback` | `dynamic` | — |  |
| `connectionState` | `dynamic` | — |  |
| `yesNoWidth` | `dynamic` | — |  |
| `yesWidth` | `dynamic` | — |  |
| `slashWidth` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L55)

<a id="constant-constant-mq3-client-ui-confirm-qm-activated-const-qm-activated-3-src-mq3-client-ui-confirm-ml-215004568"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L6)
