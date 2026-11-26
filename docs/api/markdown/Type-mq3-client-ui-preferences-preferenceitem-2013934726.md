# `mq3.client.ui_preferences.PreferenceItem`

[Home](README.md) · [Source file](File-src-mq3-client-ui-preferences-ml-1708756856.md)

<a id="struct-struct-mq3-client-ui-preferences-preferenceitem-struct-preferenceitem-src-mq3-client-ui-preferences-ml-1810735989"></a>
## PreferenceItem

```ml
struct PreferenceItem
```

Stores UI preferences preference item record, including `id`, `label`, `y`, `kind`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L34)

## Members

<a id="field-field-mq3-client-ui-preferences-preferenceitem-id-id-src-mq3-client-ui-preferences-ml-1425278885"></a>
### id

```ml
id
```

Event-routing identifier of this selectable control in the gameplay-preferences menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L36)

<a id="field-field-mq3-client-ui-preferences-preferenceitem-kind-kind-src-mq3-client-ui-preferences-ml-1085397467"></a>
### kind

```ml
kind
```

Item category selecting pickup behavior or the type-specific UI control implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L43)

<a id="field-field-mq3-client-ui-preferences-preferenceitem-label-label-src-mq3-client-ui-preferences-ml-1396313339"></a>
### label

```ml
label
```

Human-readable caption painted beside or inside the UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L38)

<a id="field-field-mq3-client-ui-preferences-preferenceitem-y-y-src-mq3-client-ui-preferences-ml-779406855"></a>
### y

```ml
y
```

Vertical position of this menu control in the virtual layout used by the gameplay-preferences menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L41)
