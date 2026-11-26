# `mq3.client.ui_cinematics.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-cinematics-ml-559861938.md)

<a id="struct-struct-mq3-client-ui-cinematics-state-struct-state-src-mq3-client-ui-cinematics-ml-861302595"></a>
## State

```ml
struct State
```

Stores UI cinematics state, including `data`, `demoVersion`, `names`, `labels`, `enabled`, `cursor` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cinematics.ml#L47)

## Members

<a id="field-field-mq3-client-ui-cinematics-state-actions-actions-src-mq3-client-ui-cinematics-ml-1247766740"></a>
### actions

```ml
actions
```

Host requests queued while selecting and launching unlocked cinematics, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cinematics.ml#L68)

<a id="field-field-mq3-client-ui-cinematics-state-cached-cached-src-mq3-client-ui-cinematics-ml-1651072236"></a>
### cached

```ml
cached
```

True once the module's required media has been cached or registered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cinematics.ml#L73)

<a id="field-field-mq3-client-ui-cinematics-state-cursor-cursor-src-mq3-client-ui-cinematics-ml-383264088"></a>
### cursor

```ml
cursor
```

When constructing this record, `create` supplies `0` for this member. Used by `init` and `cinematicsMenuF` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cinematics.ml#L66)

<a id="field-field-mq3-client-ui-cinematics-state-data-data-src-mq3-client-ui-cinematics-ml-1003540184"></a>
### data

```ml
data
```

When constructing this record, `create` supplies `data` for this member. Used by `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cinematics.ml#L50)

<a id="field-field-mq3-client-ui-cinematics-state-demoversion-demoversion-src-mq3-client-ui-cinematics-ml-820964500"></a>
### demoVersion

```ml
demoVersion
```

When constructing this record, `create` supplies `demoVersion` for this member. Used by `menuEvent` and `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cinematics.ml#L53)

<a id="field-field-mq3-client-ui-cinematics-state-enabled-enabled-src-mq3-client-ui-cinematics-ml-1916747920"></a>
### enabled

```ml
enabled
```

When constructing this record, `create` supplies `array(10,false)` for this member. Used by `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cinematics.ml#L63)

<a id="field-field-mq3-client-ui-cinematics-state-labels-labels-src-mq3-client-ui-cinematics-ml-1346964090"></a>
### labels

```ml
labels
```

When constructing this record, `create` supplies `["ID LOGO","INTRO","Tier 1","Tier 2","Tier 3","Tier 4","Tier 5","Tier 6","Tier 7","END"]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cinematics.ml#L60)

<a id="field-field-mq3-client-ui-cinematics-state-menuevents-menuevents-src-mq3-client-ui-cinematics-ml-748978756"></a>
### menuEvents

```ml
menuEvents
```

Menu-stack and selection events queued for the host adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cinematics.ml#L77)

<a id="field-field-mq3-client-ui-cinematics-state-names-names-src-mq3-client-ui-cinematics-ml-336780536"></a>
### names

```ml
names
```

When constructing this record, `create` supplies `["idlogo","intro","tier1","tier2","tier3","tier4","tier5","tier6","tier7","end"]` for this member. Used by `menuEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cinematics.ml#L57)

<a id="field-field-mq3-client-ui-cinematics-state-pushed-pushed-src-mq3-client-ui-cinematics-ml-263190918"></a>
### pushed

```ml
pushed
```

Records that the cinematics selection menu has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cinematics.ml#L75)

<a id="field-field-mq3-client-ui-cinematics-state-retailactive-retailactive-src-mq3-client-ui-cinematics-ml-211790778"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the cinematics selection menu, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cinematics.ml#L71)
