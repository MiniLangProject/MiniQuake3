# `mq3.client.ui_servers2.Item`

[Home](README.md) · [Source file](File-src-mq3-client-ui-servers2-ml-1909498126.md)

<a id="struct-struct-mq3-client-ui-servers2-item-struct-item-src-mq3-client-ui-servers2-ml-1563602219"></a>
## Item

```ml
struct Item
```

Stores UI servers2 menu item, including `id`, `kind`, `name`, `x`, `y`, `fallback`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L174)

## Members

<a id="field-field-mq3-client-ui-servers2-item-fallback-fallback-src-mq3-client-ui-servers2-ml-484313974"></a>
### fallback

```ml
fallback
```

When constructing this record, `item` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L187)

<a id="field-field-mq3-client-ui-servers2-item-id-id-src-mq3-client-ui-servers2-ml-767842824"></a>
### id

```ml
id
```

Event-routing identifier of this selectable control in the base-game server browser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L176)

<a id="field-field-mq3-client-ui-servers2-item-kind-kind-src-mq3-client-ui-servers2-ml-515430030"></a>
### kind

```ml
kind
```

Item category selecting pickup behavior or the type-specific UI control implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L178)

<a id="field-field-mq3-client-ui-servers2-item-name-name-src-mq3-client-ui-servers2-ml-645407764"></a>
### name

```ml
name
```

Label or artwork resource identifying the server-browser control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L180)

<a id="field-field-mq3-client-ui-servers2-item-x-x-src-mq3-client-ui-servers2-ml-138743578"></a>
### x

```ml
x
```

Horizontal position of this menu control in the virtual layout used by the base-game server browser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L183)

<a id="field-field-mq3-client-ui-servers2-item-y-y-src-mq3-client-ui-servers2-ml-869263174"></a>
### y

```ml
y
```

Vertical position of this menu control in the virtual layout used by the base-game server browser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L185)
