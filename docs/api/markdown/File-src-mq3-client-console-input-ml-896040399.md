# `src/mq3/client/console_input.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.console_input`](Package-mq3-client-console-input-880769269.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-client-console-input-beginmessage-function-beginmessage-state-team-playernum-src-mq3-client-console-input-ml-359665427"></a>
### beginMessage

```ml
function beginMessage(state, team, playerNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `playerNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L48)

<a id="constant-constant-mq3-client-console-input-ca-active-const-ca-active-8-src-mq3-client-console-input-ml-1554167611"></a>
### CA_ACTIVE

```ml
const CA_ACTIVE = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L10)

<a id="function-function-mq3-client-console-input-caughtchar-function-caughtchar-state-ch-src-mq3-client-console-input-ml-634873270"></a>
### caughtChar

```ml
function caughtChar(state, ch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ch` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L144)

<a id="function-function-mq3-client-console-input-caughtkey-function-caughtkey-state-key-shift-ctrl-src-mq3-client-console-input-ml-941697293"></a>
### caughtKey

```ml
function caughtKey(state, key, shift, ctrl)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `shift` | `dynamic` | — |  |
| `ctrl` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L139)

<a id="function-function-mq3-client-console-input-charevent-function-charevent-state-edit-ch-src-mq3-client-console-input-ml-1084152434"></a>
### charEvent

```ml
function charEvent(state, edit, ch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `edit` | `dynamic` | — |  |
| `ch` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L75)

<a id="function-function-mq3-client-console-input-clear-function-clear-value-src-mq3-client-console-input-ml-398257161"></a>
### clear

```ml
function clear(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L55)

<a id="function-function-mq3-client-console-input-clonefield-function-clonefield-value-src-mq3-client-console-input-ml-854431735"></a>
### cloneField

```ml
function cloneField(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L54)

<a id="constant-constant-mq3-client-console-input-command-history-const-command-history-32-src-mq3-client-console-input-ml-1083320052"></a>
### COMMAND_HISTORY

```ml
const COMMAND_HISTORY = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L7)

<a id="function-function-mq3-client-console-input-consolekey-function-consolekey-state-key-shift-ctrl-src-mq3-client-console-input-ml-2024409271"></a>
### consoleKey

```ml
function consoleKey(state, key, shift, ctrl)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `shift` | `dynamic` | — |  |
| `ctrl` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L102)

<a id="function-function-mq3-client-console-input-create-function-create-width-host-src-mq3-client-console-input-ml-2091676498"></a>
### create

```ml
function create(width, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L40)

<a id="function-function-mq3-client-console-input-emitcommand-function-emitcommand-state-text-src-mq3-client-console-input-ml-1900380442"></a>
### emitCommand

```ml
function emitCommand(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L98)

<a id="function-function-mq3-client-console-input-emitprint-function-emitprint-state-text-src-mq3-client-console-input-ml-2143769290"></a>
### emitPrint

```ml
function emitPrint(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L100)

<a id="function-function-mq3-client-console-input-emitreliable-function-emitreliable-state-text-src-mq3-client-console-input-ml-184139522"></a>
### emitReliable

```ml
function emitReliable(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L99)

<a id="function-function-mq3-client-console-input-field-function-field-width-src-mq3-client-console-input-ml-1613142204"></a>
### field

```ml
function field(width)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L38)

- [mq3.client.console_input.Field](Type-mq3-client-console-input-field-1081259211.md) — struct
<a id="function-function-mq3-client-console-input-fieldkeydown-function-fieldkeydown-state-edit-key-shift-ctrl-src-mq3-client-console-input-ml-664632119"></a>
### fieldKeyDown

```ml
function fieldKeyDown(state, edit, key, shift, ctrl)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `edit` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `shift` | `dynamic` | — |  |
| `ctrl` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L87)

<a id="function-function-mq3-client-console-input-insertbyte-function-insertbyte-state-edit-ch-src-mq3-client-console-input-ml-1475128858"></a>
### insertByte

```ml
function insertByte(state, edit, ch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `edit` | `dynamic` | — |  |
| `ch` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L57)

<a id="constant-constant-mq3-client-console-input-k-backspace-const-k-backspace-127-src-mq3-client-console-input-ml-765719691"></a>
### K_BACKSPACE

```ml
const K_BACKSPACE = 127
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L14)

<a id="constant-constant-mq3-client-console-input-k-ctrl-const-k-ctrl-137-src-mq3-client-console-input-ml-345548282"></a>
### K_CTRL

```ml
const K_CTRL = 137
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L19)

<a id="constant-constant-mq3-client-console-input-k-del-const-k-del-140-src-mq3-client-console-input-ml-605772324"></a>
### K_DEL

```ml
const K_DEL = 140
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L22)

<a id="constant-constant-mq3-client-console-input-k-downarrow-const-k-downarrow-133-src-mq3-client-console-input-ml-265348858"></a>
### K_DOWNARROW

```ml
const K_DOWNARROW = 133
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L16)

<a id="constant-constant-mq3-client-console-input-k-end-const-k-end-144-src-mq3-client-console-input-ml-1429629460"></a>
### K_END

```ml
const K_END = 144
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L26)

<a id="constant-constant-mq3-client-console-input-k-enter-const-k-enter-13-src-mq3-client-console-input-ml-411401925"></a>
### K_ENTER

```ml
const K_ENTER = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L12)

<a id="constant-constant-mq3-client-console-input-k-escape-const-k-escape-27-src-mq3-client-console-input-ml-1923650954"></a>
### K_ESCAPE

```ml
const K_ESCAPE = 27
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L13)

<a id="constant-constant-mq3-client-console-input-k-home-const-k-home-143-src-mq3-client-console-input-ml-1911284737"></a>
### K_HOME

```ml
const K_HOME = 143
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L25)

<a id="constant-constant-mq3-client-console-input-k-ins-const-k-ins-139-src-mq3-client-console-input-ml-1547017812"></a>
### K_INS

```ml
const K_INS = 139
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L21)

<a id="constant-constant-mq3-client-console-input-k-kp-downarrow-const-k-kp-downarrow-167-src-mq3-client-console-input-ml-920209399"></a>
### K_KP_DOWNARROW

```ml
const K_KP_DOWNARROW = 167
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L28)

<a id="constant-constant-mq3-client-console-input-k-kp-enter-const-k-kp-enter-169-src-mq3-client-console-input-ml-1850578159"></a>
### K_KP_ENTER

```ml
const K_KP_ENTER = 169
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L29)

<a id="constant-constant-mq3-client-console-input-k-kp-ins-const-k-kp-ins-170-src-mq3-client-console-input-ml-1767978237"></a>
### K_KP_INS

```ml
const K_KP_INS = 170
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L30)

<a id="constant-constant-mq3-client-console-input-k-kp-uparrow-const-k-kp-uparrow-161-src-mq3-client-console-input-ml-1686857499"></a>
### K_KP_UPARROW

```ml
const K_KP_UPARROW = 161
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L27)

<a id="constant-constant-mq3-client-console-input-k-leftarrow-const-k-leftarrow-134-src-mq3-client-console-input-ml-1325545819"></a>
### K_LEFTARROW

```ml
const K_LEFTARROW = 134
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L17)

<a id="constant-constant-mq3-client-console-input-k-mwheeldown-const-k-mwheeldown-183-src-mq3-client-console-input-ml-834315471"></a>
### K_MWHEELDOWN

```ml
const K_MWHEELDOWN = 183
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L31)

<a id="constant-constant-mq3-client-console-input-k-mwheelup-const-k-mwheelup-184-src-mq3-client-console-input-ml-1363966740"></a>
### K_MWHEELUP

```ml
const K_MWHEELUP = 184
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L32)

<a id="constant-constant-mq3-client-console-input-k-pgdn-const-k-pgdn-141-src-mq3-client-console-input-ml-853848419"></a>
### K_PGDN

```ml
const K_PGDN = 141
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L23)

<a id="constant-constant-mq3-client-console-input-k-pgup-const-k-pgup-142-src-mq3-client-console-input-ml-284661104"></a>
### K_PGUP

```ml
const K_PGUP = 142
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L24)

<a id="constant-constant-mq3-client-console-input-k-rightarrow-const-k-rightarrow-135-src-mq3-client-console-input-ml-1629403772"></a>
### K_RIGHTARROW

```ml
const K_RIGHTARROW = 135
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L18)

<a id="constant-constant-mq3-client-console-input-k-shift-const-k-shift-138-src-mq3-client-console-input-ml-1375686031"></a>
### K_SHIFT

```ml
const K_SHIFT = 138
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L20)

<a id="constant-constant-mq3-client-console-input-k-tab-const-k-tab-9-src-mq3-client-console-input-ml-1651554232"></a>
### K_TAB

```ml
const K_TAB = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L11)

<a id="constant-constant-mq3-client-console-input-k-uparrow-const-k-uparrow-132-src-mq3-client-console-input-ml-718251873"></a>
### K_UPARROW

```ml
const K_UPARROW = 132
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L15)

<a id="constant-constant-mq3-client-console-input-keycatch-console-const-keycatch-console-1-src-mq3-client-console-input-ml-768743602"></a>
### KEYCATCH_CONSOLE

```ml
const KEYCATCH_CONSOLE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L8)

<a id="constant-constant-mq3-client-console-input-keycatch-message-const-keycatch-message-4-src-mq3-client-console-input-ml-809737285"></a>
### KEYCATCH_MESSAGE

```ml
const KEYCATCH_MESSAGE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L9)

<a id="function-function-mq3-client-console-input-lowerkey-function-lowerkey-key-src-mq3-client-console-input-ml-445775765"></a>
### lowerKey

```ml
function lowerKey(key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L56)

<a id="constant-constant-mq3-client-console-input-max-edit-line-const-max-edit-line-256-src-mq3-client-console-input-ml-1836652226"></a>
### MAX_EDIT_LINE

```ml
const MAX_EDIT_LINE = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L6)

<a id="function-function-mq3-client-console-input-messagekey-function-messagekey-state-key-shift-ctrl-src-mq3-client-console-input-ml-461914219"></a>
### messageKey

```ml
function messageKey(state, key, shift, ctrl)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `shift` | `dynamic` | — |  |
| `ctrl` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L128)

<a id="function-function-mq3-client-console-input-paste-function-paste-state-edit-src-mq3-client-console-input-ml-639892353"></a>
### paste

```ml
function paste(state, edit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `edit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L70)

<a id="function-function-mq3-client-console-input-scroll-function-scroll-state-operation-count-src-mq3-client-console-input-ml-561223759"></a>
### scroll

```ml
function scroll(state, operation, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `operation` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L101)

<a id="function-function-mq3-client-console-input-services-function-services-context-src-mq3-client-console-input-ml-761153617"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L39)

- [mq3.client.console_input.Services](Type-mq3-client-console-input-services-253625625.md) — struct
- [mq3.client.console_input.State](Type-mq3-client-console-input-state-1098085138.md) — struct
<a id="function-function-mq3-client-console-input-toggleconsole-function-toggleconsole-state-src-mq3-client-console-input-ml-515063373"></a>
### toggleConsole

```ml
function toggleConsole(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L44)
