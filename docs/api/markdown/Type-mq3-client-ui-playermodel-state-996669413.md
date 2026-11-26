# `mq3.client.ui_playermodel.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-playermodel-ml-1080705896.md)

<a id="struct-struct-mq3-client-ui-playermodel-state-struct-state-src-mq3-client-ui-playermodel-ml-1822910885"></a>
## State

```ml
struct State
```

Stores UI playermodel state, including `source`, `menu`, `pics`, `picbuttons`, `left`, `right` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L30)

## Members

<a id="field-field-mq3-client-ui-playermodel-state-actions-actions-src-mq3-client-ui-playermodel-ml-438312482"></a>
### actions

```ml
actions
```

Host requests queued while paging model icons, previewing a model, and saving the selected skin, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L69)

<a id="field-field-mq3-client-ui-playermodel-state-back-back-src-mq3-client-ui-playermodel-ml-171899416"></a>
### back

```ml
back
```

Back-button widget that saves the selected model and leaves the model-selection menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L44)

<a id="field-field-mq3-client-ui-playermodel-state-cvarwrites-cvarwrites-src-mq3-client-ui-playermodel-ml-682834370"></a>
### cvarWrites

```ml
cvarWrites
```

Cvar name/value changes queued by the player-model and skin selection menu for the host to apply.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L71)

<a id="field-field-mq3-client-ui-playermodel-state-drawrows-drawrows-src-mq3-client-ui-playermodel-ml-1171718544"></a>
### drawRows

```ml
drawRows
```

Most recent player-preview draw actions, or the low-memory message when preview rendering is unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L80)

<a id="field-field-mq3-client-ui-playermodel-state-left-left-src-mq3-client-ui-playermodel-ml-968439176"></a>
### left

```ml
left
```

Left boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L40)

<a id="field-field-mq3-client-ui-playermodel-state-memoryremaining-memoryremaining-src-mq3-client-ui-playermodel-ml-1748450178"></a>
### memoryRemaining

```ml
memoryRemaining
```

When constructing this record, `create` supplies `LOW_MEMORY+1` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L77)

<a id="field-field-mq3-client-ui-playermodel-state-menu-menu-src-mq3-client-ui-playermodel-ml-1004810428"></a>
### menu

```ml
menu
```

When constructing this record, `create` supplies `qmenu.menu(true,true)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L34)

<a id="field-field-mq3-client-ui-playermodel-state-modelname-modelname-src-mq3-client-ui-playermodel-ml-206318822"></a>
### modelname

```ml
modelname
```

When constructing this record, `create` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L62)

<a id="field-field-mq3-client-ui-playermodel-state-modelnames-modelnames-src-mq3-client-ui-playermodel-ml-1965252752"></a>
### modelnames

```ml
modelnames
```

Discovered model/skin icon paths used to populate the paged selection grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L52)

<a id="field-field-mq3-client-ui-playermodel-state-modelpage-modelpage-src-mq3-client-ui-playermodel-ml-46632902"></a>
### modelpage

```ml
modelpage
```

Zero-based page of model icons currently displayed in the selection grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L54)

<a id="field-field-mq3-client-ui-playermodel-state-modelskin-modelskin-src-mq3-client-ui-playermodel-ml-240506726"></a>
### modelskin

```ml
modelskin
```

When constructing this record, `create` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L58)

<a id="field-field-mq3-client-ui-playermodel-state-nummodels-nummodels-src-mq3-client-ui-playermodel-ml-841956030"></a>
### nummodels

```ml
nummodels
```

Number of discovered model/skin icon entries available to the selection grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L50)

<a id="field-field-mq3-client-ui-playermodel-state-numpages-numpages-src-mq3-client-ui-playermodel-ml-1744756934"></a>
### numpages

```ml
numpages
```

Number of pages required to display all discovered model/skin icons.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L56)

<a id="field-field-mq3-client-ui-playermodel-state-picbuttons-picbuttons-src-mq3-client-ui-playermodel-ml-1397102508"></a>
### picbuttons

```ml
picbuttons
```

Focusable button widgets paired with the model icons, enabled only for populated page slots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L38)

<a id="field-field-mq3-client-ui-playermodel-state-pics-pics-src-mq3-client-ui-playermodel-ml-1335565420"></a>
### pics

```ml
pics
```

Bitmap widgets showing the model and skin icons on the current selection page.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L36)

<a id="field-field-mq3-client-ui-playermodel-state-player-player-src-mq3-client-ui-playermodel-ml-238512716"></a>
### player

```ml
player
```

Noninteractive bitmap widget reserving the rectangle used for the animated player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L46)

<a id="field-field-mq3-client-ui-playermodel-state-playerinfo-playerinfo-src-mq3-client-ui-playermodel-ml-614195924"></a>
### playerinfo

```ml
playerinfo
```

When constructing this record, `create` supplies `players.create()` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L48)

<a id="field-field-mq3-client-ui-playermodel-state-playername-playername-src-mq3-client-ui-playermodel-ml-273172626"></a>
### playername

```ml
playername
```

When constructing this record, `create` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L66)

<a id="field-field-mq3-client-ui-playermodel-state-popped-popped-src-mq3-client-ui-playermodel-ml-168833686"></a>
### popped

```ml
popped
```

Records a request to remove the player-model and skin selection menu from the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L73)

<a id="field-field-mq3-client-ui-playermodel-state-pushed-pushed-src-mq3-client-ui-playermodel-ml-1975236760"></a>
### pushed

```ml
pushed
```

Records that the player-model and skin selection menu has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L75)

<a id="field-field-mq3-client-ui-playermodel-state-right-right-src-mq3-client-ui-playermodel-ml-906934958"></a>
### right

```ml
right
```

Right boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L42)

<a id="field-field-mq3-client-ui-playermodel-state-selectedmodel-selectedmodel-src-mq3-client-ui-playermodel-ml-1151502134"></a>
### selectedmodel

```ml
selectedmodel
```

Index of the selected model/skin entry across all grid pages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L60)

<a id="field-field-mq3-client-ui-playermodel-state-skinname-skinname-src-mq3-client-ui-playermodel-ml-235586738"></a>
### skinname

```ml
skinname
```

When constructing this record, `create` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L64)

<a id="field-field-mq3-client-ui-playermodel-state-source-source-src-mq3-client-ui-playermodel-ml-74947208"></a>
### source

```ml
source
```

When constructing this record, `create` supplies `source` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L32)
