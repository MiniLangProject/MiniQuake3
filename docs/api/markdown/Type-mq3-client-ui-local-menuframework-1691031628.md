# `mq3.client.ui_local.MenuFramework`

[Home](README.md) · [Source file](File-src-mq3-client-ui-local-ml-681073931.md)

<a id="struct-struct-mq3-client-ui-local-menuframework-struct-menuframework-src-mq3-client-ui-local-ml-1182654955"></a>
## MenuFramework

```ml
struct MenuFramework
```

Stores UI local menu framework record, including `cursor`, `cursor_prev`, `nitems`, `items`, `draw`, `key` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L111)

## Members

<a id="field-field-mq3-client-ui-local-menuframework-cursor-cursor-src-mq3-client-ui-local-ml-1235020130"></a>
### cursor

```ml
cursor
```

Compatibility member corresponding to native `menuframework_s.cursor`; the original declaration is `int cursor`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L114)

<a id="field-field-mq3-client-ui-local-menuframework-cursor-prev-cursor-prev-src-mq3-client-ui-local-ml-2033461346"></a>
### cursor_prev

```ml
cursor_prev
```

Compatibility member corresponding to native `menuframework_s.cursor_prev`; the original declaration is `int cursor_prev`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L117)

<a id="field-field-mq3-client-ui-local-menuframework-draw-draw-src-mq3-client-ui-local-ml-1570928322"></a>
### draw

```ml
draw
```

Compatibility member corresponding to native `menuframework_s.draw`; the original declaration is `void (*draw) (void)`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L125)

<a id="field-field-mq3-client-ui-local-menuframework-fullscreen-fullscreen-src-mq3-client-ui-local-ml-629038576"></a>
### fullscreen

```ml
fullscreen
```

Whether the menu framework covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L133)

<a id="field-field-mq3-client-ui-local-menuframework-items-items-src-mq3-client-ui-local-ml-735485510"></a>
### items

```ml
items
```

Compatibility member corresponding to native `menuframework_s.items`; the original declaration is `void *items[MAX_MENUITEMS]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L122)

<a id="field-field-mq3-client-ui-local-menuframework-key-key-src-mq3-client-ui-local-ml-1064833510"></a>
### key

```ml
key
```

Registered sound handle used for key; mirrors native `menuframework_s.key`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L127)

<a id="field-field-mq3-client-ui-local-menuframework-nitems-nitems-src-mq3-client-ui-local-ml-211500722"></a>
### nitems

```ml
nitems
```

Number of entries currently present in the menu or selection list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L119)

<a id="field-field-mq3-client-ui-local-menuframework-showlogo-showlogo-src-mq3-client-ui-local-ml-502368162"></a>
### showlogo

```ml
showlogo
```

Compatibility member corresponding to native `menuframework_s.showlogo`; the original declaration is `qboolean showlogo`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L136)

<a id="field-field-mq3-client-ui-local-menuframework-wraparound-wraparound-src-mq3-client-ui-local-ml-578803536"></a>
### wrapAround

```ml
wrapAround
```

Enables cyclic keyboard-focus navigation among the selectable entries of the original UI compatibility records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L130)
