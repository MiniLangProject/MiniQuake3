# `src/mq3/platform/win_wndproc_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.win_wndproc_runtime`](Package-mq3-platform-win-wndproc-runtime-796763154.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-platform-win-wndproc-runtime-create-function-create-fullscreen-src-mq3-platform-win-wndproc-runtime-ml-1293785145"></a>
### create

```ml
function create(fullscreen)
```

Constructs `mq3.platform.win_wndproc_runtime.Runtime` with `activeApp` = `false`, `isMinimized` = `false`, `altTabDisabled` = `false`, `windowCreated` = `false` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fullscreen` | `dynamic` | — | Initial value for `mq3.platform.win_wndproc_runtime.Runtime.fullscreen`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L199)

- [mq3.platform.win_wndproc_runtime.Event](Type-mq3-platform-win-wndproc-runtime-event-384184876.md) — struct
<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-alt-const-k-alt-136-src-mq3-platform-win-wndproc-runtime-ml-395103331"></a>
### K_ALT

```ml
const K_ALT = 136
```

Engine input key code for the Alt.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L25)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-backspace-const-k-backspace-127-src-mq3-platform-win-wndproc-runtime-ml-1618833641"></a>
### K_BACKSPACE

```ml
const K_BACKSPACE = 127
```

Engine input key code for the Backspace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L11)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-capslock-const-k-capslock-129-src-mq3-platform-win-wndproc-runtime-ml-783939489"></a>
### K_CAPSLOCK

```ml
const K_CAPSLOCK = 129
```

Engine input key code for the Caps Lock.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L13)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-ctrl-const-k-ctrl-137-src-mq3-platform-win-wndproc-runtime-ml-684941712"></a>
### K_CTRL

```ml
const K_CTRL = 137
```

Engine input key code for the Control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L27)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-del-const-k-del-140-src-mq3-platform-win-wndproc-runtime-ml-2111289602"></a>
### K_DEL

```ml
const K_DEL = 140
```

Engine input key code for the Delete.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L33)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-downarrow-const-k-downarrow-133-src-mq3-platform-win-wndproc-runtime-ml-1726517636"></a>
### K_DOWNARROW

```ml
const K_DOWNARROW = 133
```

Engine input key code for the down arrow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L19)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-end-const-k-end-144-src-mq3-platform-win-wndproc-runtime-ml-442715146"></a>
### K_END

```ml
const K_END = 144
```

Engine input key code for the End.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L41)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-f1-const-k-f1-145-src-mq3-platform-win-wndproc-runtime-ml-757277965"></a>
### K_F1

```ml
const K_F1 = 145
```

Engine input key code for function key F1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L43)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-f10-const-k-f10-154-src-mq3-platform-win-wndproc-runtime-ml-46639355"></a>
### K_F10

```ml
const K_F10 = 154
```

Engine input key code for function key F10.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L61)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-f11-const-k-f11-155-src-mq3-platform-win-wndproc-runtime-ml-296891812"></a>
### K_F11

```ml
const K_F11 = 155
```

Engine input key code for function key F11.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L63)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-f12-const-k-f12-156-src-mq3-platform-win-wndproc-runtime-ml-241509597"></a>
### K_F12

```ml
const K_F12 = 156
```

Engine input key code for function key F12.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L65)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-f2-const-k-f2-146-src-mq3-platform-win-wndproc-runtime-ml-1971165594"></a>
### K_F2

```ml
const K_F2 = 146
```

Engine input key code for function key F2.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L45)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-f3-const-k-f3-147-src-mq3-platform-win-wndproc-runtime-ml-1764439187"></a>
### K_F3

```ml
const K_F3 = 147
```

Engine input key code for function key F3.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L47)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-f4-const-k-f4-148-src-mq3-platform-win-wndproc-runtime-ml-1767739528"></a>
### K_F4

```ml
const K_F4 = 148
```

Engine input key code for function key F4.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L49)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-f5-const-k-f5-149-src-mq3-platform-win-wndproc-runtime-ml-1307621569"></a>
### K_F5

```ml
const K_F5 = 149
```

Engine input key code for function key F5.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L51)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-f6-const-k-f6-150-src-mq3-platform-win-wndproc-runtime-ml-1625998089"></a>
### K_F6

```ml
const K_F6 = 150
```

Engine input key code for function key F6.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L53)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-f7-const-k-f7-151-src-mq3-platform-win-wndproc-runtime-ml-1032336656"></a>
### K_F7

```ml
const K_F7 = 151
```

Engine input key code for function key F7.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L55)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-f8-const-k-f8-152-src-mq3-platform-win-wndproc-runtime-ml-203305779"></a>
### K_F8

```ml
const K_F8 = 152
```

Engine input key code for function key F8.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L57)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-f9-const-k-f9-153-src-mq3-platform-win-wndproc-runtime-ml-1802544170"></a>
### K_F9

```ml
const K_F9 = 153
```

Engine input key code for function key F9.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L59)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-home-const-k-home-143-src-mq3-platform-win-wndproc-runtime-ml-757351799"></a>
### K_HOME

```ml
const K_HOME = 143
```

Engine input key code for the Home.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L39)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-ins-const-k-ins-139-src-mq3-platform-win-wndproc-runtime-ml-1184489274"></a>
### K_INS

```ml
const K_INS = 139
```

Engine input key code for the Insert.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L31)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-5-const-k-kp-5-164-src-mq3-platform-win-wndproc-runtime-ml-1718555348"></a>
### K_KP_5

```ml
const K_KP_5 = 164
```

Engine input key code for the numeric-keypad center.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L75)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-del-const-k-kp-del-171-src-mq3-platform-win-wndproc-runtime-ml-2015665146"></a>
### K_KP_DEL

```ml
const K_KP_DEL = 171
```

Engine input key code for the numeric-keypad Delete.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L89)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-downarrow-const-k-kp-downarrow-167-src-mq3-platform-win-wndproc-runtime-ml-1050336253"></a>
### K_KP_DOWNARROW

```ml
const K_KP_DOWNARROW = 167
```

Engine input key code for the numeric-keypad down arrow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L81)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-end-const-k-kp-end-166-src-mq3-platform-win-wndproc-runtime-ml-2059044366"></a>
### K_KP_END

```ml
const K_KP_END = 166
```

Engine input key code for the numeric-keypad End.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L79)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-enter-const-k-kp-enter-169-src-mq3-platform-win-wndproc-runtime-ml-1561738509"></a>
### K_KP_ENTER

```ml
const K_KP_ENTER = 169
```

Engine input key code for the numeric-keypad Enter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L85)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-home-const-k-kp-home-160-src-mq3-platform-win-wndproc-runtime-ml-846202432"></a>
### K_KP_HOME

```ml
const K_KP_HOME = 160
```

Engine input key code for the numeric-keypad Home.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L67)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-ins-const-k-kp-ins-170-src-mq3-platform-win-wndproc-runtime-ml-39338931"></a>
### K_KP_INS

```ml
const K_KP_INS = 170
```

Engine input key code for the numeric-keypad Insert.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L87)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-leftarrow-const-k-kp-leftarrow-163-src-mq3-platform-win-wndproc-runtime-ml-1649484099"></a>
### K_KP_LEFTARROW

```ml
const K_KP_LEFTARROW = 163
```

Engine input key code for the numeric-keypad left arrow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L73)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-minus-const-k-kp-minus-173-src-mq3-platform-win-wndproc-runtime-ml-642739730"></a>
### K_KP_MINUS

```ml
const K_KP_MINUS = 173
```

Engine input key code for the numeric-keypad subtract.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L93)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-numlock-const-k-kp-numlock-175-src-mq3-platform-win-wndproc-runtime-ml-2125175530"></a>
### K_KP_NUMLOCK

```ml
const K_KP_NUMLOCK = 175
```

Engine input key code for the Num Lock.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L97)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-pgdn-const-k-kp-pgdn-168-src-mq3-platform-win-wndproc-runtime-ml-809204592"></a>
### K_KP_PGDN

```ml
const K_KP_PGDN = 168
```

Engine input key code for the numeric-keypad Page Down.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L83)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-pgup-const-k-kp-pgup-162-src-mq3-platform-win-wndproc-runtime-ml-1812324538"></a>
### K_KP_PGUP

```ml
const K_KP_PGUP = 162
```

Engine input key code for the numeric-keypad Page Up.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L71)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-plus-const-k-kp-plus-174-src-mq3-platform-win-wndproc-runtime-ml-1057487601"></a>
### K_KP_PLUS

```ml
const K_KP_PLUS = 174
```

Engine input key code for the numeric-keypad add.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L95)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-rightarrow-const-k-kp-rightarrow-165-src-mq3-platform-win-wndproc-runtime-ml-1680778739"></a>
### K_KP_RIGHTARROW

```ml
const K_KP_RIGHTARROW = 165
```

Engine input key code for the numeric-keypad right arrow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L77)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-slash-const-k-kp-slash-172-src-mq3-platform-win-wndproc-runtime-ml-1967379119"></a>
### K_KP_SLASH

```ml
const K_KP_SLASH = 172
```

Engine input key code for the numeric-keypad divide.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L91)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-star-const-k-kp-star-176-src-mq3-platform-win-wndproc-runtime-ml-493307407"></a>
### K_KP_STAR

```ml
const K_KP_STAR = 176
```

Engine input key code for the numeric-keypad multiply.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L99)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-kp-uparrow-const-k-kp-uparrow-161-src-mq3-platform-win-wndproc-runtime-ml-948847593"></a>
### K_KP_UPARROW

```ml
const K_KP_UPARROW = 161
```

Engine input key code for the numeric-keypad up arrow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L69)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-leftarrow-const-k-leftarrow-134-src-mq3-platform-win-wndproc-runtime-ml-2056259477"></a>
### K_LEFTARROW

```ml
const K_LEFTARROW = 134
```

Engine input key code for the left arrow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L21)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-mwheeldown-const-k-mwheeldown-183-src-mq3-platform-win-wndproc-runtime-ml-592592609"></a>
### K_MWHEELDOWN

```ml
const K_MWHEELDOWN = 183
```

Engine input key code for the downward mouse-wheel step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L101)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-mwheelup-const-k-mwheelup-184-src-mq3-platform-win-wndproc-runtime-ml-1804160706"></a>
### K_MWHEELUP

```ml
const K_MWHEELUP = 184
```

Engine input key code for the upward mouse-wheel step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L103)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-pause-const-k-pause-131-src-mq3-platform-win-wndproc-runtime-ml-749293806"></a>
### K_PAUSE

```ml
const K_PAUSE = 131
```

Engine input key code for the Pause.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L15)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-pgdn-const-k-pgdn-141-src-mq3-platform-win-wndproc-runtime-ml-659403177"></a>
### K_PGDN

```ml
const K_PGDN = 141
```

Engine input key code for the Page Down.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L35)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-pgup-const-k-pgup-142-src-mq3-platform-win-wndproc-runtime-ml-1517334226"></a>
### K_PGUP

```ml
const K_PGUP = 142
```

Engine input key code for the Page Up.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L37)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-rightarrow-const-k-rightarrow-135-src-mq3-platform-win-wndproc-runtime-ml-1594471974"></a>
### K_RIGHTARROW

```ml
const K_RIGHTARROW = 135
```

Engine input key code for the right arrow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L23)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-shift-const-k-shift-138-src-mq3-platform-win-wndproc-runtime-ml-1760130281"></a>
### K_SHIFT

```ml
const K_SHIFT = 138
```

Engine input key code for the Shift.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L29)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-k-uparrow-const-k-uparrow-132-src-mq3-platform-win-wndproc-runtime-ml-1353121279"></a>
### K_UPARROW

```ml
const K_UPARROW = 132
```

Engine input key code for the up arrow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L17)

<a id="function-function-mq3-platform-win-wndproc-runtime-mainwndproc-function-mainwndproc-state-message-wparam-lparam-time-inmouse-consolecatcher-logitechbug-legacywheelmessage-src-mq3-platform-win-wndproc-runtime-ml-1343863101"></a>
### MainWndProc

```ml
function MainWndProc(state, message, wParam, lParam, time, inMouse, consoleCatcher, logitechBug, legacyWheelMessage)
```

Updates `state.windowCreated`, `state.quitRequested`, `state.soundActivations`, `state.vidX`, `state.vidY` in `mq3.platform.win_wndproc_runtime.MainWndProc`; returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.windowCreated`, `state.quitRequested`, `state.soundActivations`, `state.vidX`, `state.vidY`. |
| `message` | `dynamic` | — | Input tested by `inMouse!=1 and message==legacyWheelMessage`. |
| `wParam` | `dynamic` | — | Value forwarded as `wParam` to `mq3.platform.win_wndproc_runtime.mouseState`. |
| `lParam` | `dynamic` | — | Value forwarded as `key` to `mq3.platform.win_wndproc_runtime.MapKey`. |
| `time` | `dynamic` | — | Value forwarded as `time` to `mq3.platform.win_wndproc_runtime.wheel`. |
| `inMouse` | `dynamic` | — | Input tested by `inMouse!=1 and message==legacyWheelMessage`. |
| `consoleCatcher` | `dynamic` | — | Input tested by `inMouse!=1 or (not state.fullscreen and consoleCatcher)`. |
| `logitechBug` | `dynamic` | — | Value forwarded as `logitechBug` to `mq3.platform.win_wndproc_runtime.wheel`. |
| `legacyWheelMessage` | `dynamic` | — | Input tested by `inMouse!=1 and message==legacyWheelMessage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L269)

<a id="function-function-mq3-platform-win-wndproc-runtime-mapkey-function-mapkey-key-src-mq3-platform-win-wndproc-runtime-ml-1014314511"></a>
### MapKey

```ml
function MapKey(key)
```

Computes `MapKey` from `scanTable()[modified]` using `mq3.platform.win_wndproc_runtime.scanTable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Input used by `modified=(key>>16)&255`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L230)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-mk-lbutton-const-mk-lbutton-1-src-mq3-platform-win-wndproc-runtime-ml-408130486"></a>
### MK_LBUTTON

```ml
const MK_LBUTTON = 1
```

Mouse-message flag indicating that the left button is pressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L146)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-mk-mbutton-const-mk-mbutton-16-src-mq3-platform-win-wndproc-runtime-ml-1580355908"></a>
### MK_MBUTTON

```ml
const MK_MBUTTON = 16
```

Mouse-message flag indicating that the middle button is pressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L150)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-mk-rbutton-const-mk-rbutton-2-src-mq3-platform-win-wndproc-runtime-ml-1877683451"></a>
### MK_RBUTTON

```ml
const MK_RBUTTON = 2
```

Mouse-message flag indicating that the right button is pressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L148)

<a id="function-function-mq3-platform-win-wndproc-runtime-mousestate-function-mousestate-wparam-src-mq3-platform-win-wndproc-runtime-ml-417488644"></a>
### mouseState

```ml
function mouseState(wParam)
```

Returns `result` from `mq3.platform.win_wndproc_runtime.mouseState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wParam` | `dynamic` | — | Input tested by `(wParam&MK_LBUTTON)!=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L257)

<a id="function-function-mq3-platform-win-wndproc-runtime-queue-function-queue-state-time-type-value-value2-src-mq3-platform-win-wndproc-runtime-ml-40899996"></a>
### queue

```ml
function queue(state, time, type, value, value2)
```

Updates `state.events` in `mq3.platform.win_wndproc_runtime.queue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.events`. |
| `time` | `dynamic` | — | Value used for `mq3.platform.win_wndproc_runtime.Event.time`. |
| `type` | `dynamic` | — | Value used for `mq3.platform.win_wndproc_runtime.Event.type`. |
| `value` | `dynamic` | — | Value used for `mq3.platform.win_wndproc_runtime.Event.value`. |
| `value2` | `dynamic` | — | Value used for `mq3.platform.win_wndproc_runtime.Event.value2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L208)

- [mq3.platform.win_wndproc_runtime.Runtime](Type-mq3-platform-win-wndproc-runtime-runtime-32529896.md) — struct
<a id="constant-constant-mq3-platform-win-wndproc-runtime-sc-screensave-const-sc-screensave-61760-src-mq3-platform-win-wndproc-runtime-ml-1790044173"></a>
### SC_SCREENSAVE

```ml
const SC_SCREENSAVE = 61760
```

Windows system-command identifier for activating the screen saver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L144)

<a id="function-function-mq3-platform-win-wndproc-runtime-scantable-function-scantable-src-mq3-platform-win-wndproc-runtime-ml-1382182820"></a>
### scanTable

```ml
function scanTable()
```

Builds the 130-element result for `mq3.platform.win_wndproc_runtime.scanTable` from `0`, `27`, `49`, `50`, `51`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L225)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-se-char-const-se-char-2-src-mq3-platform-win-wndproc-runtime-ml-1081093659"></a>
### SE_CHAR

```ml
const SE_CHAR = 2
```

System-event type carrying a character for text input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L9)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-se-key-const-se-key-1-src-mq3-platform-win-wndproc-runtime-ml-1576856780"></a>
### SE_KEY

```ml
const SE_KEY = 1
```

System-event type carrying a key code and its press or release state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L7)

<a id="function-function-mq3-platform-win-wndproc-runtime-vid-appactivate-function-vid-appactivate-state-active-minimized-src-mq3-platform-win-wndproc-runtime-ml-924132765"></a>
### VID_AppActivate

```ml
function VID_AppActivate(state, active, minimized)
```

Updates `state.isMinimized`, `state.clearStateCount`, `state.activeApp`, `state.inputActive` in `mq3.platform.win_wndproc_runtime.VID_AppActivate`; returns `state.activeApp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.isMinimized`, `state.clearStateCount`, `state.activeApp`, `state.inputActive`. |
| `active` | `dynamic` | — | Input used by `state.activeApp=active and not minimized`. |
| `minimized` | `dynamic` | — | Value assigned to `state.isMinimized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L219)

<a id="function-function-mq3-platform-win-wndproc-runtime-wheel-function-wheel-state-time-delta-logitechbug-src-mq3-platform-win-wndproc-runtime-ml-1686180153"></a>
### wheel

```ml
function wheel(state, time, delta, logitechBug)
```

Updates `state.logitechFlip` in `mq3.platform.win_wndproc_runtime.wheel`; returns `steps`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.logitechFlip`. |
| `time` | `dynamic` | — | Value forwarded as `time` to `mq3.platform.win_wndproc_runtime.queue`. |
| `delta` | `dynamic` | — | Input tested by `delta>0`. |
| `logitechBug` | `dynamic` | — | Input tested by `logitechBug`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L248)

<a id="function-function-mq3-platform-win-wndproc-runtime-win-disablealttab-function-win-disablealttab-state-src-mq3-platform-win-wndproc-runtime-ml-1345114723"></a>
### WIN_DisableAltTab

```ml
function WIN_DisableAltTab(state)
```

Updates `state.altTabDisabled` in `mq3.platform.win_wndproc_runtime.WIN_DisableAltTab`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.altTabDisabled`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L211)

<a id="function-function-mq3-platform-win-wndproc-runtime-win-enablealttab-function-win-enablealttab-state-src-mq3-platform-win-wndproc-runtime-ml-775431309"></a>
### WIN_EnableAltTab

```ml
function WIN_EnableAltTab(state)
```

Updates `state.altTabDisabled` in `mq3.platform.win_wndproc_runtime.WIN_EnableAltTab`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.altTabDisabled`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L214)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-activate-const-wm-activate-6-src-mq3-platform-win-wndproc-runtime-ml-1854876639"></a>
### WM_ACTIVATE

```ml
const WM_ACTIVATE = 6
```

Windows message identifier for a change in window activation state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L114)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-char-const-wm-char-258-src-mq3-platform-win-wndproc-runtime-ml-1137445818"></a>
### WM_CHAR

```ml
const WM_CHAR = 258
```

Windows message identifier for a translated text-input character.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L120)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-close-const-wm-close-16-src-mq3-platform-win-wndproc-runtime-ml-297543482"></a>
### WM_CLOSE

```ml
const WM_CLOSE = 16
```

Windows message identifier for a request to close the native window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L112)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-create-const-wm-create-1-src-mq3-platform-win-wndproc-runtime-ml-686278382"></a>
### WM_CREATE

```ml
const WM_CREATE = 1
```

Windows message identifier for creation of the native window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L106)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-destroy-const-wm-destroy-2-src-mq3-platform-win-wndproc-runtime-ml-105774331"></a>
### WM_DESTROY

```ml
const WM_DESTROY = 2
```

Windows message identifier for destruction of the native window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L108)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-keydown-const-wm-keydown-256-src-mq3-platform-win-wndproc-runtime-ml-2127598882"></a>
### WM_KEYDOWN

```ml
const WM_KEYDOWN = 256
```

Windows message identifier for a normal key press.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L116)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-keyup-const-wm-keyup-257-src-mq3-platform-win-wndproc-runtime-ml-152860371"></a>
### WM_KEYUP

```ml
const WM_KEYUP = 257
```

Windows message identifier for a normal key release.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L118)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-lbuttondown-const-wm-lbuttondown-513-src-mq3-platform-win-wndproc-runtime-ml-570666662"></a>
### WM_LBUTTONDOWN

```ml
const WM_LBUTTONDOWN = 513
```

Windows message identifier for a left mouse-button press.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L130)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-lbuttonup-const-wm-lbuttonup-514-src-mq3-platform-win-wndproc-runtime-ml-216041165"></a>
### WM_LBUTTONUP

```ml
const WM_LBUTTONUP = 514
```

Windows message identifier for a left mouse-button release.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L132)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-mbuttondown-const-wm-mbuttondown-519-src-mq3-platform-win-wndproc-runtime-ml-1003620958"></a>
### WM_MBUTTONDOWN

```ml
const WM_MBUTTONDOWN = 519
```

Windows message identifier for a middle mouse-button press.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L138)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-mbuttonup-const-wm-mbuttonup-520-src-mq3-platform-win-wndproc-runtime-ml-1019319328"></a>
### WM_MBUTTONUP

```ml
const WM_MBUTTONUP = 520
```

Windows message identifier for a middle mouse-button release.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L140)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-mousemove-const-wm-mousemove-512-src-mq3-platform-win-wndproc-runtime-ml-110740977"></a>
### WM_MOUSEMOVE

```ml
const WM_MOUSEMOVE = 512
```

Windows message identifier for mouse movement within the client area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L128)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-mousewheel-const-wm-mousewheel-522-src-mq3-platform-win-wndproc-runtime-ml-689498574"></a>
### WM_MOUSEWHEEL

```ml
const WM_MOUSEWHEEL = 522
```

Windows message identifier for vertical mouse-wheel movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L142)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-move-const-wm-move-3-src-mq3-platform-win-wndproc-runtime-ml-970728604"></a>
### WM_MOVE

```ml
const WM_MOVE = 3
```

Windows message identifier for a change in the window position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L110)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-rbuttondown-const-wm-rbuttondown-516-src-mq3-platform-win-wndproc-runtime-ml-444826861"></a>
### WM_RBUTTONDOWN

```ml
const WM_RBUTTONDOWN = 516
```

Windows message identifier for a right mouse-button press.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L134)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-rbuttonup-const-wm-rbuttonup-517-src-mq3-platform-win-wndproc-runtime-ml-1940587460"></a>
### WM_RBUTTONUP

```ml
const WM_RBUTTONUP = 517
```

Windows message identifier for a right mouse-button release.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L136)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-syscommand-const-wm-syscommand-274-src-mq3-platform-win-wndproc-runtime-ml-1400419024"></a>
### WM_SYSCOMMAND

```ml
const WM_SYSCOMMAND = 274
```

Windows message identifier for a window system command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L126)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-syskeydown-const-wm-syskeydown-260-src-mq3-platform-win-wndproc-runtime-ml-1167683813"></a>
### WM_SYSKEYDOWN

```ml
const WM_SYSKEYDOWN = 260
```

Windows message identifier for a system-key press, such as an Alt-key combination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L122)

<a id="constant-constant-mq3-platform-win-wndproc-runtime-wm-syskeyup-const-wm-syskeyup-261-src-mq3-platform-win-wndproc-runtime-ml-946670634"></a>
### WM_SYSKEYUP

```ml
const WM_SYSKEYUP = 261
```

Windows message identifier for a system-key release.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L124)
