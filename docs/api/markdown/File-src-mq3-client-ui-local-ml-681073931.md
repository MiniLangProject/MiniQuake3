# `src/mq3/client/ui_local.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_local`](Package-mq3-client-ui-local-36724031.md)

Reachable from entry: **no**

## Imports

- `mq3/client/keycodes.ml` as `q3keys` → [src/mq3/client/keycodes.ml](File-src-mq3-client-keycodes-ml-1532276368.md)

## Declarations

<a id="constant-constant-mq3-client-ui-local-award-accuracy-const-award-accuracy-0-src-mq3-client-ui-local-ml-630191389"></a>
### AWARD_ACCURACY

```ml
const AWARD_ACCURACY = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L53)

<a id="constant-constant-mq3-client-ui-local-award-excellent-const-award-excellent-2-src-mq3-client-ui-local-ml-564245667"></a>
### AWARD_EXCELLENT

```ml
const AWARD_EXCELLENT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L55)

<a id="constant-constant-mq3-client-ui-local-award-frags-const-award-frags-4-src-mq3-client-ui-local-ml-380075933"></a>
### AWARD_FRAGS

```ml
const AWARD_FRAGS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L57)

<a id="constant-constant-mq3-client-ui-local-award-gauntlet-const-award-gauntlet-3-src-mq3-client-ui-local-ml-327058828"></a>
### AWARD_GAUNTLET

```ml
const AWARD_GAUNTLET = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L56)

<a id="constant-constant-mq3-client-ui-local-award-impressive-const-award-impressive-1-src-mq3-client-ui-local-ml-1583342888"></a>
### AWARD_IMPRESSIVE

```ml
const AWARD_IMPRESSIVE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L54)

<a id="constant-constant-mq3-client-ui-local-award-perfect-const-award-perfect-5-src-mq3-client-ui-local-ml-1025808460"></a>
### AWARD_PERFECT

```ml
const AWARD_PERFECT = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L58)

<a id="function-function-mq3-client-ui-local-declaredfunctions-function-declaredfunctions-src-mq3-client-ui-local-ml-1006666492"></a>
### declaredFunctions

```ml
function declaredFunctions()
```

Lists the 226 UI local declared functions strings in their declared order, beginning with `"Menu_Cache"`, `"Menu_Focus"`, `"Menu_AddItem"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L96)

<a id="function-function-mq3-client-ui-local-declaredglobals-function-declaredglobals-src-mq3-client-ui-local-ml-1877285082"></a>
### declaredGlobals

```ml
function declaredGlobals()
```

Lists the 79 UI local declared globals strings in their declared order, beginning with `"ui_ffa_fraglimit"`, `"ui_ffa_timelimit"`, `"ui_tourney_fraglimit"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L98)

<a id="constant-constant-mq3-client-ui-local-lcolumn-offset-const-lcolumn-offset-16-src-mq3-client-ui-local-ml-846763027"></a>
### LCOLUMN_OFFSET

```ml
const LCOLUMN_OFFSET = -16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L11)

- [mq3.client.ui_local.LerpFrame](Type-mq3-client-ui-local-lerpframe-1948172491.md) — struct
<a id="constant-constant-mq3-client-ui-local-max-edit-line-const-max-edit-line-256-src-mq3-client-ui-local-ml-1937246358"></a>
### MAX_EDIT_LINE

```ml
const MAX_EDIT_LINE = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L13)

<a id="constant-constant-mq3-client-ui-local-max-favoriteservers-const-max-favoriteservers-16-src-mq3-client-ui-local-ml-265766086"></a>
### MAX_FAVORITESERVERS

```ml
const MAX_FAVORITESERVERS = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L16)

<a id="constant-constant-mq3-client-ui-local-max-menudepth-const-max-menudepth-8-src-mq3-client-ui-local-ml-1175605061"></a>
### MAX_MENUDEPTH

```ml
const MAX_MENUDEPTH = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L14)

<a id="constant-constant-mq3-client-ui-local-max-menuitems-const-max-menuitems-64-src-mq3-client-ui-local-ml-1231706181"></a>
### MAX_MENUITEMS

```ml
const MAX_MENUITEMS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L15)

<a id="function-function-mq3-client-ui-local-menuacceptsinput-function-menuacceptsinput-flags-src-mq3-client-ui-local-ml-529919855"></a>
### menuAcceptsInput

```ml
function menuAcceptsInput(flags)
```

Computes `(flags&(QMF_GRAYED|QMF_INACTIVE|QMF_HIDDEN))==0` for UI local `menuAcceptsInput`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `dynamic` | — | Value used by `return (flags&(QMF_GRAYED\|QMF_INACTIVE\|QMF_HIDDEN))==0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L91)

- [mq3.client.ui_local.MenuAction](Type-mq3-client-ui-local-menuaction-174075286.md) — struct
- [mq3.client.ui_local.MenuBitmap](Type-mq3-client-ui-local-menubitmap-1888158079.md) — struct
- [mq3.client.ui_local.MenuCommon](Type-mq3-client-ui-local-menucommon-1608348933.md) — struct
- [mq3.client.ui_local.MenuField](Type-mq3-client-ui-local-menufield-1872606376.md) — struct
- [mq3.client.ui_local.MenuFramework](Type-mq3-client-ui-local-menuframework-1691031628.md) — struct
- [mq3.client.ui_local.MenuList](Type-mq3-client-ui-local-menulist-1276661916.md) — struct
- [mq3.client.ui_local.MenuRadioButton](Type-mq3-client-ui-local-menuradiobutton-423389823.md) — struct
- [mq3.client.ui_local.MenuSlider](Type-mq3-client-ui-local-menuslider-395122673.md) — struct
- [mq3.client.ui_local.MenuText](Type-mq3-client-ui-local-menutext-1745879907.md) — struct
- [mq3.client.ui_local.MField](Type-mq3-client-ui-local-mfield-154790366.md) — struct
<a id="constant-constant-mq3-client-ui-local-mtype-action-const-mtype-action-2-src-mq3-client-ui-local-ml-1772363321"></a>
### MTYPE_ACTION

```ml
const MTYPE_ACTION = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L20)

<a id="constant-constant-mq3-client-ui-local-mtype-bitmap-const-mtype-bitmap-6-src-mq3-client-ui-local-ml-1164678291"></a>
### MTYPE_BITMAP

```ml
const MTYPE_BITMAP = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L24)

<a id="constant-constant-mq3-client-ui-local-mtype-btext-const-mtype-btext-10-src-mq3-client-ui-local-ml-321354144"></a>
### MTYPE_BTEXT

```ml
const MTYPE_BTEXT = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L28)

<a id="constant-constant-mq3-client-ui-local-mtype-field-const-mtype-field-4-src-mq3-client-ui-local-ml-556848217"></a>
### MTYPE_FIELD

```ml
const MTYPE_FIELD = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L22)

<a id="constant-constant-mq3-client-ui-local-mtype-null-const-mtype-null-0-src-mq3-client-ui-local-ml-92522593"></a>
### MTYPE_NULL

```ml
const MTYPE_NULL = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L18)

<a id="constant-constant-mq3-client-ui-local-mtype-ptext-const-mtype-ptext-9-src-mq3-client-ui-local-ml-674868828"></a>
### MTYPE_PTEXT

```ml
const MTYPE_PTEXT = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L27)

<a id="constant-constant-mq3-client-ui-local-mtype-radiobutton-const-mtype-radiobutton-5-src-mq3-client-ui-local-ml-799450956"></a>
### MTYPE_RADIOBUTTON

```ml
const MTYPE_RADIOBUTTON = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L23)

<a id="constant-constant-mq3-client-ui-local-mtype-scrolllist-const-mtype-scrolllist-8-src-mq3-client-ui-local-ml-174794633"></a>
### MTYPE_SCROLLLIST

```ml
const MTYPE_SCROLLLIST = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L26)

<a id="constant-constant-mq3-client-ui-local-mtype-slider-const-mtype-slider-1-src-mq3-client-ui-local-ml-1785423032"></a>
### MTYPE_SLIDER

```ml
const MTYPE_SLIDER = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L19)

<a id="constant-constant-mq3-client-ui-local-mtype-spincontrol-const-mtype-spincontrol-3-src-mq3-client-ui-local-ml-1940512098"></a>
### MTYPE_SPINCONTROL

```ml
const MTYPE_SPINCONTROL = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L21)

<a id="constant-constant-mq3-client-ui-local-mtype-text-const-mtype-text-7-src-mq3-client-ui-local-ml-1522701158"></a>
### MTYPE_TEXT

```ml
const MTYPE_TEXT = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L25)

<a id="function-function-mq3-client-ui-local-normalizecharacterevent-function-normalizecharacterevent-key-src-mq3-client-ui-local-ml-1206847335"></a>
### normalizeCharacterEvent

```ml
function normalizeCharacterEvent(key)
```

Calls `mq3.client.keycodes.isCharacterEvent`, `mq3.client.keycodes.characterCode` from UI local `normalizeCharacterEvent`. The final path returns `key`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI local entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L94)

- [mq3.client.ui_local.PlayerInfo](Type-mq3-client-ui-local-playerinfo-1500161226.md) — struct
<a id="constant-constant-mq3-client-ui-local-qm-activated-const-qm-activated-3-src-mq3-client-ui-local-ml-1242097852"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L52)

<a id="constant-constant-mq3-client-ui-local-qm-gotfocus-const-qm-gotfocus-1-src-mq3-client-ui-local-ml-783738696"></a>
### QM_GOTFOCUS

```ml
const QM_GOTFOCUS = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L50)

<a id="constant-constant-mq3-client-ui-local-qm-lostfocus-const-qm-lostfocus-2-src-mq3-client-ui-local-ml-1355199767"></a>
### QM_LOSTFOCUS

```ml
const QM_LOSTFOCUS = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L51)

<a id="constant-constant-mq3-client-ui-local-qmf-blink-const-qmf-blink-1-src-mq3-client-ui-local-ml-933761416"></a>
### QMF_BLINK

```ml
const QMF_BLINK = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L29)

<a id="constant-constant-mq3-client-ui-local-qmf-center-justify-const-qmf-center-justify-8-src-mq3-client-ui-local-ml-480289733"></a>
### QMF_CENTER_JUSTIFY

```ml
const QMF_CENTER_JUSTIFY = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L32)

<a id="constant-constant-mq3-client-ui-local-qmf-grayed-const-qmf-grayed-8192-src-mq3-client-ui-local-ml-281636659"></a>
### QMF_GRAYED

```ml
const QMF_GRAYED = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L42)

<a id="constant-constant-mq3-client-ui-local-qmf-hasmousefocus-const-qmf-hasmousefocus-512-src-mq3-client-ui-local-ml-316051613"></a>
### QMF_HASMOUSEFOCUS

```ml
const QMF_HASMOUSEFOCUS = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L38)

<a id="constant-constant-mq3-client-ui-local-qmf-hidden-const-qmf-hidden-4096-src-mq3-client-ui-local-ml-1225204506"></a>
### QMF_HIDDEN

```ml
const QMF_HIDDEN = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L41)

<a id="constant-constant-mq3-client-ui-local-qmf-highlight-const-qmf-highlight-64-src-mq3-client-ui-local-ml-1709353717"></a>
### QMF_HIGHLIGHT

```ml
const QMF_HIGHLIGHT = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L35)

<a id="constant-constant-mq3-client-ui-local-qmf-highlight-if-focus-const-qmf-highlight-if-focus-128-src-mq3-client-ui-local-ml-1440106728"></a>
### QMF_HIGHLIGHT_IF_FOCUS

```ml
const QMF_HIGHLIGHT_IF_FOCUS = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L36)

<a id="constant-constant-mq3-client-ui-local-qmf-inactive-const-qmf-inactive-16384-src-mq3-client-ui-local-ml-2064438323"></a>
### QMF_INACTIVE

```ml
const QMF_INACTIVE = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L43)

<a id="constant-constant-mq3-client-ui-local-qmf-left-justify-const-qmf-left-justify-4-src-mq3-client-ui-local-ml-1681889857"></a>
### QMF_LEFT_JUSTIFY

```ml
const QMF_LEFT_JUSTIFY = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L31)

<a id="constant-constant-mq3-client-ui-local-qmf-lowercase-const-qmf-lowercase-262144-src-mq3-client-ui-local-ml-620393864"></a>
### QMF_LOWERCASE

```ml
const QMF_LOWERCASE = 262144
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L47)

<a id="constant-constant-mq3-client-ui-local-qmf-mouseonly-const-qmf-mouseonly-2048-src-mq3-client-ui-local-ml-803365353"></a>
### QMF_MOUSEONLY

```ml
const QMF_MOUSEONLY = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L40)

<a id="constant-constant-mq3-client-ui-local-qmf-nodefaultinit-const-qmf-nodefaultinit-32768-src-mq3-client-ui-local-ml-1005007385"></a>
### QMF_NODEFAULTINIT

```ml
const QMF_NODEFAULTINIT = 32768
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L44)

<a id="constant-constant-mq3-client-ui-local-qmf-noonofftext-const-qmf-noonofftext-1024-src-mq3-client-ui-local-ml-1318134046"></a>
### QMF_NOONOFFTEXT

```ml
const QMF_NOONOFFTEXT = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L39)

<a id="constant-constant-mq3-client-ui-local-qmf-numbersonly-const-qmf-numbersonly-32-src-mq3-client-ui-local-ml-1998408404"></a>
### QMF_NUMBERSONLY

```ml
const QMF_NUMBERSONLY = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L34)

<a id="constant-constant-mq3-client-ui-local-qmf-ownerdraw-const-qmf-ownerdraw-65536-src-mq3-client-ui-local-ml-767128970"></a>
### QMF_OWNERDRAW

```ml
const QMF_OWNERDRAW = 65536
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L45)

<a id="constant-constant-mq3-client-ui-local-qmf-pulse-const-qmf-pulse-131072-src-mq3-client-ui-local-ml-13930455"></a>
### QMF_PULSE

```ml
const QMF_PULSE = 131072
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L46)

<a id="constant-constant-mq3-client-ui-local-qmf-pulseiffocus-const-qmf-pulseiffocus-256-src-mq3-client-ui-local-ml-1229183858"></a>
### QMF_PULSEIFFOCUS

```ml
const QMF_PULSEIFFOCUS = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L37)

<a id="constant-constant-mq3-client-ui-local-qmf-right-justify-const-qmf-right-justify-16-src-mq3-client-ui-local-ml-67789290"></a>
### QMF_RIGHT_JUSTIFY

```ml
const QMF_RIGHT_JUSTIFY = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L33)

<a id="constant-constant-mq3-client-ui-local-qmf-silent-const-qmf-silent-1048576-src-mq3-client-ui-local-ml-1684734032"></a>
### QMF_SILENT

```ml
const QMF_SILENT = 1048576
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L49)

<a id="constant-constant-mq3-client-ui-local-qmf-smallfont-const-qmf-smallfont-2-src-mq3-client-ui-local-ml-961448639"></a>
### QMF_SMALLFONT

```ml
const QMF_SMALLFONT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L30)

<a id="constant-constant-mq3-client-ui-local-qmf-uppercase-const-qmf-uppercase-524288-src-mq3-client-ui-local-ml-666445788"></a>
### QMF_UPPERCASE

```ml
const QMF_UPPERCASE = 524288
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L48)

<a id="constant-constant-mq3-client-ui-local-rcolumn-offset-const-rcolumn-offset-16-src-mq3-client-ui-local-ml-926378032"></a>
### RCOLUMN_OFFSET

```ml
const RCOLUMN_OFFSET = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L10)

<a id="constant-constant-mq3-client-ui-local-slider-range-const-slider-range-10-src-mq3-client-ui-local-ml-1942672456"></a>
### SLIDER_RANGE

```ml
const SLIDER_RANGE = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L12)

<a id="function-function-mq3-client-ui-local-typenames-function-typenames-src-mq3-client-ui-local-ml-578436586"></a>
### typeNames

```ml
function typeNames()
```

Lists the type names catalog for UI local in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L88)

<a id="constant-constant-mq3-client-ui-local-ui-api-version-const-ui-api-version-4-src-mq3-client-ui-local-ml-208582639"></a>
### UI_API_VERSION

```ml
const UI_API_VERSION = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L9)

- [mq3.client.ui_local.UIStatic](Type-mq3-client-ui-local-uistatic-82344535.md) — struct
