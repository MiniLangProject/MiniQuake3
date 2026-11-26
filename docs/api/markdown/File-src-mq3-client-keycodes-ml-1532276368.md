# `src/mq3/client/keycodes.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.keycodes`](Package-mq3-client-keycodes-879649430.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-client-keycodes-charactercode-function-charactercode-key-src-mq3-client-keycodes-ml-2133699771"></a>
### characterCode

```ml
function characterCode(key)
```

Computes `key&(~K_CHAR_FLAG)` for keycodes `characterCode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding keycodes entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L240)

<a id="function-function-mq3-client-keycodes-ischaracterevent-function-ischaracterevent-key-src-mq3-client-keycodes-ml-1092822955"></a>
### isCharacterEvent

```ml
function isCharacterEvent(key)
```

Computes `(key&K_CHAR_FLAG)!=0` for keycodes `isCharacterEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding keycodes entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L237)

<a id="function-function-mq3-client-keycodes-iskeynumber-function-iskeynumber-key-src-mq3-client-keycodes-ml-2026056091"></a>
### isKeyNumber

```ml
function isKeyNumber(key)
```

Computes `key>=0 and key<K_LAST_KEY` for keycodes `isKeyNumber`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding keycodes entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L234)

<a id="constant-constant-mq3-client-keycodes-k-alt-const-k-alt-136-src-mq3-client-keycodes-ml-1074156743"></a>
### K_ALT

```ml
const K_ALT = 136
```

Engine key code for the alt input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L34)

<a id="constant-constant-mq3-client-keycodes-k-aux1-const-k-aux1-217-src-mq3-client-keycodes-ml-555906335"></a>
### K_AUX1

```ml
const K_AUX1 = 217
```

Engine key code for the aux1 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L196)

<a id="constant-constant-mq3-client-keycodes-k-aux10-const-k-aux10-226-src-mq3-client-keycodes-ml-1644048895"></a>
### K_AUX10

```ml
const K_AUX10 = 226
```

Engine key code for the aux10 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L214)

<a id="constant-constant-mq3-client-keycodes-k-aux11-const-k-aux11-227-src-mq3-client-keycodes-ml-145434646"></a>
### K_AUX11

```ml
const K_AUX11 = 227
```

Engine key code for the aux11 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L216)

<a id="constant-constant-mq3-client-keycodes-k-aux12-const-k-aux12-228-src-mq3-client-keycodes-ml-1350853125"></a>
### K_AUX12

```ml
const K_AUX12 = 228
```

Engine key code for the aux12 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L218)

<a id="constant-constant-mq3-client-keycodes-k-aux13-const-k-aux13-229-src-mq3-client-keycodes-ml-1172143580"></a>
### K_AUX13

```ml
const K_AUX13 = 229
```

Engine key code for the aux13 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L220)

<a id="constant-constant-mq3-client-keycodes-k-aux14-const-k-aux14-230-src-mq3-client-keycodes-ml-1122956338"></a>
### K_AUX14

```ml
const K_AUX14 = 230
```

Engine key code for the aux14 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L222)

<a id="constant-constant-mq3-client-keycodes-k-aux15-const-k-aux15-231-src-mq3-client-keycodes-ml-909884819"></a>
### K_AUX15

```ml
const K_AUX15 = 231
```

Engine key code for the aux15 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L224)

<a id="constant-constant-mq3-client-keycodes-k-aux16-const-k-aux16-232-src-mq3-client-keycodes-ml-1585691380"></a>
### K_AUX16

```ml
const K_AUX16 = 232
```

Engine key code for the aux16 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L226)

<a id="constant-constant-mq3-client-keycodes-k-aux2-const-k-aux2-218-src-mq3-client-keycodes-ml-1006999934"></a>
### K_AUX2

```ml
const K_AUX2 = 218
```

Engine key code for the aux2 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L198)

<a id="constant-constant-mq3-client-keycodes-k-aux3-const-k-aux3-219-src-mq3-client-keycodes-ml-1059599757"></a>
### K_AUX3

```ml
const K_AUX3 = 219
```

Engine key code for the aux3 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L200)

<a id="constant-constant-mq3-client-keycodes-k-aux4-const-k-aux4-220-src-mq3-client-keycodes-ml-2122337955"></a>
### K_AUX4

```ml
const K_AUX4 = 220
```

Engine key code for the aux4 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L202)

<a id="constant-constant-mq3-client-keycodes-k-aux5-const-k-aux5-221-src-mq3-client-keycodes-ml-1489069816"></a>
### K_AUX5

```ml
const K_AUX5 = 221
```

Engine key code for the aux5 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L204)

<a id="constant-constant-mq3-client-keycodes-k-aux6-const-k-aux6-222-src-mq3-client-keycodes-ml-1075482489"></a>
### K_AUX6

```ml
const K_AUX6 = 222
```

Engine key code for the aux6 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L206)

<a id="constant-constant-mq3-client-keycodes-k-aux7-const-k-aux7-223-src-mq3-client-keycodes-ml-840527142"></a>
### K_AUX7

```ml
const K_AUX7 = 223
```

Engine key code for the aux7 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L208)

<a id="constant-constant-mq3-client-keycodes-k-aux8-const-k-aux8-224-src-mq3-client-keycodes-ml-1919848551"></a>
### K_AUX8

```ml
const K_AUX8 = 224
```

Engine key code for the aux8 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L210)

<a id="constant-constant-mq3-client-keycodes-k-aux9-const-k-aux9-225-src-mq3-client-keycodes-ml-1677099324"></a>
### K_AUX9

```ml
const K_AUX9 = 225
```

Engine key code for the aux9 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L212)

<a id="constant-constant-mq3-client-keycodes-k-backspace-const-k-backspace-127-src-mq3-client-keycodes-ml-1553111489"></a>
### K_BACKSPACE

```ml
const K_BACKSPACE = 127
```

Engine key code for the backspace input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L16)

<a id="constant-constant-mq3-client-keycodes-k-capslock-const-k-capslock-129-src-mq3-client-keycodes-ml-1680304129"></a>
### K_CAPSLOCK

```ml
const K_CAPSLOCK = 129
```

Engine key code for the capslock input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L20)

<a id="constant-constant-mq3-client-keycodes-k-char-flag-const-k-char-flag-1024-src-mq3-client-keycodes-ml-1605993260"></a>
### K_CHAR_FLAG

```ml
const K_CHAR_FLAG = 1024
```

Engine key code for the char flag input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L230)

<a id="constant-constant-mq3-client-keycodes-k-command-const-k-command-128-src-mq3-client-keycodes-ml-1732608278"></a>
### K_COMMAND

```ml
const K_COMMAND = 128
```

Engine key code for the command input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L18)

<a id="constant-constant-mq3-client-keycodes-k-ctrl-const-k-ctrl-137-src-mq3-client-keycodes-ml-1746452958"></a>
### K_CTRL

```ml
const K_CTRL = 137
```

Engine key code for the ctrl input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L36)

<a id="constant-constant-mq3-client-keycodes-k-del-const-k-del-140-src-mq3-client-keycodes-ml-1459500820"></a>
### K_DEL

```ml
const K_DEL = 140
```

Engine key code for the del input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L42)

<a id="constant-constant-mq3-client-keycodes-k-downarrow-const-k-downarrow-133-src-mq3-client-keycodes-ml-1909714482"></a>
### K_DOWNARROW

```ml
const K_DOWNARROW = 133
```

Engine key code for the downarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L28)

<a id="constant-constant-mq3-client-keycodes-k-end-const-k-end-144-src-mq3-client-keycodes-ml-1441080980"></a>
### K_END

```ml
const K_END = 144
```

Engine key code for the end input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L50)

<a id="constant-constant-mq3-client-keycodes-k-enter-const-k-enter-13-src-mq3-client-keycodes-ml-1789345665"></a>
### K_ENTER

```ml
const K_ENTER = 13
```

Engine key code for the enter input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L10)

<a id="constant-constant-mq3-client-keycodes-k-escape-const-k-escape-27-src-mq3-client-keycodes-ml-1230396188"></a>
### K_ESCAPE

```ml
const K_ESCAPE = 27
```

Engine key code for the escape input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L12)

<a id="constant-constant-mq3-client-keycodes-k-f1-const-k-f1-145-src-mq3-client-keycodes-ml-1442212533"></a>
### K_F1

```ml
const K_F1 = 145
```

Engine key code for the f1 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L52)

<a id="constant-constant-mq3-client-keycodes-k-f10-const-k-f10-154-src-mq3-client-keycodes-ml-723565527"></a>
### K_F10

```ml
const K_F10 = 154
```

Engine key code for the f10 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L70)

<a id="constant-constant-mq3-client-keycodes-k-f11-const-k-f11-155-src-mq3-client-keycodes-ml-403525922"></a>
### K_F11

```ml
const K_F11 = 155
```

Engine key code for the f11 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L72)

<a id="constant-constant-mq3-client-keycodes-k-f12-const-k-f12-156-src-mq3-client-keycodes-ml-1578378309"></a>
### K_F12

```ml
const K_F12 = 156
```

Engine key code for the f12 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L74)

<a id="constant-constant-mq3-client-keycodes-k-f13-const-k-f13-157-src-mq3-client-keycodes-ml-867093664"></a>
### K_F13

```ml
const K_F13 = 157
```

Engine key code for the f13 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L76)

<a id="constant-constant-mq3-client-keycodes-k-f14-const-k-f14-158-src-mq3-client-keycodes-ml-1649430963"></a>
### K_F14

```ml
const K_F14 = 158
```

Engine key code for the f14 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L78)

<a id="constant-constant-mq3-client-keycodes-k-f15-const-k-f15-159-src-mq3-client-keycodes-ml-825226926"></a>
### K_F15

```ml
const K_F15 = 159
```

Engine key code for the f15 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L80)

<a id="constant-constant-mq3-client-keycodes-k-f2-const-k-f2-146-src-mq3-client-keycodes-ml-1579930660"></a>
### K_F2

```ml
const K_F2 = 146
```

Engine key code for the f2 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L54)

<a id="constant-constant-mq3-client-keycodes-k-f3-const-k-f3-147-src-mq3-client-keycodes-ml-143128927"></a>
### K_F3

```ml
const K_F3 = 147
```

Engine key code for the f3 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L56)

<a id="constant-constant-mq3-client-keycodes-k-f4-const-k-f4-148-src-mq3-client-keycodes-ml-1559315638"></a>
### K_F4

```ml
const K_F4 = 148
```

Engine key code for the f4 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L58)

<a id="constant-constant-mq3-client-keycodes-k-f5-const-k-f5-149-src-mq3-client-keycodes-ml-9978505"></a>
### K_F5

```ml
const K_F5 = 149
```

Engine key code for the f5 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L60)

<a id="constant-constant-mq3-client-keycodes-k-f6-const-k-f6-150-src-mq3-client-keycodes-ml-508935153"></a>
### K_F6

```ml
const K_F6 = 150
```

Engine key code for the f6 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L62)

<a id="constant-constant-mq3-client-keycodes-k-f7-const-k-f7-151-src-mq3-client-keycodes-ml-825562510"></a>
### K_F7

```ml
const K_F7 = 151
```

Engine key code for the f7 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L64)

<a id="constant-constant-mq3-client-keycodes-k-f8-const-k-f8-152-src-mq3-client-keycodes-ml-1928000167"></a>
### K_F8

```ml
const K_F8 = 152
```

Engine key code for the f8 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L66)

<a id="constant-constant-mq3-client-keycodes-k-f9-const-k-f9-153-src-mq3-client-keycodes-ml-1921977996"></a>
### K_F9

```ml
const K_F9 = 153
```

Engine key code for the f9 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L68)

<a id="constant-constant-mq3-client-keycodes-k-home-const-k-home-143-src-mq3-client-keycodes-ml-1449513299"></a>
### K_HOME

```ml
const K_HOME = 143
```

Engine key code for the home input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L48)

<a id="constant-constant-mq3-client-keycodes-k-ins-const-k-ins-139-src-mq3-client-keycodes-ml-1251038660"></a>
### K_INS

```ml
const K_INS = 139
```

Engine key code for the ins input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L40)

<a id="constant-constant-mq3-client-keycodes-k-joy1-const-k-joy1-185-src-mq3-client-keycodes-ml-1555003605"></a>
### K_JOY1

```ml
const K_JOY1 = 185
```

Engine key code for the joy1 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L132)

<a id="constant-constant-mq3-client-keycodes-k-joy10-const-k-joy10-194-src-mq3-client-keycodes-ml-1695075947"></a>
### K_JOY10

```ml
const K_JOY10 = 194
```

Engine key code for the joy10 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L150)

<a id="constant-constant-mq3-client-keycodes-k-joy11-const-k-joy11-195-src-mq3-client-keycodes-ml-446336558"></a>
### K_JOY11

```ml
const K_JOY11 = 195
```

Engine key code for the joy11 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L152)

<a id="constant-constant-mq3-client-keycodes-k-joy12-const-k-joy12-196-src-mq3-client-keycodes-ml-416270797"></a>
### K_JOY12

```ml
const K_JOY12 = 196
```

Engine key code for the joy12 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L154)

<a id="constant-constant-mq3-client-keycodes-k-joy13-const-k-joy13-197-src-mq3-client-keycodes-ml-1908645408"></a>
### K_JOY13

```ml
const K_JOY13 = 197
```

Engine key code for the joy13 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L156)

<a id="constant-constant-mq3-client-keycodes-k-joy14-const-k-joy14-198-src-mq3-client-keycodes-ml-1733790207"></a>
### K_JOY14

```ml
const K_JOY14 = 198
```

Engine key code for the joy14 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L158)

<a id="constant-constant-mq3-client-keycodes-k-joy15-const-k-joy15-199-src-mq3-client-keycodes-ml-1435298994"></a>
### K_JOY15

```ml
const K_JOY15 = 199
```

Engine key code for the joy15 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L160)

<a id="constant-constant-mq3-client-keycodes-k-joy16-const-k-joy16-200-src-mq3-client-keycodes-ml-1148051219"></a>
### K_JOY16

```ml
const K_JOY16 = 200
```

Engine key code for the joy16 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L162)

<a id="constant-constant-mq3-client-keycodes-k-joy17-const-k-joy17-201-src-mq3-client-keycodes-ml-1729725094"></a>
### K_JOY17

```ml
const K_JOY17 = 201
```

Engine key code for the joy17 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L164)

<a id="constant-constant-mq3-client-keycodes-k-joy18-const-k-joy18-202-src-mq3-client-keycodes-ml-1445210589"></a>
### K_JOY18

```ml
const K_JOY18 = 202
```

Engine key code for the joy18 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L166)

<a id="constant-constant-mq3-client-keycodes-k-joy19-const-k-joy19-203-src-mq3-client-keycodes-ml-888364704"></a>
### K_JOY19

```ml
const K_JOY19 = 203
```

Engine key code for the joy19 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L168)

<a id="constant-constant-mq3-client-keycodes-k-joy2-const-k-joy2-186-src-mq3-client-keycodes-ml-1332747432"></a>
### K_JOY2

```ml
const K_JOY2 = 186
```

Engine key code for the joy2 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L134)

<a id="constant-constant-mq3-client-keycodes-k-joy20-const-k-joy20-204-src-mq3-client-keycodes-ml-865247219"></a>
### K_JOY20

```ml
const K_JOY20 = 204
```

Engine key code for the joy20 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L170)

<a id="constant-constant-mq3-client-keycodes-k-joy21-const-k-joy21-205-src-mq3-client-keycodes-ml-2045978078"></a>
### K_JOY21

```ml
const K_JOY21 = 205
```

Engine key code for the joy21 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L172)

<a id="constant-constant-mq3-client-keycodes-k-joy22-const-k-joy22-206-src-mq3-client-keycodes-ml-376281961"></a>
### K_JOY22

```ml
const K_JOY22 = 206
```

Engine key code for the joy22 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L174)

<a id="constant-constant-mq3-client-keycodes-k-joy23-const-k-joy23-207-src-mq3-client-keycodes-ml-523908556"></a>
### K_JOY23

```ml
const K_JOY23 = 207
```

Engine key code for the joy23 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L176)

<a id="constant-constant-mq3-client-keycodes-k-joy24-const-k-joy24-208-src-mq3-client-keycodes-ml-331546847"></a>
### K_JOY24

```ml
const K_JOY24 = 208
```

Engine key code for the joy24 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L178)

<a id="constant-constant-mq3-client-keycodes-k-joy25-const-k-joy25-209-src-mq3-client-keycodes-ml-942101258"></a>
### K_JOY25

```ml
const K_JOY25 = 209
```

Engine key code for the joy25 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L180)

<a id="constant-constant-mq3-client-keycodes-k-joy26-const-k-joy26-210-src-mq3-client-keycodes-ml-962167776"></a>
### K_JOY26

```ml
const K_JOY26 = 210
```

Engine key code for the joy26 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L182)

<a id="constant-constant-mq3-client-keycodes-k-joy27-const-k-joy27-211-src-mq3-client-keycodes-ml-693230013"></a>
### K_JOY27

```ml
const K_JOY27 = 211
```

Engine key code for the joy27 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L184)

<a id="constant-constant-mq3-client-keycodes-k-joy28-const-k-joy28-212-src-mq3-client-keycodes-ml-542562722"></a>
### K_JOY28

```ml
const K_JOY28 = 212
```

Engine key code for the joy28 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L186)

<a id="constant-constant-mq3-client-keycodes-k-joy29-const-k-joy29-213-src-mq3-client-keycodes-ml-1597448375"></a>
### K_JOY29

```ml
const K_JOY29 = 213
```

Engine key code for the joy29 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L188)

<a id="constant-constant-mq3-client-keycodes-k-joy3-const-k-joy3-187-src-mq3-client-keycodes-ml-2127107971"></a>
### K_JOY3

```ml
const K_JOY3 = 187
```

Engine key code for the joy3 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L136)

<a id="constant-constant-mq3-client-keycodes-k-joy30-const-k-joy30-214-src-mq3-client-keycodes-ml-560209216"></a>
### K_JOY30

```ml
const K_JOY30 = 214
```

Engine key code for the joy30 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L190)

<a id="constant-constant-mq3-client-keycodes-k-joy31-const-k-joy31-215-src-mq3-client-keycodes-ml-217980609"></a>
### K_JOY31

```ml
const K_JOY31 = 215
```

Engine key code for the joy31 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L192)

<a id="constant-constant-mq3-client-keycodes-k-joy32-const-k-joy32-216-src-mq3-client-keycodes-ml-1092565566"></a>
### K_JOY32

```ml
const K_JOY32 = 216
```

Engine key code for the joy32 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L194)

<a id="constant-constant-mq3-client-keycodes-k-joy4-const-k-joy4-188-src-mq3-client-keycodes-ml-444233382"></a>
### K_JOY4

```ml
const K_JOY4 = 188
```

Engine key code for the joy4 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L138)

<a id="constant-constant-mq3-client-keycodes-k-joy5-const-k-joy5-189-src-mq3-client-keycodes-ml-44674353"></a>
### K_JOY5

```ml
const K_JOY5 = 189
```

Engine key code for the joy5 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L140)

<a id="constant-constant-mq3-client-keycodes-k-joy6-const-k-joy6-190-src-mq3-client-keycodes-ml-333558461"></a>
### K_JOY6

```ml
const K_JOY6 = 190
```

Engine key code for the joy6 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L142)

<a id="constant-constant-mq3-client-keycodes-k-joy7-const-k-joy7-191-src-mq3-client-keycodes-ml-1292170810"></a>
### K_JOY7

```ml
const K_JOY7 = 191
```

Engine key code for the joy7 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L144)

<a id="constant-constant-mq3-client-keycodes-k-joy8-const-k-joy8-192-src-mq3-client-keycodes-ml-1272827999"></a>
### K_JOY8

```ml
const K_JOY8 = 192
```

Engine key code for the joy8 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L146)

<a id="constant-constant-mq3-client-keycodes-k-joy9-const-k-joy9-193-src-mq3-client-keycodes-ml-584727948"></a>
### K_JOY9

```ml
const K_JOY9 = 193
```

Engine key code for the joy9 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L148)

<a id="constant-constant-mq3-client-keycodes-k-kp-5-const-k-kp-5-164-src-mq3-client-keycodes-ml-1909415858"></a>
### K_KP_5

```ml
const K_KP_5 = 164
```

Engine key code for the kp 5 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L90)

<a id="constant-constant-mq3-client-keycodes-k-kp-del-const-k-kp-del-171-src-mq3-client-keycodes-ml-365637676"></a>
### K_KP_DEL

```ml
const K_KP_DEL = 171
```

Engine key code for the kp del input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L104)

<a id="constant-constant-mq3-client-keycodes-k-kp-downarrow-const-k-kp-downarrow-167-src-mq3-client-keycodes-ml-2121534725"></a>
### K_KP_DOWNARROW

```ml
const K_KP_DOWNARROW = 167
```

Engine key code for the kp downarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L96)

<a id="constant-constant-mq3-client-keycodes-k-kp-end-const-k-kp-end-166-src-mq3-client-keycodes-ml-1300594096"></a>
### K_KP_END

```ml
const K_KP_END = 166
```

Engine key code for the kp end input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L94)

<a id="constant-constant-mq3-client-keycodes-k-kp-enter-const-k-kp-enter-169-src-mq3-client-keycodes-ml-1298927261"></a>
### K_KP_ENTER

```ml
const K_KP_ENTER = 169
```

Engine key code for the kp enter input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L100)

<a id="constant-constant-mq3-client-keycodes-k-kp-equals-const-k-kp-equals-177-src-mq3-client-keycodes-ml-2133391922"></a>
### K_KP_EQUALS

```ml
const K_KP_EQUALS = 177
```

Engine key code for the kp equals input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L116)

<a id="constant-constant-mq3-client-keycodes-k-kp-home-const-k-kp-home-160-src-mq3-client-keycodes-ml-807266446"></a>
### K_KP_HOME

```ml
const K_KP_HOME = 160
```

Engine key code for the kp home input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L82)

<a id="constant-constant-mq3-client-keycodes-k-kp-ins-const-k-kp-ins-170-src-mq3-client-keycodes-ml-322033287"></a>
### K_KP_INS

```ml
const K_KP_INS = 170
```

Engine key code for the kp ins input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L102)

<a id="constant-constant-mq3-client-keycodes-k-kp-leftarrow-const-k-kp-leftarrow-163-src-mq3-client-keycodes-ml-1760465399"></a>
### K_KP_LEFTARROW

```ml
const K_KP_LEFTARROW = 163
```

Engine key code for the kp leftarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L88)

<a id="constant-constant-mq3-client-keycodes-k-kp-minus-const-k-kp-minus-173-src-mq3-client-keycodes-ml-1279529172"></a>
### K_KP_MINUS

```ml
const K_KP_MINUS = 173
```

Engine key code for the kp minus input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L108)

<a id="constant-constant-mq3-client-keycodes-k-kp-numlock-const-k-kp-numlock-175-src-mq3-client-keycodes-ml-372050180"></a>
### K_KP_NUMLOCK

```ml
const K_KP_NUMLOCK = 175
```

Engine key code for the kp numlock input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L112)

<a id="constant-constant-mq3-client-keycodes-k-kp-pgdn-const-k-kp-pgdn-168-src-mq3-client-keycodes-ml-1336326750"></a>
### K_KP_PGDN

```ml
const K_KP_PGDN = 168
```

Engine key code for the kp pgdn input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L98)

<a id="constant-constant-mq3-client-keycodes-k-kp-pgup-const-k-kp-pgup-162-src-mq3-client-keycodes-ml-1117222940"></a>
### K_KP_PGUP

```ml
const K_KP_PGUP = 162
```

Engine key code for the kp pgup input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L86)

<a id="constant-constant-mq3-client-keycodes-k-kp-plus-const-k-kp-plus-174-src-mq3-client-keycodes-ml-2024276737"></a>
### K_KP_PLUS

```ml
const K_KP_PLUS = 174
```

Engine key code for the kp plus input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L110)

<a id="constant-constant-mq3-client-keycodes-k-kp-rightarrow-const-k-kp-rightarrow-165-src-mq3-client-keycodes-ml-570894383"></a>
### K_KP_RIGHTARROW

```ml
const K_KP_RIGHTARROW = 165
```

Engine key code for the kp rightarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L92)

<a id="constant-constant-mq3-client-keycodes-k-kp-slash-const-k-kp-slash-172-src-mq3-client-keycodes-ml-1332495963"></a>
### K_KP_SLASH

```ml
const K_KP_SLASH = 172
```

Engine key code for the kp slash input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L106)

<a id="constant-constant-mq3-client-keycodes-k-kp-star-const-k-kp-star-176-src-mq3-client-keycodes-ml-1251064867"></a>
### K_KP_STAR

```ml
const K_KP_STAR = 176
```

Engine key code for the kp star input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L114)

<a id="constant-constant-mq3-client-keycodes-k-kp-uparrow-const-k-kp-uparrow-161-src-mq3-client-keycodes-ml-629706481"></a>
### K_KP_UPARROW

```ml
const K_KP_UPARROW = 161
```

Engine key code for the kp uparrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L84)

<a id="constant-constant-mq3-client-keycodes-k-last-key-const-k-last-key-233-src-mq3-client-keycodes-ml-382963483"></a>
### K_LAST_KEY

```ml
const K_LAST_KEY = 233
```

Engine key code for the last key input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L228)

<a id="constant-constant-mq3-client-keycodes-k-leftarrow-const-k-leftarrow-134-src-mq3-client-keycodes-ml-970842581"></a>
### K_LEFTARROW

```ml
const K_LEFTARROW = 134
```

Engine key code for the leftarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L30)

<a id="constant-constant-mq3-client-keycodes-k-mouse1-const-k-mouse1-178-src-mq3-client-keycodes-ml-145122171"></a>
### K_MOUSE1

```ml
const K_MOUSE1 = 178
```

Engine key code for the mouse1 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L118)

<a id="constant-constant-mq3-client-keycodes-k-mouse2-const-k-mouse2-179-src-mq3-client-keycodes-ml-1362485416"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = 179
```

Engine key code for the mouse2 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L120)

<a id="constant-constant-mq3-client-keycodes-k-mouse3-const-k-mouse3-180-src-mq3-client-keycodes-ml-290926050"></a>
### K_MOUSE3

```ml
const K_MOUSE3 = 180
```

Engine key code for the mouse3 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L122)

<a id="constant-constant-mq3-client-keycodes-k-mouse4-const-k-mouse4-181-src-mq3-client-keycodes-ml-1926033033"></a>
### K_MOUSE4

```ml
const K_MOUSE4 = 181
```

Engine key code for the mouse4 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L124)

<a id="constant-constant-mq3-client-keycodes-k-mouse5-const-k-mouse5-182-src-mq3-client-keycodes-ml-1915258296"></a>
### K_MOUSE5

```ml
const K_MOUSE5 = 182
```

Engine key code for the mouse5 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L126)

<a id="constant-constant-mq3-client-keycodes-k-mwheeldown-const-k-mwheeldown-183-src-mq3-client-keycodes-ml-568510033"></a>
### K_MWHEELDOWN

```ml
const K_MWHEELDOWN = 183
```

Engine key code for the mwheeldown input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L128)

<a id="constant-constant-mq3-client-keycodes-k-mwheelup-const-k-mwheelup-184-src-mq3-client-keycodes-ml-359076436"></a>
### K_MWHEELUP

```ml
const K_MWHEELUP = 184
```

Engine key code for the mwheelup input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L130)

<a id="constant-constant-mq3-client-keycodes-k-pause-const-k-pause-131-src-mq3-client-keycodes-ml-864191280"></a>
### K_PAUSE

```ml
const K_PAUSE = 131
```

Engine key code for the pause input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L24)

<a id="constant-constant-mq3-client-keycodes-k-pgdn-const-k-pgdn-141-src-mq3-client-keycodes-ml-978408609"></a>
### K_PGDN

```ml
const K_PGDN = 141
```

Engine key code for the pgdn input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L44)

<a id="constant-constant-mq3-client-keycodes-k-pgup-const-k-pgup-142-src-mq3-client-keycodes-ml-2123615412"></a>
### K_PGUP

```ml
const K_PGUP = 142
```

Engine key code for the pgup input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L46)

<a id="constant-constant-mq3-client-keycodes-k-power-const-k-power-130-src-mq3-client-keycodes-ml-1765515925"></a>
### K_POWER

```ml
const K_POWER = 130
```

Engine key code for the power input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L22)

<a id="constant-constant-mq3-client-keycodes-k-rightarrow-const-k-rightarrow-135-src-mq3-client-keycodes-ml-1366302208"></a>
### K_RIGHTARROW

```ml
const K_RIGHTARROW = 135
```

Engine key code for the rightarrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L32)

<a id="constant-constant-mq3-client-keycodes-k-shift-const-k-shift-138-src-mq3-client-keycodes-ml-3525337"></a>
### K_SHIFT

```ml
const K_SHIFT = 138
```

Engine key code for the shift input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L38)

<a id="constant-constant-mq3-client-keycodes-k-space-const-k-space-32-src-mq3-client-keycodes-ml-1230073510"></a>
### K_SPACE

```ml
const K_SPACE = 32
```

Engine key code for the space input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L14)

<a id="constant-constant-mq3-client-keycodes-k-tab-const-k-tab-9-src-mq3-client-keycodes-ml-2019643784"></a>
### K_TAB

```ml
const K_TAB = 9
```

Engine key code for the tab input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L8)

<a id="constant-constant-mq3-client-keycodes-k-uparrow-const-k-uparrow-132-src-mq3-client-keycodes-ml-865832115"></a>
### K_UPARROW

```ml
const K_UPARROW = 132
```

Engine key code for the uparrow input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/keycodes.ml#L26)
