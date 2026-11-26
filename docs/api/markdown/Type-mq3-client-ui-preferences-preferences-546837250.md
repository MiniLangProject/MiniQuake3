# `mq3.client.ui_preferences.Preferences`

[Home](README.md) · [Source file](File-src-mq3-client-ui-preferences-ml-1708756856.md)

<a id="struct-struct-mq3-client-ui-preferences-preferences-struct-preferences-src-mq3-client-ui-preferences-ml-1730621059"></a>
## Preferences

```ml
struct Preferences
```

Stores UI preferences preferences record, including `crosshair`, `simpleItems`, `highQualitySky`, `brass`, `wallMarks`, `dynamicLights` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L46)

## Members

<a id="field-field-mq3-client-ui-preferences-preferences-actions-actions-src-mq3-client-ui-preferences-ml-1820882843"></a>
### actions

```ml
actions
```

Host requests queued while applying crosshair, effects, and other gameplay preferences, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L78)

<a id="field-field-mq3-client-ui-preferences-preferences-allowdownload-allowdownload-src-mq3-client-ui-preferences-ml-1324124783"></a>
### allowDownload

```ml
allowDownload
```

When constructing this record, `setMenuItems` supplies `allowDownload!=0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L68)

<a id="field-field-mq3-client-ui-preferences-preferences-assets-assets-src-mq3-client-ui-preferences-ml-658603285"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the gameplay-preferences menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L73)

<a id="field-field-mq3-client-ui-preferences-preferences-brass-brass-src-mq3-client-ui-preferences-ml-1070109279"></a>
### brass

```ml
brass
```

When constructing this record, `setMenuItems` supplies `brassTime!=0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L54)

<a id="field-field-mq3-client-ui-preferences-preferences-crosshair-crosshair-src-mq3-client-ui-preferences-ml-1524107367"></a>
### crosshair

```ml
crosshair
```

When constructing this record, `setMenuItems` supplies `crosshair%10` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L48)

<a id="field-field-mq3-client-ui-preferences-preferences-cvarwrites-cvarwrites-src-mq3-client-ui-preferences-ml-1718059263"></a>
### cvarWrites

```ml
cvarWrites
```

Cvar name/value changes queued by the gameplay-preferences menu for the host to apply.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L75)

<a id="field-field-mq3-client-ui-preferences-preferences-dynamiclights-dynamiclights-src-mq3-client-ui-preferences-ml-667054975"></a>
### dynamicLights

```ml
dynamicLights
```

When constructing this record, `setMenuItems` supplies `dynamicLights!=0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L58)

<a id="field-field-mq3-client-ui-preferences-preferences-forcemodel-forcemodel-src-mq3-client-ui-preferences-ml-1733187647"></a>
### forceModel

```ml
forceModel
```

Model resource selected for the force presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L64)

<a id="field-field-mq3-client-ui-preferences-preferences-highqualitysky-highqualitysky-src-mq3-client-ui-preferences-ml-823095423"></a>
### highQualitySky

```ml
highQualitySky
```

When constructing this record, `setMenuItems` supplies `fastSky==0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L52)

<a id="field-field-mq3-client-ui-preferences-preferences-identifytarget-identifytarget-src-mq3-client-ui-preferences-ml-1855375393"></a>
### identifyTarget

```ml
identifyTarget
```

When constructing this record, `setMenuItems` supplies `identify!=0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L60)

<a id="field-field-mq3-client-ui-preferences-preferences-items-items-src-mq3-client-ui-preferences-ml-341855331"></a>
### items

```ml
items
```

When constructing this record, `setMenuItems` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L70)

<a id="field-field-mq3-client-ui-preferences-preferences-simpleitems-simpleitems-src-mq3-client-ui-preferences-ml-1329221903"></a>
### simpleItems

```ml
simpleItems
```

When constructing this record, `setMenuItems` supplies `simpleItems!=0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L50)

<a id="field-field-mq3-client-ui-preferences-preferences-synceveryframe-synceveryframe-src-mq3-client-ui-preferences-ml-1376153609"></a>
### syncEveryFrame

```ml
syncEveryFrame
```

When constructing this record, `setMenuItems` supplies `finish!=0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L62)

<a id="field-field-mq3-client-ui-preferences-preferences-teamoverlay-teamoverlay-src-mq3-client-ui-preferences-ml-1259282515"></a>
### teamOverlay

```ml
teamOverlay
```

When constructing this record, `setMenuItems` supplies `clamp(teamOverlay,0,3)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L66)

<a id="field-field-mq3-client-ui-preferences-preferences-wallmarks-wallmarks-src-mq3-client-ui-preferences-ml-673806151"></a>
### wallMarks

```ml
wallMarks
```

When constructing this record, `setMenuItems` supplies `marks!=0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_preferences.ml#L56)
