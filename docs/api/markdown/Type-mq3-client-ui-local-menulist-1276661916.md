# `mq3.client.ui_local.MenuList`

[Home](README.md) · [Source file](File-src-mq3-client-ui-local-ml-681073931.md)

<a id="struct-struct-mq3-client-ui-local-menulist-struct-menulist-src-mq3-client-ui-local-ml-1745408991"></a>
## MenuList

```ml
struct MenuList
```

Stores UI local menu list record, including `generic`, `oldvalue`, `curvalue`, `numitems`, `top`, `itemnames` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L220)

## Members

<a id="field-field-mq3-client-ui-local-menulist-columns-columns-src-mq3-client-ui-local-ml-530428350"></a>
### columns

```ml
columns
```

Column descriptors used to lay out a listbox's displayed data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L241)

<a id="field-field-mq3-client-ui-local-menulist-curvalue-curvalue-src-mq3-client-ui-local-ml-21597888"></a>
### curvalue

```ml
curvalue
```

Compatibility member corresponding to native `menulist_s.curvalue`; the original declaration is `int curvalue`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L228)

<a id="field-field-mq3-client-ui-local-menulist-generic-generic-src-mq3-client-ui-local-ml-1272792754"></a>
### generic

```ml
generic
```

Common menu-item record containing the shared identity, layout, and callback data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L222)

<a id="field-field-mq3-client-ui-local-menulist-height-height-src-mq3-client-ui-local-ml-1868447904"></a>
### height

```ml
height
```

Number of visible item rows per column in the native-compatible scrolling list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L239)

<a id="field-field-mq3-client-ui-local-menulist-itemnames-itemnames-src-mq3-client-ui-local-ml-363729370"></a>
### itemnames

```ml
itemnames
```

Compatibility member corresponding to native `menulist_s.itemnames`; the original declaration is `const char **itemnames`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L235)

<a id="field-field-mq3-client-ui-local-menulist-numitems-numitems-src-mq3-client-ui-local-ml-1582971886"></a>
### numitems

```ml
numitems
```

Number of entries currently present in the menu or selection list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L230)

<a id="field-field-mq3-client-ui-local-menulist-oldvalue-oldvalue-src-mq3-client-ui-local-ml-939040146"></a>
### oldvalue

```ml
oldvalue
```

Compatibility member corresponding to native `menulist_s.oldvalue`; the original declaration is `int oldvalue`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L225)

<a id="field-field-mq3-client-ui-local-menulist-seperation-seperation-src-mq3-client-ui-local-ml-1238379886"></a>
### seperation

```ml
seperation
```

Compatibility member corresponding to native `menulist_s.seperation`; the original declaration is `int seperation`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L244)

<a id="field-field-mq3-client-ui-local-menulist-top-top-src-mq3-client-ui-local-ml-158746978"></a>
### top

```ml
top
```

Top boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L232)

<a id="field-field-mq3-client-ui-local-menulist-width-width-src-mq3-client-ui-local-ml-1950852846"></a>
### width

```ml
width
```

Character-cell width of each column in the native-compatible scrolling list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L237)
