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

Updates `state.chatTeam`, `state.chatPlayerNum`, `state.chat.widthInChars`, `state.catcher` during console input `beginMessage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable console input record/storage; this routine assigns `state.chatTeam`, `state.chatPlayerNum`, `state.chat.widthInChars`, `state.catcher`. |
| `team` | `dynamic` | — | Value assigned to `state.chatTeam`. |
| `playerNum` | `dynamic` | — | Value assigned to `state.chatPlayerNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L155)

<a id="constant-constant-mq3-client-console-input-ca-active-const-ca-active-8-src-mq3-client-console-input-ml-1554167611"></a>
### CA_ACTIVE

```ml
const CA_ACTIVE = 8
```

Connection-state value for normal gameplay after game-state loading, defined for deciding whether console and chat input can interact with an active game.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L16)

<a id="function-function-mq3-client-console-input-caughtchar-function-caughtchar-state-ch-src-mq3-client-console-input-ml-634873270"></a>
### caughtChar

```ml
function caughtChar(state, ch)
```

Calls `mq3.client.console_input.charEvent` from console input `caughtChar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.catcher`, `state.chat`, `state.console`. |
| `ch` | `dynamic` | — | Value used by `if (state.catcher&KEYCATCH_MESSAGE)!=0 then return charEvent(state,state.chat,ch) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L305)

<a id="function-function-mq3-client-console-input-caughtkey-function-caughtkey-state-key-shift-ctrl-src-mq3-client-console-input-ml-941697293"></a>
### caughtKey

```ml
function caughtKey(state, key, shift, ctrl)
```

Calls `mq3.client.console_input.messageKey`, `mq3.client.console_input.consoleKey` from console input `caughtKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.catcher`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding console input entry. |
| `shift` | `dynamic` | — | Value used by `if (state.catcher&KEYCATCH_MESSAGE)!=0 then return messageKey(state,key,shift,ctrl) end if`. |
| `ctrl` | `dynamic` | — | Value used by `if (state.catcher&KEYCATCH_MESSAGE)!=0 then return messageKey(state,key,shift,ctrl) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L297)

<a id="function-function-mq3-client-console-input-charevent-function-charevent-state-edit-ch-src-mq3-client-console-input-ml-1084152434"></a>
### charEvent

```ml
function charEvent(state, edit, ch)
```

Updates `edit.text`, `edit.cursor`, `edit.scroll` during console input `charEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared console input state passed to the helper calls in `charEvent`. |
| `edit` | `dynamic` | — | Mutable console input record/storage; this routine assigns `edit.text`, `edit.cursor`, `edit.scroll`. |
| `ch` | `dynamic` | — | Value used by `if ch==22 then return paste(state,edit) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L199)

<a id="function-function-mq3-client-console-input-clear-function-clear-value-src-mq3-client-console-input-ml-398257161"></a>
### clear

```ml
function clear(value)
```

Updates `value.cursor`, `value.scroll`, `value.text` during console input `clear`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable console input record/storage; this routine assigns `value.cursor`, `value.scroll`, `value.text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L166)

<a id="function-function-mq3-client-console-input-clonefield-function-clonefield-value-src-mq3-client-console-input-ml-854431735"></a>
### cloneField

```ml
function cloneField(value)
```

Creates a `mq3.client.console_input.Field` record.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.cursor`, `value.scroll`, `value.widthInChars`, `value.text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L163)

<a id="constant-constant-mq3-client-console-input-command-history-const-command-history-32-src-mq3-client-console-input-ml-1083320052"></a>
### COMMAND_HISTORY

```ml
const COMMAND_HISTORY = 32
```

Number of submitted console commands retained for history navigation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L9)

<a id="function-function-mq3-client-console-input-consolekey-function-consolekey-state-key-shift-ctrl-src-mq3-client-console-input-ml-2024409271"></a>
### consoleKey

```ml
function consoleKey(state, key, shift, ctrl)
```

Updates `state.console.text`, `state.console.cursor`, `state.history[state.nextHistoryLine%COMMAND_HISTORY]`, `state.nextHistoryLine` and additional values during console input `consoleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable console input record/storage; this routine assigns `state.console.text`, `state.console.cursor`, `state.history[state.nextHistoryLine%COMMAND_HISTORY]`, `state.nextHistoryLine` and additional values. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding console input entry. |
| `shift` | `dynamic` | — | Value used by `if (key==K_MWHEELUP and shift) or key==K_UPARROW or key==K_KP_UPARROW or (lowerKey(key)==112 and ctrl) then`. |
| `ctrl` | `dynamic` | — | Value used by `if key==108 and ctrl then emitCommand(state,"clear\\n")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L250)

<a id="function-function-mq3-client-console-input-create-function-create-width-host-src-mq3-client-console-input-ml-2091676498"></a>
### create

```ml
function create(width, host)
```

Calls `mq3.client.console_input.field`, `mq3.client.console_input.State` from console input `create`. The final path returns `State(field(width),field(30),history,0,0,false,0,0,false,-1,host,void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Width in the coordinate space used by `create`. |
| `host` | `dynamic` | — | host record passed to the console input helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L141)

<a id="function-function-mq3-client-console-input-emitcommand-function-emitcommand-state-text-src-mq3-client-console-input-ml-1900380442"></a>
### emitCommand

```ml
function emitCommand(state, text)
```

Calls `state.services.commandFn` from console input `emitCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services`, `state.services.commandFn`, `state.services.context`. |
| `text` | `dynamic` | — | Text consumed or emitted by `emitCommand` in the console input path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L231)

<a id="function-function-mq3-client-console-input-emitprint-function-emitprint-state-text-src-mq3-client-console-input-ml-2143769290"></a>
### emitPrint

```ml
function emitPrint(state, text)
```

Calls `state.services.printFn` from console input `emitPrint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services`, `state.services.printFn`, `state.services.context`. |
| `text` | `dynamic` | — | Text consumed or emitted by `emitPrint` in the console input path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L239)

<a id="function-function-mq3-client-console-input-emitreliable-function-emitreliable-state-text-src-mq3-client-console-input-ml-184139522"></a>
### emitReliable

```ml
function emitReliable(state, text)
```

Calls `state.services.reliableFn` from console input `emitReliable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services`, `state.services.reliableFn`, `state.services.context`. |
| `text` | `dynamic` | — | Text consumed or emitted by `emitReliable` in the console input path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L235)

<a id="function-function-mq3-client-console-input-field-function-field-width-src-mq3-client-console-input-ml-1613142204"></a>
### field

```ml
function field(width)
```

Creates a `mq3.client.console_input.Field` record. Assigns `widthInChars` from `width`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Value used to initialize `Field.widthInChars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L134)

- [mq3.client.console_input.Field](Type-mq3-client-console-input-field-1081259211.md) — struct
<a id="function-function-mq3-client-console-input-fieldkeydown-function-fieldkeydown-state-edit-key-shift-ctrl-src-mq3-client-console-input-ml-664632119"></a>
### fieldKeyDown

```ml
function fieldKeyDown(state, edit, key, shift, ctrl)
```

Updates `edit.text`, `edit.cursor`, `edit.scroll`, `state.overstrike` during console input `fieldKeyDown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable console input record/storage; this routine assigns `state.overstrike`. |
| `edit` | `dynamic` | — | Mutable console input record/storage; this routine assigns `edit.text`, `edit.cursor`, `edit.scroll`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding console input entry. |
| `shift` | `dynamic` | — | Value used by `if (key==K_INS or key==K_KP_INS) and shift then return paste(state,edit) end if`. |
| `ctrl` | `dynamic` | — | Value used by `if key==K_HOME or (lowerKey(key)==97 and ctrl) then edit.cursor=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L217)

<a id="function-function-mq3-client-console-input-insertbyte-function-insertbyte-state-edit-ch-src-mq3-client-console-input-ml-1475128858"></a>
### insertByte

```ml
function insertByte(state, edit, ch)
```

Updates `edit.text`, `edit.cursor`, `edit.scroll` during console input `insertByte`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.overstrike`. |
| `edit` | `dynamic` | — | Mutable console input record/storage; this routine assigns `edit.text`, `edit.cursor`, `edit.scroll`. |
| `ch` | `dynamic` | — | Value used by `if ch<32 then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L174)

<a id="constant-constant-mq3-client-console-input-k-backspace-const-k-backspace-127-src-mq3-client-console-input-ml-765719691"></a>
### K_BACKSPACE

```ml
const K_BACKSPACE = 127
```

Engine key code for the backspace input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L24)

<a id="constant-constant-mq3-client-console-input-k-ctrl-const-k-ctrl-137-src-mq3-client-console-input-ml-345548282"></a>
### K_CTRL

```ml
const K_CTRL = 137
```

Engine key code for the ctrl input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L34)

<a id="constant-constant-mq3-client-console-input-k-del-const-k-del-140-src-mq3-client-console-input-ml-605772324"></a>
### K_DEL

```ml
const K_DEL = 140
```

Engine key code for the del input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L40)

<a id="constant-constant-mq3-client-console-input-k-downarrow-const-k-downarrow-133-src-mq3-client-console-input-ml-265348858"></a>
### K_DOWNARROW

```ml
const K_DOWNARROW = 133
```

Engine key code for the downarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L28)

<a id="constant-constant-mq3-client-console-input-k-end-const-k-end-144-src-mq3-client-console-input-ml-1429629460"></a>
### K_END

```ml
const K_END = 144
```

Engine key code for the end input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L48)

<a id="constant-constant-mq3-client-console-input-k-enter-const-k-enter-13-src-mq3-client-console-input-ml-411401925"></a>
### K_ENTER

```ml
const K_ENTER = 13
```

Engine key code for the enter input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L20)

<a id="constant-constant-mq3-client-console-input-k-escape-const-k-escape-27-src-mq3-client-console-input-ml-1923650954"></a>
### K_ESCAPE

```ml
const K_ESCAPE = 27
```

Engine key code for the escape input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L22)

<a id="constant-constant-mq3-client-console-input-k-home-const-k-home-143-src-mq3-client-console-input-ml-1911284737"></a>
### K_HOME

```ml
const K_HOME = 143
```

Engine key code for the home input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L46)

<a id="constant-constant-mq3-client-console-input-k-ins-const-k-ins-139-src-mq3-client-console-input-ml-1547017812"></a>
### K_INS

```ml
const K_INS = 139
```

Engine key code for the ins input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L38)

<a id="constant-constant-mq3-client-console-input-k-kp-downarrow-const-k-kp-downarrow-167-src-mq3-client-console-input-ml-920209399"></a>
### K_KP_DOWNARROW

```ml
const K_KP_DOWNARROW = 167
```

Engine key code for the kp downarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L52)

<a id="constant-constant-mq3-client-console-input-k-kp-enter-const-k-kp-enter-169-src-mq3-client-console-input-ml-1850578159"></a>
### K_KP_ENTER

```ml
const K_KP_ENTER = 169
```

Engine key code for the kp enter input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L54)

<a id="constant-constant-mq3-client-console-input-k-kp-ins-const-k-kp-ins-170-src-mq3-client-console-input-ml-1767978237"></a>
### K_KP_INS

```ml
const K_KP_INS = 170
```

Engine key code for the kp ins input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L56)

<a id="constant-constant-mq3-client-console-input-k-kp-uparrow-const-k-kp-uparrow-161-src-mq3-client-console-input-ml-1686857499"></a>
### K_KP_UPARROW

```ml
const K_KP_UPARROW = 161
```

Engine key code for the kp uparrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L50)

<a id="constant-constant-mq3-client-console-input-k-leftarrow-const-k-leftarrow-134-src-mq3-client-console-input-ml-1325545819"></a>
### K_LEFTARROW

```ml
const K_LEFTARROW = 134
```

Engine key code for the leftarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L30)

<a id="constant-constant-mq3-client-console-input-k-mwheeldown-const-k-mwheeldown-183-src-mq3-client-console-input-ml-834315471"></a>
### K_MWHEELDOWN

```ml
const K_MWHEELDOWN = 183
```

Engine key code for the mwheeldown input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L58)

<a id="constant-constant-mq3-client-console-input-k-mwheelup-const-k-mwheelup-184-src-mq3-client-console-input-ml-1363966740"></a>
### K_MWHEELUP

```ml
const K_MWHEELUP = 184
```

Engine key code for the mwheelup input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L60)

<a id="constant-constant-mq3-client-console-input-k-pgdn-const-k-pgdn-141-src-mq3-client-console-input-ml-853848419"></a>
### K_PGDN

```ml
const K_PGDN = 141
```

Engine key code for the pgdn input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L42)

<a id="constant-constant-mq3-client-console-input-k-pgup-const-k-pgup-142-src-mq3-client-console-input-ml-284661104"></a>
### K_PGUP

```ml
const K_PGUP = 142
```

Engine key code for the pgup input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L44)

<a id="constant-constant-mq3-client-console-input-k-rightarrow-const-k-rightarrow-135-src-mq3-client-console-input-ml-1629403772"></a>
### K_RIGHTARROW

```ml
const K_RIGHTARROW = 135
```

Engine key code for the rightarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L32)

<a id="constant-constant-mq3-client-console-input-k-shift-const-k-shift-138-src-mq3-client-console-input-ml-1375686031"></a>
### K_SHIFT

```ml
const K_SHIFT = 138
```

Engine key code for the shift input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L36)

<a id="constant-constant-mq3-client-console-input-k-tab-const-k-tab-9-src-mq3-client-console-input-ml-1651554232"></a>
### K_TAB

```ml
const K_TAB = 9
```

Engine key code for the tab input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L18)

<a id="constant-constant-mq3-client-console-input-k-uparrow-const-k-uparrow-132-src-mq3-client-console-input-ml-718251873"></a>
### K_UPARROW

```ml
const K_UPARROW = 132
```

Engine key code for the uparrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L26)

<a id="constant-constant-mq3-client-console-input-keycatch-console-const-keycatch-console-1-src-mq3-client-console-input-ml-768743602"></a>
### KEYCATCH_CONSOLE

```ml
const KEYCATCH_CONSOLE = 1
```

Input-capture bit that routes keyboard events to the console subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L11)

<a id="constant-constant-mq3-client-console-input-keycatch-message-const-keycatch-message-4-src-mq3-client-console-input-ml-809737285"></a>
### KEYCATCH_MESSAGE

```ml
const KEYCATCH_MESSAGE = 4
```

Input-capture bit that routes keyboard events to the message subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L13)

<a id="function-function-mq3-client-console-input-lowerkey-function-lowerkey-key-src-mq3-client-console-input-ml-445775765"></a>
### lowerKey

```ml
function lowerKey(key)
```

Evaluates console input `lowerKey` and returns `key+32`, `key` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding console input entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L169)

<a id="constant-constant-mq3-client-console-input-max-edit-line-const-max-edit-line-256-src-mq3-client-console-input-ml-1836652226"></a>
### MAX_EDIT_LINE

```ml
const MAX_EDIT_LINE = 256
```

Maximum length of a console or editable input line.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L7)

<a id="function-function-mq3-client-console-input-messagekey-function-messagekey-state-key-shift-ctrl-src-mq3-client-console-input-ml-461914219"></a>
### messageKey

```ml
function messageKey(state, key, shift, ctrl)
```

Updates `state.catcher` during console input `messageKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable console input record/storage; this routine assigns `state.catcher`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding console input entry. |
| `shift` | `dynamic` | — | Value used by `return fieldKeyDown(state,state.chat,key,shift,ctrl)`. |
| `ctrl` | `dynamic` | — | Value used by `return fieldKeyDown(state,state.chat,key,shift,ctrl)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L281)

<a id="function-function-mq3-client-console-input-paste-function-paste-state-edit-src-mq3-client-console-input-ml-639892353"></a>
### paste

```ml
function paste(state, edit)
```

Calls `state.services.clipboardFn`, `mq3.client.console_input.insertByte` from console input `paste`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services`, `state.services.clipboardFn`, `state.services.context`. |
| `edit` | `dynamic` | — | Value used by `for each ch in bytes(value) insertByte(state,edit,ch) end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L190)

<a id="function-function-mq3-client-console-input-scroll-function-scroll-state-operation-count-src-mq3-client-console-input-ml-561223759"></a>
### scroll

```ml
function scroll(state, operation, count)
```

Calls `state.services.scrollFn` from console input `scroll`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services`, `state.services.scrollFn`, `state.services.context`. |
| `operation` | `dynamic` | — | Value used by `if state.services!=void and state.services.scrollFn!=void then state.services.scrollFn(state.services.context,operation,count) end if`. |
| `count` | `dynamic` | — | Value used by `if state.services!=void and state.services.scrollFn!=void then state.services.scrollFn(state.services.context,operation,count) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L244)

<a id="function-function-mq3-client-console-input-services-function-services-context-src-mq3-client-console-input-ml-761153617"></a>
### services

```ml
function services(context)
```

Creates a `mq3.client.console_input.Services` record. Assigns `context` from `context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Value used to initialize `Services.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L137)

- [mq3.client.console_input.Services](Type-mq3-client-console-input-services-253625625.md) — struct
- [mq3.client.console_input.State](Type-mq3-client-console-input-state-1098085138.md) — struct
<a id="function-function-mq3-client-console-input-toggleconsole-function-toggleconsole-state-src-mq3-client-console-input-ml-515063373"></a>
### toggleConsole

```ml
function toggleConsole(state)
```

Updates `state.catcher` during console input `toggleConsole`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable console input record/storage; this routine assigns `state.catcher`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/console_input.ml#L147)
