# `mq3.client.ui_main_missionpack.CharacterInfo`

[Home](README.md) · [Source file](File-src-mq3-client-ui-main-missionpack-ml-2627719.md)

<a id="struct-struct-mq3-client-ui-main-missionpack-characterinfo-struct-characterinfo-src-mq3-client-ui-main-missionpack-ml-1840007699"></a>
## CharacterInfo

```ml
struct CharacterInfo
```

Stores UI main missionpack character info record, including `name`, `base`, `imageName`, `active`, `headImage`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L184)

## Members

<a id="field-field-mq3-client-ui-main-missionpack-characterinfo-active-active-src-mq3-client-ui-main-missionpack-ml-1187486008"></a>
### active

```ml
active
```

When constructing this record, `characterInfo` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L192)

<a id="field-field-mq3-client-ui-main-missionpack-characterinfo-base-base-src-mq3-client-ui-main-missionpack-ml-1317006734"></a>
### base

```ml
base
```

When constructing this record, `characterInfo` supplies `base` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L188)

<a id="field-field-mq3-client-ui-main-missionpack-characterinfo-headimage-headimage-src-mq3-client-ui-main-missionpack-ml-2044443744"></a>
### headImage

```ml
headImage
```

Renderer resource handle used for head image; mirrors native `characterInfo.headImage`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L194)

<a id="field-field-mq3-client-ui-main-missionpack-characterinfo-imagename-imagename-src-mq3-client-ui-main-missionpack-ml-473526528"></a>
### imageName

```ml
imageName
```

Character portrait image name used by Missionpack roster and character widgets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L190)

<a id="field-field-mq3-client-ui-main-missionpack-characterinfo-name-name-src-mq3-client-ui-main-missionpack-ml-716324494"></a>
### name

```ml
name
```

Character-selection name returned by head selection and used when issuing addbot requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L186)
