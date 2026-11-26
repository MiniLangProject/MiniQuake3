# `src/mq3/client/ui_credits.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_credits`](Package-mq3-client-ui-credits-1622060838.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-client-ui-credits-draw-function-draw-src-mq3-client-ui-credits-ml-595757476"></a>
### draw

```ml
function draw()
```

UI_CreditMenu_Draw


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L60)

- [mq3.client.ui_credits.Draw](Type-mq3-client-ui-credits-draw-1322397722.md) — struct
<a id="constant-constant-mq3-client-ui-credits-exec-append-const-exec-append-2-src-mq3-client-ui-credits-ml-1920411779"></a>
### EXEC_APPEND

```ml
const EXEC_APPEND = 2
```

Console execution mode that appends text to the pending command buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L9)

<a id="function-function-mq3-client-ui-credits-gap-function-gap-y-scale-src-mq3-client-ui-credits-ml-924004559"></a>
### gap

```ml
function gap(y, scale)
```

Adapts `mq3.compat.numeric.trunc32` to UI credits `gap`, returning its result for `y+scale*PROP_HEIGHT*PROP_SMALL_SIZE_SCALE`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `y` | `dynamic` | — | Argument 1 of `mq3.compat.numeric.trunc32`; passed as `y+scale*PROP_HEIGHT*PROP_SMALL_SIZE_SCALE`. |
| `scale` | `dynamic` | — | Argument 1 of `mq3.compat.numeric.trunc32`; passed as `y+scale*PROP_HEIGHT*PROP_SMALL_SIZE_SCALE`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L58)

<a id="constant-constant-mq3-client-ui-credits-k-char-flag-const-k-char-flag-1024-src-mq3-client-ui-credits-ml-1700404100"></a>
### K_CHAR_FLAG

```ml
const K_CHAR_FLAG = 1024
```

Engine key code for the char flag input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L7)

<a id="function-function-mq3-client-ui-credits-key-function-key-keycode-src-mq3-client-ui-credits-ml-282366824"></a>
### key

```ml
function key(keyCode)
```

UI_CreditMenu_Key

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `keyCode` | `dynamic` | — | Value used by `if (keyCode&K_CHAR_FLAG)!=0 then return [] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L74)

<a id="function-function-mq3-client-ui-credits-open-function-open-src-mq3-client-ui-credits-ml-1611727752"></a>
### open

```ml
function open()
```

UI_CreditMenu


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L76)

<a id="constant-constant-mq3-client-ui-credits-prop-height-const-prop-height-27-src-mq3-client-ui-credits-ml-1593660612"></a>
### PROP_HEIGHT

```ml
const PROP_HEIGHT = 27
```

Prop font metric controlling height in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L15)

<a id="constant-constant-mq3-client-ui-credits-prop-small-size-scale-const-prop-small-size-scale-0-75-src-mq3-client-ui-credits-ml-1134170079"></a>
### PROP_SMALL_SIZE_SCALE

```ml
const PROP_SMALL_SIZE_SCALE = 0.75
```

Prop font metric controlling small size scale in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L17)

<a id="function-function-mq3-client-ui-credits-row-function-row-text-y-color-proportional-src-mq3-client-ui-credits-ml-1160213058"></a>
### row

```ml
function row(text, y, color, proportional)
```

Creates a `mq3.client.ui_credits.Draw` record. Assigns `text` from `text`, `y` from `y`, `color` from `color`, `proportional` from `proportional`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Value used to initialize `Draw.text`. |
| `y` | `dynamic` | — | Value used to initialize `Draw.y`. |
| `color` | `dynamic` | — | Value used to initialize `Draw.color`. |
| `proportional` | `dynamic` | — | Value used to initialize `Draw.proportional`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L54)

<a id="constant-constant-mq3-client-ui-credits-smallchar-height-const-smallchar-height-16-src-mq3-client-ui-credits-ml-944834052"></a>
### SMALLCHAR_HEIGHT

```ml
const SMALLCHAR_HEIGHT = 16
```

Smallchar font metric controlling height in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L19)

- [mq3.client.ui_credits.State](Type-mq3-client-ui-credits-state-2081450621.md) — struct
<a id="constant-constant-mq3-client-ui-credits-ui-center-const-ui-center-1-src-mq3-client-ui-credits-ml-1552967744"></a>
### UI_CENTER

```ml
const UI_CENTER = 1
```

UI text-style flag selecting horizontally centered text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L11)

<a id="constant-constant-mq3-client-ui-credits-ui-smallfont-const-ui-smallfont-16-src-mq3-client-ui-credits-ml-1590258892"></a>
### UI_SMALLFONT

```ml
const UI_SMALLFONT = 16
```

UI text-style flag selecting the small fixed-width font.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_credits.ml#L13)
