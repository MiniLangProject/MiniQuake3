# `mq3.client.ui_mfield.HostAction`

[Home](README.md) · [Source file](File-src-mq3-client-ui-mfield-ml-1722706615.md)

<a id="struct-struct-mq3-client-ui-mfield-hostaction-struct-hostaction-src-mq3-client-ui-mfield-ml-582573375"></a>
## HostAction

```ml
struct HostAction
```

Stores UI mfield host action record, including `boundary`, `kind`, `text`, `x`, `y`, `style` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L17)

## Members

<a id="field-field-mq3-client-ui-mfield-hostaction-boundary-boundary-src-mq3-client-ui-mfield-ml-1420257217"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while editing a text field and drawing its visible text and cursor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L20)

<a id="field-field-mq3-client-ui-mfield-hostaction-cursorchar-cursorchar-src-mq3-client-ui-mfield-ml-930261245"></a>
### cursorChar

```ml
cursorChar
```

When constructing this record, `action` supplies `cursorChar` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L33)

<a id="field-field-mq3-client-ui-mfield-hostaction-dispatched-dispatched-src-mq3-client-ui-mfield-ml-33928079"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while editing a text field and drawing its visible text and cursor; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L36)

<a id="field-field-mq3-client-ui-mfield-hostaction-kind-kind-src-mq3-client-ui-mfield-ml-737406009"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while editing a text field and drawing its visible text and cursor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L23)

<a id="field-field-mq3-client-ui-mfield-hostaction-style-style-src-mq3-client-ui-mfield-ml-2112098609"></a>
### style

```ml
style
```

UI drawing-style flags controlling alignment, font selection, and text emphasis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L31)

<a id="field-field-mq3-client-ui-mfield-hostaction-text-text-src-mq3-client-ui-mfield-ml-1291055911"></a>
### text

```ml
text
```

Visible field text or clipboard contents carried by a menu text-editing host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L25)

<a id="field-field-mq3-client-ui-mfield-hostaction-x-x-src-mq3-client-ui-mfield-ml-1564312909"></a>
### x

```ml
x
```

Horizontal coordinate of a queued text-field or cursor drawing operation in menu coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L27)

<a id="field-field-mq3-client-ui-mfield-hostaction-y-y-src-mq3-client-ui-mfield-ml-370084289"></a>
### y

```ml
y
```

Vertical coordinate of a queued text-field or cursor drawing operation in menu coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_mfield.ml#L29)
