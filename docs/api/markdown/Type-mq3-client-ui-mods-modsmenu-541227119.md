# `mq3.client.ui_mods.ModsMenu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-mods-ml-1115549779.md)

<a id="struct-struct-mq3-client-ui-mods-modsmenu-struct-modsmenu-src-mq3-client-ui-mods-ml-1606099643"></a>
## ModsMenu

```ml
struct ModsMenu
```

Stores UI mods mods menu record, including `wrapAround`, `fullscreen`, `entries`, `selected`, `assets`, `cvarWrites` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L26)

## Members

<a id="field-field-mq3-client-ui-mods-modsmenu-actions-actions-src-mq3-client-ui-mods-ml-1499657307"></a>
### actions

```ml
actions
```

Host requests queued while enumerating game modifications and switching the active game directory, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L47)

<a id="field-field-mq3-client-ui-mods-modsmenu-assets-assets-src-mq3-client-ui-mods-ml-549583221"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the game-mod selection menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L40)

<a id="field-field-mq3-client-ui-mods-modsmenu-commands-commands-src-mq3-client-ui-mods-ml-11147371"></a>
### commands

```ml
commands
```

When constructing this record, `loadMods` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L44)

<a id="field-field-mq3-client-ui-mods-modsmenu-cvarwrites-cvarwrites-src-mq3-client-ui-mods-ml-320125091"></a>
### cvarWrites

```ml
cvarWrites
```

Cvar name/value changes queued by the game-mod selection menu for the host to apply.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L42)

<a id="field-field-mq3-client-ui-mods-modsmenu-entries-entries-src-mq3-client-ui-mods-ml-1318852595"></a>
### entries

```ml
entries
```

When constructing this record, `loadMods` supplies `[ModEntry("","Quake III Arena")]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L35)

<a id="field-field-mq3-client-ui-mods-modsmenu-fullscreen-fullscreen-src-mq3-client-ui-mods-ml-644888997"></a>
### fullscreen

```ml
fullscreen
```

Whether the mod-selection menu covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L32)

<a id="field-field-mq3-client-ui-mods-modsmenu-selected-selected-src-mq3-client-ui-mods-ml-667666997"></a>
### selected

```ml
selected
```

Current selection state or selected entry retained by the owning UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L37)

<a id="field-field-mq3-client-ui-mods-modsmenu-wraparound-wraparound-src-mq3-client-ui-mods-ml-1547325021"></a>
### wrapAround

```ml
wrapAround
```

Enables cyclic keyboard-focus navigation among the selectable entries of the game-mod selection menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mods.ml#L29)
