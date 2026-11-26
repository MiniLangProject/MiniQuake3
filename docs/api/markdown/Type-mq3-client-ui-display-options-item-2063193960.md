# `mq3.client.ui_display_options.Item`

[Home](README.md) · [Source file](File-src-mq3-client-ui-display-options-ml-1856767331.md)

<a id="struct-struct-mq3-client-ui-display-options-item-struct-item-src-mq3-client-ui-display-options-ml-721397991"></a>
## Item

```ml
struct Item
```

Stores UI display options menu item, including `id`, `kind`, `name`, `x`, `y`, `minValue` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L26)

## Members

<a id="field-field-mq3-client-ui-display-options-item-active-active-src-mq3-client-ui-display-options-ml-1245500826"></a>
### active

```ml
active
```

When constructing this record, `item` supplies `active` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L46)

<a id="field-field-mq3-client-ui-display-options-item-id-id-src-mq3-client-ui-display-options-ml-145062996"></a>
### id

```ml
id
```

Event-routing identifier of this selectable control in the display and gamma options menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L28)

<a id="field-field-mq3-client-ui-display-options-item-kind-kind-src-mq3-client-ui-display-options-ml-1055908730"></a>
### kind

```ml
kind
```

Item category selecting pickup behavior or the type-specific UI control implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L30)

<a id="field-field-mq3-client-ui-display-options-item-maxvalue-maxvalue-src-mq3-client-ui-display-options-ml-82716360"></a>
### maxValue

```ml
maxValue
```

When constructing this record, `item` supplies `maxValue` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L42)

<a id="field-field-mq3-client-ui-display-options-item-minvalue-minvalue-src-mq3-client-ui-display-options-ml-325363184"></a>
### minValue

```ml
minValue
```

When constructing this record, `item` supplies `minValue` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L40)

<a id="field-field-mq3-client-ui-display-options-item-name-name-src-mq3-client-ui-display-options-ml-2076949652"></a>
### name

```ml
name
```

Visible label or artwork name of a display-options menu control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L32)

<a id="field-field-mq3-client-ui-display-options-item-value-value-src-mq3-client-ui-display-options-ml-1129077750"></a>
### value

```ml
value
```

Current or default setting value held by this configuration variable or UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L44)

<a id="field-field-mq3-client-ui-display-options-item-x-x-src-mq3-client-ui-display-options-ml-801903210"></a>
### x

```ml
x
```

Horizontal position of this menu control in the virtual layout used by the display and gamma options menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L35)

<a id="field-field-mq3-client-ui-display-options-item-y-y-src-mq3-client-ui-display-options-ml-1537788246"></a>
### y

```ml
y
```

Vertical position of this menu control in the virtual layout used by the display and gamma options menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L38)
