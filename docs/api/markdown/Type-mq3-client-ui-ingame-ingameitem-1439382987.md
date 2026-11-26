# `mq3.client.ui_ingame.InGameItem`

[Home](README.md) · [Source file](File-src-mq3-client-ui-ingame-ml-232608247.md)

<a id="struct-struct-mq3-client-ui-ingame-ingameitem-struct-ingameitem-src-mq3-client-ui-ingame-ml-167263911"></a>
## InGameItem

```ml
struct InGameItem
```

Stores UI ingame in game item record, including `id`, `label`, `y`, `grayed`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L41)

## Members

<a id="field-field-mq3-client-ui-ingame-ingameitem-grayed-grayed-src-mq3-client-ui-ingame-ml-1809131247"></a>
### grayed

```ml
grayed
```

When constructing this record, `init` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L49)

<a id="field-field-mq3-client-ui-ingame-ingameitem-id-id-src-mq3-client-ui-ingame-ml-1575840321"></a>
### id

```ml
id
```

Event-routing identifier of this selectable control in the in-game pause menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L43)

<a id="field-field-mq3-client-ui-ingame-ingameitem-label-label-src-mq3-client-ui-ingame-ml-1000823419"></a>
### label

```ml
label
```

Human-readable caption painted beside or inside the UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L45)

<a id="field-field-mq3-client-ui-ingame-ingameitem-y-y-src-mq3-client-ui-ingame-ml-356918511"></a>
### y

```ml
y
```

Vertical position of this menu control in the virtual layout used by the in-game pause menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_ingame.ml#L47)
