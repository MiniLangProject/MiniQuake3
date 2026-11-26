# `mq3.client.ui_confirm.ConfirmMenu`

[Home](README.md) · [Source file](File-src-mq3-client-ui-confirm-ml-553460106.md)

<a id="struct-struct-mq3-client-ui-confirm-confirmmenu-struct-confirmmenu-src-mq3-client-ui-confirm-ml-762856117"></a>
## ConfirmMenu

```ml
struct ConfirmMenu
```

Stores UI confirm confirm menu record, including `wrapAround`, `fullscreen`, `question`, `style`, `slashX`, `lines` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L31)

## Members

<a id="field-field-mq3-client-ui-confirm-confirmmenu-actioncallback-actioncallback-src-mq3-client-ui-confirm-ml-1428679450"></a>
### actionCallback

```ml
actionCallback
```

When constructing this record, `openStyle` supplies `actionCallback` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L57)

<a id="field-field-mq3-client-ui-confirm-confirmmenu-actions-actions-src-mq3-client-ui-confirm-ml-752706676"></a>
### actions

```ml
actions
```

Host requests queued while drawing confirmation choices and accepting or rejecting the requested action, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L51)

<a id="field-field-mq3-client-ui-confirm-confirmmenu-assets-assets-src-mq3-client-ui-confirm-ml-1551179814"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the confirmation dialog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L48)

<a id="field-field-mq3-client-ui-confirm-confirmmenu-drawcallback-drawcallback-src-mq3-client-ui-confirm-ml-1461387458"></a>
### drawCallback

```ml
drawCallback
```

When constructing this record, `openStyle` supplies `drawCallback` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L55)

<a id="field-field-mq3-client-ui-confirm-confirmmenu-fullscreen-fullscreen-src-mq3-client-ui-confirm-ml-1128067902"></a>
### fullscreen

```ml
fullscreen
```

Whether the confirmation dialog covers the entire UI instead of appearing over the underlying game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L36)

<a id="field-field-mq3-client-ui-confirm-confirmmenu-items-items-src-mq3-client-ui-confirm-ml-30782444"></a>
### items

```ml
items
```

When constructing this record, `openStyle` supplies `items` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L46)

<a id="field-field-mq3-client-ui-confirm-confirmmenu-lines-lines-src-mq3-client-ui-confirm-ml-1679227788"></a>
### lines

```ml
lines
```

When constructing this record, `openStyle` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L44)

<a id="field-field-mq3-client-ui-confirm-confirmmenu-question-question-src-mq3-client-ui-confirm-ml-122334072"></a>
### question

```ml
question
```

When constructing this record, `openStyle` supplies `question` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L38)

<a id="field-field-mq3-client-ui-confirm-confirmmenu-result-result-src-mq3-client-ui-confirm-ml-1420584478"></a>
### result

```ml
result
```

When constructing this record, `openStyle` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L53)

<a id="field-field-mq3-client-ui-confirm-confirmmenu-slashx-slashx-src-mq3-client-ui-confirm-ml-2128260490"></a>
### slashX

```ml
slashX
```

When constructing this record, `openStyle` supplies `l2` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L42)

<a id="field-field-mq3-client-ui-confirm-confirmmenu-style-style-src-mq3-client-ui-confirm-ml-806775796"></a>
### style

```ml
style
```

UI drawing-style flags controlling alignment, font selection, and text emphasis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L40)

<a id="field-field-mq3-client-ui-confirm-confirmmenu-wraparound-wraparound-src-mq3-client-ui-confirm-ml-1146455830"></a>
### wrapAround

```ml
wrapAround
```

Enables cyclic keyboard-focus navigation among the selectable entries of the confirmation dialog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_confirm.ml#L33)
