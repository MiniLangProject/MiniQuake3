# `src/mq3/client/original_ui_session.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.original_ui_session`](Package-mq3-client-original-ui-session-1384574642.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/keycodes.ml` as `q3keys` → [src/mq3/client/keycodes.ml](File-src-mq3-client-keycodes-ml-1532276368.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)

## Declarations

<a id="function-function-mq3-client-original-ui-session-acceptsinput-function-acceptsinput-state-src-mq3-client-original-ui-session-ml-617878797"></a>
### acceptsInput

```ml
function acceptsInput(state)
```

Computes `active(state) and (keyCatcher(state)&KEYCATCH_CONSOLE)==0` for original UI session `acceptsInput`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared original UI session state passed to the helper calls in `acceptsInput`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L241)

<a id="function-function-mq3-client-original-ui-session-active-function-active-state-src-mq3-client-original-ui-session-ml-1402113373"></a>
### active

```ml
function active(state)
```

Computes `(keyCatcher(state)&KEYCATCH_UI)!=0` for original UI session `active`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared original UI session state passed to the helper calls in `active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L238)

<a id="function-function-mq3-client-original-ui-session-binding-function-binding-virtualkey-quakekey-normalchar-shiftedchar-src-mq3-client-original-ui-session-ml-1123066254"></a>
### binding

```ml
function binding(virtualKey, quakeKey, normalChar, shiftedChar)
```

Creates a `mq3.client.original_ui_session.Binding` record. Assigns `virtualKey` from `virtualKey`, `quakeKey` from `quakeKey`, `normalChar` from `normalChar`, `shiftedChar` from `shiftedChar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `virtualKey` | `dynamic` | — | Value used to initialize `Binding.virtualKey`. |
| `quakeKey` | `dynamic` | — | Value used to initialize `Binding.quakeKey`. |
| `normalChar` | `dynamic` | — | Value used to initialize `Binding.normalChar`. |
| `shiftedChar` | `dynamic` | — | Value used to initialize `Binding.shiftedChar`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L212)

- [mq3.client.original_ui_session.Binding](Type-mq3-client-original-ui-session-binding-2074068013.md) — struct
<a id="function-function-mq3-client-original-ui-session-bindings-function-bindings-src-mq3-client-original-ui-session-ml-769254578"></a>
### bindings

```ml
function bindings()
```

Calls `mq3.client.original_ui_session.binding` from original UI session `bindings`. The final path returns `result`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L214)

<a id="function-function-mq3-client-original-ui-session-close-function-close-state-src-mq3-client-original-ui-session-ml-1513097161"></a>
### close

```ml
function close(state)
```

Adapts `mq3.client.original_ui_session.setMenu` to original UI session `close`, returning its result for `state, UIMENU_NONE`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.original_ui_session.setMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L269)

<a id="function-function-mq3-client-original-ui-session-create-function-create-serviceset-inputcontext-keydownfn-mousedeltafn-src-mq3-client-original-ui-session-ml-436160596"></a>
### create

```ml
function create(serviceSet, inputContext, keyDownFn, mouseDeltaFn)
```

Calls `mq3.client.original_ui_session.bindings`, `mq3.client.original_ui_session.State` from original UI session `create`. The final path returns `State(serviceSet,inputContext,keyDownFn,mouseDeltaFn,mapped,array(len(mapped),false),0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serviceSet` | `dynamic` | — | Record read through `serviceSet.catcherFn`, `serviceSet.keyEventFn`, `serviceSet.mouseEventFn`, `serviceSet.refreshFn` and additional values. |
| `inputContext` | `dynamic` | — | Value used by `return State(serviceSet,inputContext,keyDownFn,mouseDeltaFn,mapped,array(len(mapped),false),0)`. |
| `keyDownFn` | `dynamic` | — | Callback invoked by `create` for key down. |
| `mouseDeltaFn` | `dynamic` | — | Callback invoked by `create` for mouse delta. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L228)

<a id="function-function-mq3-client-original-ui-session-dispatchkey-function-dispatchkey-state-key-down-character-shifted-src-mq3-client-original-ui-session-ml-207897704"></a>
### dispatchKey

```ml
function dispatchKey(state, key, down, character, shifted)
```

Calls `mq3.client.original_ui_session.active`, `mq3.client.original_ui_session.openIngame`, `mq3.client.original_ui_session.acceptsInput` and additional helpers from original UI session `dispatchKey`. The final path returns `sent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services.keyEventFn`, `state.services.context`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding original UI session entry. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |
| `character` | `dynamic` | — | Value used by `if down and character>0 then`. |
| `shifted` | `dynamic` | — | Value used by `if shifted then value=shifted end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L284)

<a id="function-function-mq3-client-original-ui-session-drawconnectscreen-function-drawconnectscreen-state-overlay-src-mq3-client-original-ui-session-ml-120874711"></a>
### drawConnectScreen

```ml
function drawConnectScreen(state, overlay)
```

Calls `state.services.connectFn` from original UI session `drawConnectScreen`. The final path returns `state.services.connectFn(state.services.context,overlay)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services.connectFn`, `state.services.context`. |
| `overlay` | `dynamic` | — | Value used by `return state.services.connectFn(state.services.context,overlay)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L273)

<a id="function-function-mq3-client-original-ui-session-fail-function-fail-message-src-mq3-client-original-ui-session-ml-1423018083"></a>
### fail

```ml
function fail(message)
```

Creates the original UI session error `7686` with diagnostic text `"original UI session: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"original UI session: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L195)

<a id="function-function-mq3-client-original-ui-session-finishoriginaluiframe-function-finishoriginaluiframe-state-now-menuopened-keyevents-charevents-mouseevents-src-mq3-client-original-ui-session-ml-1939843834"></a>
### finishOriginalUiFrame

```ml
function finishOriginalUiFrame(state, now, menuOpened, keyEvents, charEvents, mouseEvents)
```

Updates `state.frameCount` during original UI session `finishOriginalUiFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable original UI session record/storage; this routine assigns `state.frameCount`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `menuOpened` | `dynamic` | — | Value used by `return Frame(active(state),refreshed,menuOpened,keyEvents,charEvents,mouseEvents,commandStart,count-commandStart,count)`. |
| `keyEvents` | `dynamic` | — | Value used by `return Frame(active(state),refreshed,menuOpened,keyEvents,charEvents,mouseEvents,commandStart,count-commandStart,count)`. |
| `charEvents` | `dynamic` | — | Value used by `return Frame(active(state),refreshed,menuOpened,keyEvents,charEvents,mouseEvents,commandStart,count-commandStart,count)`. |
| `mouseEvents` | `dynamic` | — | Value used by `return Frame(active(state),refreshed,menuOpened,keyEvents,charEvents,mouseEvents,commandStart,count-commandStart,count)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L330)

<a id="function-function-mq3-client-original-ui-session-frame-function-frame-state-now-src-mq3-client-original-ui-session-ml-421186389"></a>
### frame

```ml
function frame(state, now)
```

Updates `state.down[index]` during original UI session `frame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable original UI session record/storage; this routine assigns `state.down[index]`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L301)

- [mq3.client.original_ui_session.Frame](Type-mq3-client-original-ui-session-frame-1069389137.md) — struct
<a id="function-function-mq3-client-original-ui-session-framequeued-function-framequeued-state-now-events-src-mq3-client-original-ui-session-ml-921993220"></a>
### frameQueued

```ml
function frameQueued(state, now, events)
```

Win32 supplies key transitions, text and pointer deltas in message order. Keep physical keys distinct from WM_CHAR, as in CL_KeyEvent/CL_CharEvent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services.stateEventFn`, `state.services.context`, `state.services.keyEventFn`, `state.services.mouseEventFn`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `events` | `dynamic` | — | Value used by `for each event in events`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L344)

<a id="constant-constant-mq3-client-original-ui-session-k-alt-const-k-alt-q3keys-k-alt-src-mq3-client-original-ui-session-ml-845657898"></a>
### K_ALT

```ml
const K_ALT = q3keys.K_ALT
```

Engine key code for the alt input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L26)

<a id="constant-constant-mq3-client-original-ui-session-k-backspace-const-k-backspace-q3keys-k-backspace-src-mq3-client-original-ui-session-ml-2093249826"></a>
### K_BACKSPACE

```ml
const K_BACKSPACE = q3keys.K_BACKSPACE
```

Engine key code for the backspace input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L16)

<a id="constant-constant-mq3-client-original-ui-session-k-char-flag-const-k-char-flag-q3keys-k-char-flag-src-mq3-client-original-ui-session-ml-641930286"></a>
### K_CHAR_FLAG

```ml
const K_CHAR_FLAG = q3keys.K_CHAR_FLAG
```

Engine key code for the char flag input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L14)

<a id="constant-constant-mq3-client-original-ui-session-k-ctrl-const-k-ctrl-q3keys-k-ctrl-src-mq3-client-original-ui-session-ml-853447552"></a>
### K_CTRL

```ml
const K_CTRL = q3keys.K_CTRL
```

Engine key code for the ctrl input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L28)

<a id="constant-constant-mq3-client-original-ui-session-k-del-const-k-del-q3keys-k-del-src-mq3-client-original-ui-session-ml-36797252"></a>
### K_DEL

```ml
const K_DEL = q3keys.K_DEL
```

Engine key code for the del input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L34)

<a id="constant-constant-mq3-client-original-ui-session-k-downarrow-const-k-downarrow-q3keys-k-downarrow-src-mq3-client-original-ui-session-ml-810190476"></a>
### K_DOWNARROW

```ml
const K_DOWNARROW = q3keys.K_DOWNARROW
```

Engine key code for the downarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L20)

<a id="constant-constant-mq3-client-original-ui-session-k-end-const-k-end-q3keys-k-end-src-mq3-client-original-ui-session-ml-561050260"></a>
### K_END

```ml
const K_END = q3keys.K_END
```

Engine key code for the end input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L42)

<a id="constant-constant-mq3-client-original-ui-session-k-f1-const-k-f1-q3keys-k-f1-src-mq3-client-original-ui-session-ml-1237929832"></a>
### K_F1

```ml
const K_F1 = q3keys.K_F1
```

Engine key code for the f1 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L44)

<a id="constant-constant-mq3-client-original-ui-session-k-home-const-k-home-q3keys-k-home-src-mq3-client-original-ui-session-ml-1141314294"></a>
### K_HOME

```ml
const K_HOME = q3keys.K_HOME
```

Engine key code for the home input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L40)

<a id="constant-constant-mq3-client-original-ui-session-k-ins-const-k-ins-q3keys-k-ins-src-mq3-client-original-ui-session-ml-2008069021"></a>
### K_INS

```ml
const K_INS = q3keys.K_INS
```

Engine key code for the ins input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L32)

<a id="constant-constant-mq3-client-original-ui-session-k-leftarrow-const-k-leftarrow-q3keys-k-leftarrow-src-mq3-client-original-ui-session-ml-817445039"></a>
### K_LEFTARROW

```ml
const K_LEFTARROW = q3keys.K_LEFTARROW
```

Engine key code for the leftarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L22)

<a id="constant-constant-mq3-client-original-ui-session-k-mouse1-const-k-mouse1-q3keys-k-mouse1-src-mq3-client-original-ui-session-ml-912368533"></a>
### K_MOUSE1

```ml
const K_MOUSE1 = q3keys.K_MOUSE1
```

Engine key code for the mouse1 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L46)

<a id="constant-constant-mq3-client-original-ui-session-k-mouse2-const-k-mouse2-q3keys-k-mouse2-src-mq3-client-original-ui-session-ml-2122760602"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = q3keys.K_MOUSE2
```

Engine key code for the mouse2 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L48)

<a id="constant-constant-mq3-client-original-ui-session-k-mouse3-const-k-mouse3-q3keys-k-mouse3-src-mq3-client-original-ui-session-ml-1845948815"></a>
### K_MOUSE3

```ml
const K_MOUSE3 = q3keys.K_MOUSE3
```

Engine key code for the mouse3 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L50)

<a id="constant-constant-mq3-client-original-ui-session-k-pgdn-const-k-pgdn-q3keys-k-pgdn-src-mq3-client-original-ui-session-ml-933089786"></a>
### K_PGDN

```ml
const K_PGDN = q3keys.K_PGDN
```

Engine key code for the pgdn input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L36)

<a id="constant-constant-mq3-client-original-ui-session-k-pgup-const-k-pgup-q3keys-k-pgup-src-mq3-client-original-ui-session-ml-2052174095"></a>
### K_PGUP

```ml
const K_PGUP = q3keys.K_PGUP
```

Engine key code for the pgup input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L38)

<a id="constant-constant-mq3-client-original-ui-session-k-rightarrow-const-k-rightarrow-q3keys-k-rightarrow-src-mq3-client-original-ui-session-ml-119537930"></a>
### K_RIGHTARROW

```ml
const K_RIGHTARROW = q3keys.K_RIGHTARROW
```

Engine key code for the rightarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L24)

<a id="constant-constant-mq3-client-original-ui-session-k-shift-const-k-shift-q3keys-k-shift-src-mq3-client-original-ui-session-ml-140357165"></a>
### K_SHIFT

```ml
const K_SHIFT = q3keys.K_SHIFT
```

Engine key code for the shift input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L30)

<a id="constant-constant-mq3-client-original-ui-session-k-uparrow-const-k-uparrow-q3keys-k-uparrow-src-mq3-client-original-ui-session-ml-1257891639"></a>
### K_UPARROW

```ml
const K_UPARROW = q3keys.K_UPARROW
```

Engine key code for the uparrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L18)

<a id="constant-constant-mq3-client-original-ui-session-keycatch-console-const-keycatch-console-1-src-mq3-client-original-ui-session-ml-2046673380"></a>
### KEYCATCH_CONSOLE

```ml
const KEYCATCH_CONSOLE = 1
```

Input-capture bit that routes keyboard events to the console subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L12)

<a id="constant-constant-mq3-client-original-ui-session-keycatch-ui-const-keycatch-ui-2-src-mq3-client-original-ui-session-ml-421401359"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```

UI keyboard-capture mask used when coordinating keyboard ownership with the original UI virtual machine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L10)

<a id="function-function-mq3-client-original-ui-session-keycatcher-function-keycatcher-state-src-mq3-client-original-ui-session-ml-358380681"></a>
### keyCatcher

```ml
function keyCatcher(state)
```

Adapts `state.services.catcherFn` to original UI session `keyCatcher`, returning its result for `state.services.context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services.catcherFn`, `state.services.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L235)

<a id="function-function-mq3-client-original-ui-session-openbadcdkey-function-openbadcdkey-state-src-mq3-client-original-ui-session-ml-2027256801"></a>
### openBadCdKey

```ml
function openBadCdKey(state)
```

Adapts `mq3.client.original_ui_session.setMenu` to original UI session `openBadCdKey`, returning its result for `state, UIMENU_BAD_CD_KEY`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.original_ui_session.setMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L260)

<a id="function-function-mq3-client-original-ui-session-openingame-function-openingame-state-src-mq3-client-original-ui-session-ml-1591789433"></a>
### openIngame

```ml
function openIngame(state)
```

Adapts `mq3.client.original_ui_session.setMenu` to original UI session `openIngame`, returning its result for `state, UIMENU_INGAME`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.original_ui_session.setMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L254)

<a id="function-function-mq3-client-original-ui-session-openmain-function-openmain-state-src-mq3-client-original-ui-session-ml-827953921"></a>
### openMain

```ml
function openMain(state)
```

Adapts `mq3.client.original_ui_session.setMenu` to original UI session `openMain`, returning its result for `state, UIMENU_MAIN`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.original_ui_session.setMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L251)

<a id="function-function-mq3-client-original-ui-session-openneedcd-function-openneedcd-state-src-mq3-client-original-ui-session-ml-1302177205"></a>
### openNeedCd

```ml
function openNeedCd(state)
```

Adapts `mq3.client.original_ui_session.setMenu` to original UI session `openNeedCd`, returning its result for `state, UIMENU_NEED_CD`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.original_ui_session.setMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L257)

<a id="function-function-mq3-client-original-ui-session-openpostgame-function-openpostgame-state-src-mq3-client-original-ui-session-ml-840971573"></a>
### openPostgame

```ml
function openPostgame(state)
```

Adapts `mq3.client.original_ui_session.setMenu` to original UI session `openPostgame`, returning its result for `state, UIMENU_POSTGAME`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.original_ui_session.setMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L266)

<a id="function-function-mq3-client-original-ui-session-openteam-function-openteam-state-src-mq3-client-original-ui-session-ml-1583707557"></a>
### openTeam

```ml
function openTeam(state)
```

Adapts `mq3.client.original_ui_session.setMenu` to original UI session `openTeam`, returning its result for `state, UIMENU_TEAM`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.original_ui_session.setMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L263)

<a id="function-function-mq3-client-original-ui-session-services-function-services-context-catcherfn-keyeventfn-mouseeventfn-refreshfn-menufn-commandcountfn-src-mq3-client-original-ui-session-ml-840669915"></a>
### services

```ml
function services(context, catcherFn, keyEventFn, mouseEventFn, refreshFn, menuFn, commandCountFn)
```

Creates a `mq3.client.original_ui_session.Services` record. Assigns `context` from `context`, `catcherFn` from `catcherFn`, `keyEventFn` from `keyEventFn`, `mouseEventFn` from `mouseEventFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Value used to initialize `Services.context`. |
| `catcherFn` | `dynamic` | — | Value used to initialize `Services.catcherFn`. |
| `keyEventFn` | `dynamic` | — | Value used to initialize `Services.keyEventFn`. |
| `mouseEventFn` | `dynamic` | — | Value used to initialize `Services.mouseEventFn`. |
| `refreshFn` | `dynamic` | — | Value used to initialize `Services.refreshFn`. |
| `menuFn` | `dynamic` | — | Value used to initialize `Services.menuFn`. |
| `commandCountFn` | `dynamic` | — | Value used to initialize `Services.commandCountFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L204)

- [mq3.client.original_ui_session.Services](Type-mq3-client-original-ui-session-services-1297413020.md) — struct
<a id="function-function-mq3-client-original-ui-session-setmenu-function-setmenu-state-menu-src-mq3-client-original-ui-session-ml-2099302558"></a>
### setMenu

```ml
function setMenu(state, menu)
```

Calls `state.services.menuFn` from original UI session `setMenu`. The final path returns `state.services.menuFn(state.services.context,menu)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services.menuFn`, `state.services.context`. |
| `menu` | `dynamic` | — | Value used by `if state==void or menu<UIMENU_NONE or menu>UIMENU_POSTGAME then return fail("invalid active menu") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L245)

- [mq3.client.original_ui_session.State](Type-mq3-client-original-ui-session-state-289426633.md) — struct
<a id="constant-constant-mq3-client-original-ui-session-uimenu-bad-cd-key-const-uimenu-bad-cd-key-4-src-mq3-client-original-ui-session-ml-2087223497"></a>
### UIMENU_BAD_CD_KEY

```ml
const UIMENU_BAD_CD_KEY = 4
```

Engine-to-UI menu selector for the bad cd key screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L60)

<a id="constant-constant-mq3-client-original-ui-session-uimenu-ingame-const-uimenu-ingame-2-src-mq3-client-original-ui-session-ml-2083922791"></a>
### UIMENU_INGAME

```ml
const UIMENU_INGAME = 2
```

Engine-to-UI menu selector for the ingame screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L56)

<a id="constant-constant-mq3-client-original-ui-session-uimenu-main-const-uimenu-main-1-src-mq3-client-original-ui-session-ml-2022981970"></a>
### UIMENU_MAIN

```ml
const UIMENU_MAIN = 1
```

Engine-to-UI menu selector for the main screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L54)

<a id="constant-constant-mq3-client-original-ui-session-uimenu-need-cd-const-uimenu-need-cd-3-src-mq3-client-original-ui-session-ml-1481804098"></a>
### UIMENU_NEED_CD

```ml
const UIMENU_NEED_CD = 3
```

Engine-to-UI menu selector for the need cd screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L58)

<a id="constant-constant-mq3-client-original-ui-session-uimenu-none-const-uimenu-none-0-src-mq3-client-original-ui-session-ml-2008342121"></a>
### UIMENU_NONE

```ml
const UIMENU_NONE = 0
```

Engine-to-UI menu selector for the none screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L52)

<a id="constant-constant-mq3-client-original-ui-session-uimenu-postgame-const-uimenu-postgame-6-src-mq3-client-original-ui-session-ml-1596931375"></a>
### UIMENU_POSTGAME

```ml
const UIMENU_POSTGAME = 6
```

Engine-to-UI menu selector for the postgame screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L64)

<a id="constant-constant-mq3-client-original-ui-session-uimenu-team-const-uimenu-team-5-src-mq3-client-original-ui-session-ml-800691954"></a>
### UIMENU_TEAM

```ml
const UIMENU_TEAM = 5
```

Engine-to-UI menu selector for the team screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L62)

<a id="constant-constant-mq3-client-original-ui-session-vk-back-const-vk-back-8-src-mq3-client-original-ui-session-ml-147989533"></a>
### VK_BACK

```ml
const VK_BACK = 8
```

Windows virtual-key code for the back input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L67)

<a id="constant-constant-mq3-client-original-ui-session-vk-control-const-vk-control-17-src-mq3-client-original-ui-session-ml-364946793"></a>
### VK_CONTROL

```ml
const VK_CONTROL = 17
```

Windows virtual-key code for the control input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L75)

<a id="constant-constant-mq3-client-original-ui-session-vk-delete-const-vk-delete-46-src-mq3-client-original-ui-session-ml-1211060527"></a>
### VK_DELETE

```ml
const VK_DELETE = 46
```

Windows virtual-key code for the delete input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L101)

<a id="constant-constant-mq3-client-original-ui-session-vk-down-const-vk-down-40-src-mq3-client-original-ui-session-ml-491797089"></a>
### VK_DOWN

```ml
const VK_DOWN = 40
```

Windows virtual-key code for the down input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L97)

<a id="constant-constant-mq3-client-original-ui-session-vk-end-const-vk-end-35-src-mq3-client-original-ui-session-ml-1841934881"></a>
### VK_END

```ml
const VK_END = 35
```

Windows virtual-key code for the end input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L87)

<a id="constant-constant-mq3-client-original-ui-session-vk-escape-const-vk-escape-27-src-mq3-client-original-ui-session-ml-517927078"></a>
### VK_ESCAPE

```ml
const VK_ESCAPE = 27
```

Windows virtual-key code for the escape input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L79)

<a id="constant-constant-mq3-client-original-ui-session-vk-f1-const-vk-f1-112-src-mq3-client-original-ui-session-ml-854365485"></a>
### VK_F1

```ml
const VK_F1 = 112
```

Windows virtual-key code for the f1 input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L103)

<a id="constant-constant-mq3-client-original-ui-session-vk-home-const-vk-home-36-src-mq3-client-original-ui-session-ml-2140964540"></a>
### VK_HOME

```ml
const VK_HOME = 36
```

Windows virtual-key code for the home input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L89)

<a id="constant-constant-mq3-client-original-ui-session-vk-insert-const-vk-insert-45-src-mq3-client-original-ui-session-ml-1117220690"></a>
### VK_INSERT

```ml
const VK_INSERT = 45
```

Windows virtual-key code for the insert input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L99)

<a id="constant-constant-mq3-client-original-ui-session-vk-lbutton-const-vk-lbutton-1-src-mq3-client-original-ui-session-ml-1413780628"></a>
### VK_LBUTTON

```ml
const VK_LBUTTON = 1
```

Windows virtual-key code for the lbutton input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L105)

<a id="constant-constant-mq3-client-original-ui-session-vk-left-const-vk-left-37-src-mq3-client-original-ui-session-ml-1436736051"></a>
### VK_LEFT

```ml
const VK_LEFT = 37
```

Windows virtual-key code for the left input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L91)

<a id="constant-constant-mq3-client-original-ui-session-vk-mbutton-const-vk-mbutton-4-src-mq3-client-original-ui-session-ml-140976925"></a>
### VK_MBUTTON

```ml
const VK_MBUTTON = 4
```

Windows virtual-key code for the mbutton input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L109)

<a id="constant-constant-mq3-client-original-ui-session-vk-menu-const-vk-menu-18-src-mq3-client-original-ui-session-ml-801139392"></a>
### VK_MENU

```ml
const VK_MENU = 18
```

Windows virtual-key code for the menu input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L77)

<a id="constant-constant-mq3-client-original-ui-session-vk-next-const-vk-next-34-src-mq3-client-original-ui-session-ml-378050714"></a>
### VK_NEXT

```ml
const VK_NEXT = 34
```

Windows virtual-key code for the next input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L85)

<a id="constant-constant-mq3-client-original-ui-session-vk-prior-const-vk-prior-33-src-mq3-client-original-ui-session-ml-1944510201"></a>
### VK_PRIOR

```ml
const VK_PRIOR = 33
```

Windows virtual-key code for the prior input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L83)

<a id="constant-constant-mq3-client-original-ui-session-vk-rbutton-const-vk-rbutton-2-src-mq3-client-original-ui-session-ml-1221923337"></a>
### VK_RBUTTON

```ml
const VK_RBUTTON = 2
```

Windows virtual-key code for the rbutton input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L107)

<a id="constant-constant-mq3-client-original-ui-session-vk-return-const-vk-return-13-src-mq3-client-original-ui-session-ml-698535385"></a>
### VK_RETURN

```ml
const VK_RETURN = 13
```

Windows virtual-key code for the return input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L71)

<a id="constant-constant-mq3-client-original-ui-session-vk-right-const-vk-right-39-src-mq3-client-original-ui-session-ml-1800742267"></a>
### VK_RIGHT

```ml
const VK_RIGHT = 39
```

Windows virtual-key code for the right input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L95)

<a id="constant-constant-mq3-client-original-ui-session-vk-shift-const-vk-shift-16-src-mq3-client-original-ui-session-ml-19786448"></a>
### VK_SHIFT

```ml
const VK_SHIFT = 16
```

Windows virtual-key code for the shift input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L73)

<a id="constant-constant-mq3-client-original-ui-session-vk-space-const-vk-space-32-src-mq3-client-original-ui-session-ml-52171878"></a>
### VK_SPACE

```ml
const VK_SPACE = 32
```

Windows virtual-key code for the space input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L81)

<a id="constant-constant-mq3-client-original-ui-session-vk-tab-const-vk-tab-9-src-mq3-client-original-ui-session-ml-308252794"></a>
### VK_TAB

```ml
const VK_TAB = 9
```

Windows virtual-key code for the tab input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L69)

<a id="constant-constant-mq3-client-original-ui-session-vk-up-const-vk-up-38-src-mq3-client-original-ui-session-ml-2013146742"></a>
### VK_UP

```ml
const VK_UP = 38
```

Windows virtual-key code for the up input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/original_ui_session.ml#L93)
