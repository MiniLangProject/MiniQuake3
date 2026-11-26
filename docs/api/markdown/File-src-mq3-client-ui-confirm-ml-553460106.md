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

Virtual shader or image asset name used for the menu's confirm frame artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_confirm.ml#L17)

<a id="constant-constant-mq3-client-ui-confirm-ca-connected-const-ca-connected-5-src-mq3-client-ui-confirm-ml-1639926946"></a>
### CA_CONNECTED

```ml
const CA_CONNECTED = 5
```

Connection-state value for a completed handshake before game-state loading, defined for integrating confirmation menus with the client's connection-state vocabulary.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_confirm.ml#L11)

<a id="function-function-mq3-client-ui-confirm-cache-function-cache-src-mq3-client-ui-confirm-ml-475156892"></a>
### cache

```ml
function cache()
```

ConfirmMenu_Cache


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_confirm.ml#L104)

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
| `menu` | `dynamic` | — | Record read through `menu.question`, `menu.slashX`, `menu.drawCallback`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_confirm.ml#L97)

<a id="function-function-mq3-client-ui-confirm-drawmessage-function-drawmessage-menu-src-mq3-client-ui-confirm-ml-204459285"></a>
### drawMessage

```ml
function drawMessage(menu)
```

MessageMenu_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Record read through `menu.lines`, `menu.drawCallback`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_confirm.ml#L86)

<a id="function-function-mq3-client-ui-confirm-event-function-event-menu-id-eventcode-src-mq3-client-ui-confirm-ml-632281715"></a>
### event

```ml
function event(menu, id, eventCode)
```

ConfirmMenu_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI confirm record/storage; this routine assigns `menu.actions`, `menu.result`. |
| `id` | `dynamic` | — | Value assigned to `menu.result`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_confirm.ml#L64)

<a id="constant-constant-mq3-client-ui-confirm-id-confirm-no-const-id-confirm-no-10-src-mq3-client-ui-confirm-ml-761994326"></a>
### ID_CONFIRM_NO

```ml
const ID_CONFIRM_NO = 10
```

Menu control identifier routed to the confirm no action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_confirm.ml#L13)

<a id="constant-constant-mq3-client-ui-confirm-id-confirm-yes-const-id-confirm-yes-11-src-mq3-client-ui-confirm-ml-1484175053"></a>
### ID_CONFIRM_YES

```ml
const ID_CONFIRM_YES = 11
```

Menu control identifier routed to the confirm yes action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_confirm.ml#L15)

<a id="function-function-mq3-client-ui-confirm-key-function-key-menu-keyname-src-mq3-client-ui-confirm-ml-106692751"></a>
### key

```ml
function key(menu, keyName)
```

ConfirmMenu_Key

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `menu` | `dynamic` | — | Mutable UI confirm record/storage; this routine assigns `menu.actions`. |
| `keyName` | `dynamic` | — | Value used by `defaultKey=keyName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_confirm.ml#L75)

<a id="function-function-mq3-client-ui-confirm-message-function-message-lines-connectionstate-okwidth-src-mq3-client-ui-confirm-ml-178557796"></a>
### message

```ml
function message(lines, connectionState, okWidth)
```

UI_Message

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lines` | `dynamic` | — | Value used by `return ConfirmMenu(true,connectionState<CA_CONNECTED,"",21,0,lines,[item],cache(),["push","cursor:OK"],false,false,false)`. |
| `connectionState` | `dynamic` | — | Value used by `return ConfirmMenu(true,connectionState<CA_CONNECTED,"",21,0,lines,[item],cache(),["push","cursor:OK"],false,false,false)`. |
| `okWidth` | `dynamic` | — | Value used by `l1=320-(okWidth/2)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_confirm.ml#L137)

<a id="function-function-mq3-client-ui-confirm-open-function-open-question-drawcallback-actioncallback-connectionstate-yesnowidth-yeswidth-slashwidth-src-mq3-client-ui-confirm-ml-1218554923"></a>
### open

```ml
function open(question, drawCallback, actionCallback, connectionState, yesNoWidth, yesWidth, slashWidth)
```

UI_ConfirmMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `question` | `dynamic` | — | Argument 1 of `mq3.client.ui_confirm.openStyle`. |
| `drawCallback` | `dynamic` | — | Argument 3 of `mq3.client.ui_confirm.openStyle`. |
| `actionCallback` | `dynamic` | — | Argument 4 of `mq3.client.ui_confirm.openStyle`. |
| `connectionState` | `dynamic` | — | Argument 5 of `mq3.client.ui_confirm.openStyle`. |
| `yesNoWidth` | `dynamic` | — | Argument 6 of `mq3.client.ui_confirm.openStyle`. |
| `yesWidth` | `dynamic` | — | Argument 7 of `mq3.client.ui_confirm.openStyle`. |
| `slashWidth` | `dynamic` | — | Argument 8 of `mq3.client.ui_confirm.openStyle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_confirm.ml#L129)

<a id="function-function-mq3-client-ui-confirm-openstyle-function-openstyle-question-style-drawcallback-actioncallback-connectionstate-yesnowidth-yeswidth-slashwidth-src-mq3-client-ui-confirm-ml-1801257246"></a>
### openStyle

```ml
function openStyle(question, style, drawCallback, actionCallback, connectionState, yesNoWidth, yesWidth, slashWidth)
```

UI_ConfirmMenu_Style

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `question` | `dynamic` | — | Value used by `return ConfirmMenu(true,connectionState<CA_CONNECTED,question,style,l2,[],items,cache(),["push","cursor:NO"],false,drawCallback,actionCallback)`. |
| `style` | `dynamic` | — | Value used by `return ConfirmMenu(true,connectionState<CA_CONNECTED,question,style,l2,[],items,cache(),["push","cursor:NO"],false,drawCallback,actionCallback)`. |
| `drawCallback` | `dynamic` | — | Value used by `return ConfirmMenu(true,connectionState<CA_CONNECTED,question,style,l2,[],items,cache(),["push","cursor:NO"],false,drawCallback,actionCallback)`. |
| `actionCallback` | `dynamic` | — | Value used by `return ConfirmMenu(true,connectionState<CA_CONNECTED,question,style,l2,[],items,cache(),["push","cursor:NO"],false,drawCallback,actionCallback)`. |
| `connectionState` | `dynamic` | — | Value used by `return ConfirmMenu(true,connectionState<CA_CONNECTED,question,style,l2,[],items,cache(),["push","cursor:NO"],false,drawCallback,actionCallback)`. |
| `yesNoWidth` | `dynamic` | — | Value used by `l1=320-(yesNoWidth/2)`. |
| `yesWidth` | `dynamic` | — | Value used by `l2=l1+yesWidth+3`. |
| `slashWidth` | `dynamic` | — | Value used by `l3=l2+slashWidth+3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_confirm.ml#L115)

<a id="constant-constant-mq3-client-ui-confirm-qm-activated-const-qm-activated-3-src-mq3-client-ui-confirm-ml-215004568"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the confirmation dialog before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_confirm.ml#L8)
