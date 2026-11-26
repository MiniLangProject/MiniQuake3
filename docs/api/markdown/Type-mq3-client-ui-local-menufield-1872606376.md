# `mq3.client.ui_local.MenuField`

[Home](README.md) · [Source file](File-src-mq3-client-ui-local-ml-681073931.md)

<a id="struct-struct-mq3-client-ui-local-menufield-struct-menufield-src-mq3-client-ui-local-ml-232540659"></a>
## MenuField

```ml
struct MenuField
```

Stores UI local menu field record, including `generic`, `field`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L195)

## Members

<a id="field-field-mq3-client-ui-local-menufield-field-field-src-mq3-client-ui-local-ml-1542865286"></a>
### field

```ml
field
```

Compatibility member corresponding to native `menufield_s.field`; the original declaration is `mfield_t field`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L200)

<a id="field-field-mq3-client-ui-local-menufield-generic-generic-src-mq3-client-ui-local-ml-1019808738"></a>
### generic

```ml
generic
```

Common menu-item record containing the shared identity, layout, and callback data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_local.ml#L197)
