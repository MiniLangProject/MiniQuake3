# `mq3.client.ui_sound_options.Menu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-sound-options-ml-196322516.md)

<a id="struct-struct-mq3-client-ui-sound-options-menu-struct-menu-src-mq3-client-ui-sound-options-ml-1326892169"></a>
## Menu

```ml
struct Menu
```

Stores UI sound options menu, including `wrapAround`, `fullscreen`, `cursor`, `items`, `assets`, `actions` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sound_options.ml#L51)

## Members

<a id="field-field-mq3-client-ui-sound-options-menu-actions-actions-src-mq3-client-ui-sound-options-ml-410031100"></a>
### actions

```ml
actions
```

Host requests queued while adjusting sound and music volume or changing sound quality, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sound_options.ml#L67)

<a id="field-field-mq3-client-ui-sound-options-menu-assets-assets-src-mq3-client-ui-sound-options-ml-1857664906"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the sound and music options menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sound_options.ml#L64)

<a id="field-field-mq3-client-ui-sound-options-menu-commands-commands-src-mq3-client-ui-sound-options-ml-1886138572"></a>
### commands

```ml
commands
```

When constructing this record, `init` supplies an empty list for this member. Used by `event` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sound_options.ml#L72)

<a id="field-field-mq3-client-ui-sound-options-menu-cursor-cursor-src-mq3-client-ui-sound-options-ml-1897321984"></a>
### cursor

```ml
cursor
```

When constructing this record, `init` supplies `ID_SOUND` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sound_options.ml#L59)

<a id="field-field-mq3-client-ui-sound-options-menu-cvarwrites-cvarwrites-src-mq3-client-ui-sound-options-ml-1506359940"></a>
### cvarWrites

```ml
cvarWrites
```

Cvar name/value changes queued by the sound and music options menu for the host to apply.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sound_options.ml#L69)

<a id="field-field-mq3-client-ui-sound-options-menu-fullscreen-fullscreen-src-mq3-client-ui-sound-options-ml-232666170"></a>
### fullscreen

```ml
fullscreen
```

Whether the sound-options menu covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sound_options.ml#L57)

<a id="field-field-mq3-client-ui-sound-options-menu-items-items-src-mq3-client-ui-sound-options-ml-1023400764"></a>
### items

```ml
items
```

Ordered child items participating in this menu's rendering and navigation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sound_options.ml#L61)

<a id="field-field-mq3-client-ui-sound-options-menu-wraparound-wraparound-src-mq3-client-ui-sound-options-ml-735186546"></a>
### wrapAround

```ml
wrapAround
```

Enables cyclic keyboard-focus navigation among the selectable entries of the sound and music options menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sound_options.ml#L54)
