# `mq3.client.ui_video.HostAction`

[Home](README.md) · [Source file](File-src-mq3-client-ui-video-ml-1287978223.md)

<a id="struct-struct-mq3-client-ui-video-hostaction-struct-hostaction-src-mq3-client-ui-video-ml-1374641415"></a>
## HostAction

```ml
struct HostAction
```

Stores UI video host action record, including `boundary`, `kind`, `name`, `text`, `number`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L39)

## Members

<a id="field-field-mq3-client-ui-video-hostaction-boundary-boundary-src-mq3-client-ui-video-ml-1163762835"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while listing renderer capabilities and applying graphics configuration changes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L42)

<a id="field-field-mq3-client-ui-video-hostaction-dispatched-dispatched-src-mq3-client-ui-video-ml-1570021585"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while listing renderer capabilities and applying graphics configuration changes; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L55)

<a id="field-field-mq3-client-ui-video-hostaction-kind-kind-src-mq3-client-ui-video-ml-713455787"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while listing renderer capabilities and applying graphics configuration changes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L45)

<a id="field-field-mq3-client-ui-video-hostaction-name-name-src-mq3-client-ui-video-ml-1426045853"></a>
### name

```ml
name
```

Target resource, command, or setting name addressed by this queued host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L47)

<a id="field-field-mq3-client-ui-video-hostaction-number-number-src-mq3-client-ui-video-ml-558299753"></a>
### number

```ml
number
```

When constructing this record, `host` supplies `number` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L52)

<a id="field-field-mq3-client-ui-video-hostaction-text-text-src-mq3-client-ui-video-ml-759813721"></a>
### text

```ml
text
```

Driver-information text, video-setting value, or renderer restart command supplied by the graphics menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L50)
