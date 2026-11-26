# `mq3.client.ui_main.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-main-ml-1850214811.md)

<a id="struct-struct-mq3-client-ui-main-state-struct-state-src-mq3-client-ui-main-ml-558245691"></a>
## State

```ml
struct State
```

Stores UI main state, including `cvars`, `actions`, `initialized`, `shutdown`, `keyEvents`, `mouseEvents` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L82)

## Members

<a id="field-field-mq3-client-ui-main-state-actions-actions-src-mq3-client-ui-main-ml-1980931078"></a>
### actions

```ml
actions
```

Host requests queued while dispatching base-game UI entry points to engine services, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L87)

<a id="field-field-mq3-client-ui-main-state-activemenus-activemenus-src-mq3-client-ui-main-ml-2085275970"></a>
### activeMenus

```ml
activeMenus
```

When constructing this record, `create` supplies an empty list for this member. Used by `vmMain` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L104)

<a id="field-field-mq3-client-ui-main-state-connectscreens-connectscreens-src-mq3-client-ui-main-ml-1934127468"></a>
### connectScreens

```ml
connectScreens
```

When constructing this record, `create` supplies an empty list for this member. Used by `vmMain` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L107)

<a id="field-field-mq3-client-ui-main-state-consoleresult-consoleresult-src-mq3-client-ui-main-ml-126456014"></a>
### consoleResult

```ml
consoleResult
```

When constructing this record, `create` supplies `0` for this member. Used by `vmMain` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L113)

<a id="field-field-mq3-client-ui-main-state-cvars-cvars-src-mq3-client-ui-main-ml-119151582"></a>
### cvars

```ml
cvars
```

Configuration-variable values exposed to the native UI implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L84)

<a id="field-field-mq3-client-ui-main-state-fullscreenresult-fullscreenresult-src-mq3-client-ui-main-ml-1509585722"></a>
### fullscreenResult

```ml
fullscreenResult
```

When constructing this record, `create` supplies `0` for this member. Used by `vmMain` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L110)

<a id="field-field-mq3-client-ui-main-state-initialized-initialized-src-mq3-client-ui-main-ml-2109867106"></a>
### initialized

```ml
initialized
```

True after the UI_INIT entry point and cleared by UI_SHUTDOWN in the base-game dispatcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L89)

<a id="field-field-mq3-client-ui-main-state-keyevents-keyevents-src-mq3-client-ui-main-ml-1555183450"></a>
### keyEvents

```ml
keyEvents
```

When constructing this record, `create` supplies an empty list for this member. Used by `vmMain` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L95)

<a id="field-field-mq3-client-ui-main-state-mouseevents-mouseevents-src-mq3-client-ui-main-ml-238635138"></a>
### mouseEvents

```ml
mouseEvents
```

When constructing this record, `create` supplies an empty list for this member. Used by `vmMain` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L98)

<a id="field-field-mq3-client-ui-main-state-refreshtimes-refreshtimes-src-mq3-client-ui-main-ml-164411512"></a>
### refreshTimes

```ml
refreshTimes
```

When constructing this record, `create` supplies an empty list for this member. Used by `vmMain` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L101)

<a id="field-field-mq3-client-ui-main-state-retailqvmactive-retailqvmactive-src-mq3-client-ui-main-ml-1033593546"></a>
### retailQvmActive

```ml
retailQvmActive
```

When constructing this record, `create` supplies `retailQvmActive` for this member. Used by `hostAction` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L116)

<a id="field-field-mq3-client-ui-main-state-shutdown-shutdown-src-mq3-client-ui-main-ml-1276095202"></a>
### shutdown

```ml
shutdown
```

When constructing this record, `create` supplies `false` for this member. Used by `vmMain` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main.ml#L92)
