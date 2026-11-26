# `mq3.client.ui_local.MenuText`

[Home](README.md) · [Source file](File-src-mq3-client-ui-local-ml-681073931.md)

<a id="struct-struct-mq3-client-ui-local-menutext-struct-menutext-src-mq3-client-ui-local-ml-1176883331"></a>
## MenuText

```ml
struct MenuText
```

Stores UI local menu text record, including `generic`, `style`, `color`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L281)

## Members

<a id="field-field-mq3-client-ui-local-menutext-color-color-src-mq3-client-ui-local-ml-1551668027"></a>
### color

```ml
color
```

RGBA text color referenced by the native-compatible menu text item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L290)

<a id="field-field-mq3-client-ui-local-menutext-generic-generic-src-mq3-client-ui-local-ml-435229703"></a>
### generic

```ml
generic
```

Common menu-item record containing the shared identity, layout, and callback data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L283)

<a id="field-field-mq3-client-ui-local-menutext-string-string-src-mq3-client-ui-local-ml-818388405"></a>
### string

```ml
string
```

Compatibility member corresponding to native `menutext_s.string`; the original declaration is `char* string`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L286)

<a id="field-field-mq3-client-ui-local-menutext-style-style-src-mq3-client-ui-local-ml-650564523"></a>
### style

```ml
style
```

UI drawing-style flags controlling alignment, font selection, and text emphasis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L288)
