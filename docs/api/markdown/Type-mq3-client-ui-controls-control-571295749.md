# `mq3.client.ui_controls.Control`

[Home](README.md) · [Source file](File-src-mq3-client-ui-controls-ml-1689765730.md)

<a id="struct-struct-mq3-client-ui-controls-control-struct-control-src-mq3-client-ui-controls-ml-4660595"></a>
## Control

```ml
struct Control
```

Stores UI controls control record, including `id`, `group`, `visible`, `inactive`, `grayed`, `highlighted` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L214)

## Members

<a id="field-field-mq3-client-ui-controls-control-grayed-grayed-src-mq3-client-ui-controls-ml-915610372"></a>
### grayed

```ml
grayed
```

When constructing this record, `makeControls` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L224)

<a id="field-field-mq3-client-ui-controls-control-group-group-src-mq3-client-ui-controls-ml-973774032"></a>
### group

```ml
group
```

Controls-menu section to which this binding belongs, as selected by the control identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L218)

<a id="field-field-mq3-client-ui-controls-control-highlighted-highlighted-src-mq3-client-ui-controls-ml-1563059856"></a>
### highlighted

```ml
highlighted
```

When constructing this record, `makeControls` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L226)

<a id="field-field-mq3-client-ui-controls-control-id-id-src-mq3-client-ui-controls-ml-1509484950"></a>
### id

```ml
id
```

Event-routing identifier of this selectable control in the controls and key-bindings menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L216)

<a id="field-field-mq3-client-ui-controls-control-inactive-inactive-src-mq3-client-ui-controls-ml-1034554758"></a>
### inactive

```ml
inactive
```

When constructing this record, `makeControls` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L222)

<a id="field-field-mq3-client-ui-controls-control-visible-visible-src-mq3-client-ui-controls-ml-845656072"></a>
### visible

```ml
visible
```

True when the record is eligible for the current drawing or browser-display pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L220)

<a id="field-field-mq3-client-ui-controls-control-x-x-src-mq3-client-ui-controls-ml-176244248"></a>
### x

```ml
x
```

Horizontal position of this menu control in the virtual layout used by the controls and key-bindings menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L229)

<a id="field-field-mq3-client-ui-controls-control-y-y-src-mq3-client-ui-controls-ml-1653645404"></a>
### y

```ml
y
```

Vertical position of this menu control in the virtual layout used by the controls and key-bindings menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L232)
