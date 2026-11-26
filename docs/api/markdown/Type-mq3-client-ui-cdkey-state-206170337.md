# `mq3.client.ui_cdkey.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-cdkey-ml-1843695940.md)

<a id="struct-struct-mq3-client-ui-cdkey-state-struct-state-src-mq3-client-ui-cdkey-ml-1490296949"></a>
## State

```ml
struct State
```

Stores UI cdkey state, including `buffer`, `cursor`, `focus`, `overstrike`, `menuDepth`, `backVisible` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L62)

## Members

<a id="field-field-mq3-client-ui-cdkey-state-actions-actions-src-mq3-client-ui-cdkey-ml-60663986"></a>
### actions

```ml
actions
```

Host requests queued while validating and storing the entered product key, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L85)

<a id="field-field-mq3-client-ui-cdkey-state-backvisible-backvisible-src-mq3-client-ui-cdkey-ml-2049568638"></a>
### backVisible

```ml
backVisible
```

When constructing this record, `create` supplies `false` for this member. Used by `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L79)

<a id="field-field-mq3-client-ui-cdkey-state-buffer-buffer-src-mq3-client-ui-cdkey-ml-416717122"></a>
### buffer

```ml
buffer
```

When constructing this record, `create` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L64)

<a id="field-field-mq3-client-ui-cdkey-state-cached-cached-src-mq3-client-ui-cdkey-ml-1079607482"></a>
### cached

```ml
cached
```

True once the module's required media has been cached or registered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L90)

<a id="field-field-mq3-client-ui-cdkey-state-cursor-cursor-src-mq3-client-ui-cdkey-ml-581491598"></a>
### cursor

```ml
cursor
```

When constructing this record, `create` supplies `0` for this member. Used by `drawKey` and `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L67)

<a id="field-field-mq3-client-ui-cdkey-state-focus-focus-src-mq3-client-ui-cdkey-ml-1827998910"></a>
### focus

```ml
focus
```

True when the product-key entry field has keyboard focus, enabling its insert or overstrike cursor glyph.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L70)

<a id="field-field-mq3-client-ui-cdkey-state-menudepth-menudepth-src-mq3-client-ui-cdkey-ml-1387135818"></a>
### menuDepth

```ml
menuDepth
```

When constructing this record, `create` supplies `0` for this member. Used by `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L76)

<a id="field-field-mq3-client-ui-cdkey-state-menuevents-menuevents-src-mq3-client-ui-cdkey-ml-882176354"></a>
### menuEvents

```ml
menuEvents
```

Menu-stack and selection events queued for the host adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L94)

<a id="field-field-mq3-client-ui-cdkey-state-overstrike-overstrike-src-mq3-client-ui-cdkey-ml-286515534"></a>
### overstrike

```ml
overstrike
```

When constructing this record, `create` supplies `false` for this member. Used by `drawKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L73)

<a id="field-field-mq3-client-ui-cdkey-state-pushed-pushed-src-mq3-client-ui-cdkey-ml-644459704"></a>
### pushed

```ml
pushed
```

Records that the product-key entry menu has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L92)

<a id="field-field-mq3-client-ui-cdkey-state-retailactive-retailactive-src-mq3-client-ui-cdkey-ml-1873675668"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the product-key entry menu, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L88)

<a id="field-field-mq3-client-ui-cdkey-state-verified-verified-src-mq3-client-ui-cdkey-ml-1356847142"></a>
### verified

```ml
verified
```

When constructing this record, `create` supplies `false` for this member. Used by `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L82)
