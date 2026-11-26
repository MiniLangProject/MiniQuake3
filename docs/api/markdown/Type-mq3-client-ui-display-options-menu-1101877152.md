# `mq3.client.ui_display_options.Menu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-display-options-ml-1856767331.md)

<a id="struct-struct-mq3-client-ui-display-options-menu-struct-menu-src-mq3-client-ui-display-options-ml-656210179"></a>
## Menu

```ml
struct Menu
```

Stores UI display options menu, including `wrapAround`, `fullscreen`, `cursor`, `items`, `assets`, `actions` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L49)

## Members

<a id="field-field-mq3-client-ui-display-options-menu-actions-actions-src-mq3-client-ui-display-options-ml-1666977042"></a>
### actions

```ml
actions
```

Host requests queued while drawing display controls and applying gamma or view-size settings, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L65)

<a id="field-field-mq3-client-ui-display-options-menu-assets-assets-src-mq3-client-ui-display-options-ml-1245589532"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the display and gamma options menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L62)

<a id="field-field-mq3-client-ui-display-options-menu-cursor-cursor-src-mq3-client-ui-display-options-ml-1836804974"></a>
### cursor

```ml
cursor
```

When constructing this record, `init` supplies `ID_DISPLAY` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L57)

<a id="field-field-mq3-client-ui-display-options-menu-cvarwrites-cvarwrites-src-mq3-client-ui-display-options-ml-1811056142"></a>
### cvarWrites

```ml
cvarWrites
```

Cvar name/value changes queued by the display and gamma options menu for the host to apply.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L67)

<a id="field-field-mq3-client-ui-display-options-menu-fullscreen-fullscreen-src-mq3-client-ui-display-options-ml-1833431612"></a>
### fullscreen

```ml
fullscreen
```

Whether the display-options menu covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L55)

<a id="field-field-mq3-client-ui-display-options-menu-items-items-src-mq3-client-ui-display-options-ml-409737122"></a>
### items

```ml
items
```

Ordered child items participating in this menu's rendering and navigation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L59)

<a id="field-field-mq3-client-ui-display-options-menu-wraparound-wraparound-src-mq3-client-ui-display-options-ml-2117290844"></a>
### wrapAround

```ml
wrapAround
```

Enables cyclic keyboard-focus navigation among the selectable entries of the display and gamma options menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_display_options.ml#L52)
