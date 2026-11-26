# `mq3.client.ui_spreset.Reset`

[Home](README.md) · [Source file](File-src-mq3-client-ui-spreset-ml-1175980980.md)

<a id="struct-struct-mq3-client-ui-spreset-reset-struct-reset-src-mq3-client-ui-spreset-ml-1632030513"></a>
## Reset

```ml
struct Reset
```

Stores UI spreset reset record, including `game`, `menu`, `no`, `yes`, `slashX`, `popped` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_spreset.ml#L20)

## Members

<a id="field-field-mq3-client-ui-spreset-reset-assets-assets-src-mq3-client-ui-spreset-ml-995424974"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the single-player progress-reset dialog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_spreset.ml#L42)

<a id="field-field-mq3-client-ui-spreset-reset-cvarwrites-cvarwrites-src-mq3-client-ui-spreset-ml-299795708"></a>
### cvarWrites

```ml
cvarWrites
```

Cvar name/value changes queued by the single-player progress-reset dialog for the host to apply.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_spreset.ml#L39)

<a id="field-field-mq3-client-ui-spreset-reset-drawrows-drawrows-src-mq3-client-ui-spreset-ml-1469184158"></a>
### drawRows

```ml
drawRows
```

Drawing commands for the reset prompt, frame artwork, and YES/NO separator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_spreset.ml#L44)

<a id="field-field-mq3-client-ui-spreset-reset-game-game-src-mq3-client-ui-spreset-ml-921626776"></a>
### game

```ml
game
```

When constructing this record, `create` supplies `game` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_spreset.ml#L22)

<a id="field-field-mq3-client-ui-spreset-reset-levelmenuopened-levelmenuopened-src-mq3-client-ui-spreset-ml-101187712"></a>
### levelMenuOpened

```ml
levelMenuOpened
```

True after accepting the reset and requesting a fresh single-player level menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_spreset.ml#L37)

<a id="field-field-mq3-client-ui-spreset-reset-menu-menu-src-mq3-client-ui-spreset-ml-1796879930"></a>
### menu

```ml
menu
```

When constructing this record, `create` supplies `qmenu.menu(true,true)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_spreset.ml#L24)

<a id="field-field-mq3-client-ui-spreset-reset-no-no-src-mq3-client-ui-spreset-ml-370564226"></a>
### no

```ml
no
```

Focusable NO choice that closes the progress-reset dialog without clearing single-player progress.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_spreset.ml#L26)

<a id="field-field-mq3-client-ui-spreset-reset-popcount-popcount-src-mq3-client-ui-spreset-ml-1933398764"></a>
### popCount

```ml
popCount
```

Number of menu-pop requests recorded while dismissing the reset dialog and its surrounding selection menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_spreset.ml#L35)

<a id="field-field-mq3-client-ui-spreset-reset-popped-popped-src-mq3-client-ui-spreset-ml-1317719152"></a>
### popped

```ml
popped
```

Records a request to remove the single-player progress-reset dialog from the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_spreset.ml#L32)

<a id="field-field-mq3-client-ui-spreset-reset-pushed-pushed-src-mq3-client-ui-spreset-ml-813336646"></a>
### pushed

```ml
pushed
```

Records that the single-player progress-reset dialog has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_spreset.ml#L46)

<a id="field-field-mq3-client-ui-spreset-reset-slashx-slashx-src-mq3-client-ui-spreset-ml-2068874322"></a>
### slashX

```ml
slashX
```

Horizontal position of the slash separating the centered YES/NO choices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_spreset.ml#L30)

<a id="field-field-mq3-client-ui-spreset-reset-yes-yes-src-mq3-client-ui-spreset-ml-1249944924"></a>
### yes

```ml
yes
```

Focusable YES choice that clears single-player progress and reopens arena selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_spreset.ml#L28)
