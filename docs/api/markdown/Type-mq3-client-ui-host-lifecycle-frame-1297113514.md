# `mq3.client.ui_host_lifecycle.Frame`

[Home](README.md) · [Source file](File-src-mq3-client-ui-host-lifecycle-ml-451482783.md)

<a id="struct-struct-mq3-client-ui-host-lifecycle-frame-struct-frame-src-mq3-client-ui-host-lifecycle-ml-1072960599"></a>
## Frame

```ml
struct Frame
```

Stores UI host lifecycle frame data, including `fullscreen`, `cgameFrames`, `cinematicFrames`, `menuCalls`, `refreshCalls`, `connectCalls` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_host_lifecycle.ml#L77)

## Members

<a id="field-field-mq3-client-ui-host-lifecycle-frame-cgameframes-cgameframes-src-mq3-client-ui-host-lifecycle-ml-171807882"></a>
### cgameFrames

```ml
cgameFrames
```

When constructing this record, `drawScreen` supplies `cgameFrames` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_host_lifecycle.ml#L82)

<a id="field-field-mq3-client-ui-host-lifecycle-frame-cinematicframes-cinematicframes-src-mq3-client-ui-host-lifecycle-ml-607074990"></a>
### cinematicFrames

```ml
cinematicFrames
```

When constructing this record, `drawScreen` supplies `cinematicFrames` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_host_lifecycle.ml#L84)

<a id="field-field-mq3-client-ui-host-lifecycle-frame-connectcalls-connectcalls-src-mq3-client-ui-host-lifecycle-ml-648890160"></a>
### connectCalls

```ml
connectCalls
```

When constructing this record, `drawScreen` supplies `connectCalls` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_host_lifecycle.ml#L90)

<a id="field-field-mq3-client-ui-host-lifecycle-frame-fullscreen-fullscreen-src-mq3-client-ui-host-lifecycle-ml-519657720"></a>
### fullscreen

```ml
fullscreen
```

Whether the UI reported full-screen coverage, suppressing the underlying game or cinematic drawing for this screen update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_host_lifecycle.ml#L80)

<a id="field-field-mq3-client-ui-host-lifecycle-frame-menucalls-menucalls-src-mq3-client-ui-host-lifecycle-ml-1953420194"></a>
### menuCalls

```ml
menuCalls
```

When constructing this record, `drawScreen` supplies `menuCalls` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_host_lifecycle.ml#L86)

<a id="field-field-mq3-client-ui-host-lifecycle-frame-overlay-overlay-src-mq3-client-ui-host-lifecycle-ml-1167915786"></a>
### overlay

```ml
overlay
```

When constructing this record, `drawScreen` supplies `overlay` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_host_lifecycle.ml#L92)

<a id="field-field-mq3-client-ui-host-lifecycle-frame-refreshcalls-refreshcalls-src-mq3-client-ui-host-lifecycle-ml-474338106"></a>
### refreshCalls

```ml
refreshCalls
```

When constructing this record, `drawScreen` supplies `refreshCalls` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_host_lifecycle.ml#L88)
