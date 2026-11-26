# `mq3.client.ui_video.DriverInfoState`

[Home](README.md) · [Source file](File-src-mq3-client-ui-video-ml-1287978223.md)

<a id="struct-struct-mq3-client-ui-video-driverinfostate-struct-driverinfostate-src-mq3-client-ui-video-ml-1390921223"></a>
## DriverInfoState

```ml
struct DriverInfoState
```

Stores UI video driver info state record, including `config`, `extensionStrings`, `drawLines`, `items`, `assets`, `actions`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L168)

## Members

<a id="field-field-mq3-client-ui-video-driverinfostate-actions-actions-src-mq3-client-ui-video-ml-484011408"></a>
### actions

```ml
actions
```

Host requests queued while listing renderer capabilities and applying graphics configuration changes, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L182)

<a id="field-field-mq3-client-ui-video-driverinfostate-assets-assets-src-mq3-client-ui-video-ml-1821750258"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the graphics-options and driver-information menus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L179)

<a id="field-field-mq3-client-ui-video-driverinfostate-config-config-src-mq3-client-ui-video-ml-1859245828"></a>
### config

```ml
config
```

When constructing this record, `driverState` supplies `config` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L170)

<a id="field-field-mq3-client-ui-video-driverinfostate-drawlines-drawlines-src-mq3-client-ui-video-ml-1725873364"></a>
### drawLines

```ml
drawLines
```

When constructing this record, `driverState` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L174)

<a id="field-field-mq3-client-ui-video-driverinfostate-extensionstrings-extensionstrings-src-mq3-client-ui-video-ml-433149354"></a>
### extensionStrings

```ml
extensionStrings
```

When constructing this record, `driverState` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L172)

<a id="field-field-mq3-client-ui-video-driverinfostate-items-items-src-mq3-client-ui-video-ml-511640904"></a>
### items

```ml
items
```

When constructing this record, `driverState` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_video.ml#L176)
