# `mq3.client.ui_main_missionpack.MapInfo`

[Home](README.md) · [Source file](File-src-mq3-client-ui-main-missionpack-ml-2627719.md)

<a id="struct-struct-mq3-client-ui-main-missionpack-mapinfo-struct-mapinfo-src-mq3-client-ui-main-missionpack-ml-1795876693"></a>
## MapInfo

```ml
struct MapInfo
```

Stores UI main missionpack map info record, including `mapLoadName`, `mapName`, `imageName`, `typeBits`, `active`, `cinematic` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L150)

## Members

<a id="field-field-mq3-client-ui-main-missionpack-mapinfo-active-active-src-mq3-client-ui-main-missionpack-ml-1792454201"></a>
### active

```ml
active
```

When constructing this record, `mapInfo` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L160)

<a id="field-field-mq3-client-ui-main-missionpack-mapinfo-cinematic-cinematic-src-mq3-client-ui-main-missionpack-ml-853289185"></a>
### cinematic

```ml
cinematic
```

When constructing this record, `mapInfo` supplies `-1` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L162)

<a id="field-field-mq3-client-ui-main-missionpack-mapinfo-imagename-imagename-src-mq3-client-ui-main-missionpack-ml-1942418685"></a>
### imageName

```ml
imageName
```

Map preview image name used by Missionpack arena-selection widgets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L156)

<a id="field-field-mq3-client-ui-main-missionpack-mapinfo-levelshot-levelshot-src-mq3-client-ui-main-missionpack-ml-1008484541"></a>
### levelShot

```ml
levelShot
```

True while producing the menu screenshot for the current level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L164)

<a id="field-field-mq3-client-ui-main-missionpack-mapinfo-maploadname-maploadname-src-mq3-client-ui-main-missionpack-ml-1300451073"></a>
### mapLoadName

```ml
mapLoadName
```

When constructing this record, `mapInfo` supplies `loadName` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L152)

<a id="field-field-mq3-client-ui-main-missionpack-mapinfo-mapname-mapname-src-mq3-client-ui-main-missionpack-ml-1294531717"></a>
### mapName

```ml
mapName
```

Virtual map identifier used by Missionpack arena selection and server launch commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L154)

<a id="field-field-mq3-client-ui-main-missionpack-mapinfo-opponentname-opponentname-src-mq3-client-ui-main-missionpack-ml-1135984621"></a>
### opponentName

```ml
opponentName
```

When constructing this record, `mapInfo` supplies an empty string for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L166)

<a id="field-field-mq3-client-ui-main-missionpack-mapinfo-teammembers-teammembers-src-mq3-client-ui-main-missionpack-ml-242618377"></a>
### teamMembers

```ml
teamMembers
```

When constructing this record, `mapInfo` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L168)

<a id="field-field-mq3-client-ui-main-missionpack-mapinfo-timetobeat-timetobeat-src-mq3-client-ui-main-missionpack-ml-1194017341"></a>
### timeToBeat

```ml
timeToBeat
```

When constructing this record, `mapInfo` supplies `array(8,0)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L170)

<a id="field-field-mq3-client-ui-main-missionpack-mapinfo-typebits-typebits-src-mq3-client-ui-main-missionpack-ml-877741045"></a>
### typeBits

```ml
typeBits
```

When constructing this record, `mapInfo` supplies `typeBits` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L158)
