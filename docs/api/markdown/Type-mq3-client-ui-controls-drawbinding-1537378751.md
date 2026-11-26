# `mq3.client.ui_controls.DrawBinding`

[Home](README.md) · [Source file](File-src-mq3-client-ui-controls-ml-1689765730.md)

<a id="struct-struct-mq3-client-ui-controls-drawbinding-struct-drawbinding-src-mq3-client-ui-controls-ml-2020607527"></a>
## DrawBinding

```ml
struct DrawBinding
```

Stores UI controls draw binding record, including `label`, `keys`, `selected`, `grayed`, `waiting`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L235)

## Members

<a id="field-field-mq3-client-ui-controls-drawbinding-grayed-grayed-src-mq3-client-ui-controls-ml-1307391722"></a>
### grayed

```ml
grayed
```

When constructing this record, `drawKeyBinding` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L243)

<a id="field-field-mq3-client-ui-controls-drawbinding-keys-keys-src-mq3-client-ui-controls-ml-1388423326"></a>
### keys

```ml
keys
```

When constructing this record, `drawKeyBinding` supplies `"???"` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L239)

<a id="field-field-mq3-client-ui-controls-drawbinding-label-label-src-mq3-client-ui-controls-ml-2021008990"></a>
### label

```ml
label
```

Human-readable caption painted beside or inside the UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L237)

<a id="field-field-mq3-client-ui-controls-drawbinding-selected-selected-src-mq3-client-ui-controls-ml-1262228588"></a>
### selected

```ml
selected
```

Current selection state or selected entry retained by the owning UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L241)

<a id="field-field-mq3-client-ui-controls-drawbinding-waiting-waiting-src-mq3-client-ui-controls-ml-1544400478"></a>
### waiting

```ml
waiting
```

When constructing this record, `drawKeyBinding` supplies `state.waitingForKey` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_controls.ml#L245)
