# `mq3.client.ui_demos.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-demos-ml-1498146362.md)

<a id="struct-struct-mq3-client-ui-demos-state-struct-state-src-mq3-client-ui-demos-ml-1936476813"></a>
## State

```ml
struct State
```

Stores UI demos state, including `numDemos`, `names`, `selected`, `top`, `columns`, `height` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_demos.ml#L67)

## Members

<a id="field-field-mq3-client-ui-demos-state-actions-actions-src-mq3-client-ui-demos-ml-1035090954"></a>
### actions

```ml
actions
```

Host requests queued while listing recorded demos and starting the selected recording, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_demos.ml#L87)

<a id="field-field-mq3-client-ui-demos-state-cached-cached-src-mq3-client-ui-demos-ml-934822906"></a>
### cached

```ml
cached
```

True once the module's required media has been cached or registered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_demos.ml#L92)

<a id="field-field-mq3-client-ui-demos-state-columns-columns-src-mq3-client-ui-demos-ml-839277058"></a>
### columns

```ml
columns
```

Column descriptors used to lay out a listbox's displayed data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_demos.ml#L79)

<a id="field-field-mq3-client-ui-demos-state-extension-extension-src-mq3-client-ui-demos-ml-1216328550"></a>
### extension

```ml
extension
```

When constructing this record, `create` supplies an empty string for this member. Used by `menuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_demos.ml#L101)

<a id="field-field-mq3-client-ui-demos-state-govisible-govisible-src-mq3-client-ui-demos-ml-1745987322"></a>
### goVisible

```ml
goVisible
```

When constructing this record, `create` supplies `true` for this member. Used by `menuEvent` and `menuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_demos.ml#L84)

<a id="field-field-mq3-client-ui-demos-state-height-height-src-mq3-client-ui-demos-ml-1101880584"></a>
### height

```ml
height
```

Number of visible demo entries per column, used for horizontal navigation and scrolling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_demos.ml#L81)

<a id="field-field-mq3-client-ui-demos-state-menuevents-menuevents-src-mq3-client-ui-demos-ml-504953098"></a>
### menuEvents

```ml
menuEvents
```

Menu-stack and selection events queued for the host adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_demos.ml#L96)

<a id="field-field-mq3-client-ui-demos-state-names-names-src-mq3-client-ui-demos-ml-957444742"></a>
### names

```ml
names
```

When constructing this record, `create` supplies an empty list for this member. Used by `menuEvent` and `menuInit` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_demos.ml#L73)

<a id="field-field-mq3-client-ui-demos-state-numdemos-numdemos-src-mq3-client-ui-demos-ml-1012588590"></a>
### numDemos

```ml
numDemos
```

When constructing this record, `create` supplies `0` for this member. Used by `scroll` and `menuEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_demos.ml#L70)

<a id="field-field-mq3-client-ui-demos-state-protocol-protocol-src-mq3-client-ui-demos-ml-816990262"></a>
### protocol

```ml
protocol
```

Network protocol version advertised or required by the client connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_demos.ml#L98)

<a id="field-field-mq3-client-ui-demos-state-pushed-pushed-src-mq3-client-ui-demos-ml-1609593664"></a>
### pushed

```ml
pushed
```

Records that the demo-playback selection menu has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_demos.ml#L94)

<a id="field-field-mq3-client-ui-demos-state-retailactive-retailactive-src-mq3-client-ui-demos-ml-1807248988"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the demo-playback selection menu, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_demos.ml#L90)

<a id="field-field-mq3-client-ui-demos-state-selected-selected-src-mq3-client-ui-demos-ml-918372712"></a>
### selected

```ml
selected
```

Current selection state or selected entry retained by the owning UI control.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_demos.ml#L75)

<a id="field-field-mq3-client-ui-demos-state-top-top-src-mq3-client-ui-demos-ml-100779342"></a>
### top

```ml
top
```

Top boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_demos.ml#L77)
