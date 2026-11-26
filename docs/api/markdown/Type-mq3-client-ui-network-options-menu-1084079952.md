# `mq3.client.ui_network_options.Menu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-network-options-ml-2065436435.md)

<a id="struct-struct-mq3-client-ui-network-options-menu-struct-menu-src-mq3-client-ui-network-options-ml-1639599235"></a>
## Menu

```ml
struct Menu
```

Stores UI network options menu, including `wrapAround`, `fullscreen`, `cursor`, `items`, `assets`, `actions` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L39)

## Members

<a id="field-field-mq3-client-ui-network-options-menu-actions-actions-src-mq3-client-ui-network-options-ml-521749994"></a>
### actions

```ml
actions
```

Host requests queued while choosing and applying the network connection rate, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L55)

<a id="field-field-mq3-client-ui-network-options-menu-assets-assets-src-mq3-client-ui-network-options-ml-406193276"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the network-rate options menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L52)

<a id="field-field-mq3-client-ui-network-options-menu-cursor-cursor-src-mq3-client-ui-network-options-ml-772320398"></a>
### cursor

```ml
cursor
```

When constructing this record, `init` supplies `ID_NETWORK` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L47)

<a id="field-field-mq3-client-ui-network-options-menu-cvarwrites-cvarwrites-src-mq3-client-ui-network-options-ml-581014830"></a>
### cvarWrites

```ml
cvarWrites
```

Cvar name/value changes queued by the network-rate options menu for the host to apply.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L57)

<a id="field-field-mq3-client-ui-network-options-menu-fullscreen-fullscreen-src-mq3-client-ui-network-options-ml-849782684"></a>
### fullscreen

```ml
fullscreen
```

Whether the network-options menu covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L45)

<a id="field-field-mq3-client-ui-network-options-menu-items-items-src-mq3-client-ui-network-options-ml-897093818"></a>
### items

```ml
items
```

Ordered child items participating in this menu's rendering and navigation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L49)

<a id="field-field-mq3-client-ui-network-options-menu-wraparound-wraparound-src-mq3-client-ui-network-options-ml-1242697788"></a>
### wrapAround

```ml
wrapAround
```

Enables cyclic keyboard-focus navigation among the selectable entries of the network-rate options menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_network_options.ml#L42)
