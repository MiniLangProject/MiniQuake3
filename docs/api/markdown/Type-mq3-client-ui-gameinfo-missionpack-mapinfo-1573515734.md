# `mq3.client.ui_gameinfo_missionpack.MapInfo`

[Home](README.md) · [Source file](File-src-mq3-client-ui-gameinfo-missionpack-ml-695041638.md)

<a id="struct-struct-mq3-client-ui-gameinfo-missionpack-mapinfo-struct-mapinfo-src-mq3-client-ui-gameinfo-missionpack-ml-633991165"></a>
## MapInfo

```ml
struct MapInfo
```

Stores UI gameinfo missionpack map info record, including `cinematic`, `mapLoadName`, `mapName`, `levelShot`, `imageName`, `typeBits` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L39)

## Members

<a id="field-field-mq3-client-ui-gameinfo-missionpack-mapinfo-cinematic-cinematic-src-mq3-client-ui-gameinfo-missionpack-ml-354286115"></a>
### cinematic

```ml
cinematic
```

When constructing this record, `mapInfo` supplies `-1` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L41)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-mapinfo-imagename-imagename-src-mq3-client-ui-gameinfo-missionpack-ml-622017119"></a>
### imageName

```ml
imageName
```

Levelshot image name associated with this Missionpack arena entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L49)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-mapinfo-levelshot-levelshot-src-mq3-client-ui-gameinfo-missionpack-ml-1690999983"></a>
### levelShot

```ml
levelShot
```

True while producing the menu screenshot for the current level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L47)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-mapinfo-maploadname-maploadname-src-mq3-client-ui-gameinfo-missionpack-ml-492733819"></a>
### mapLoadName

```ml
mapLoadName
```

When constructing this record, `mapInfo` supplies `loadName` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L43)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-mapinfo-mapname-mapname-src-mq3-client-ui-gameinfo-missionpack-ml-1455547511"></a>
### mapName

```ml
mapName
```

Virtual map name used to identify and launch this arena definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L45)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-mapinfo-skirmishnumber-skirmishnumber-src-mq3-client-ui-gameinfo-missionpack-ml-1850333197"></a>
### skirmishNumber

```ml
skirmishNumber
```

When constructing this record, `mapInfo` supplies `number` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L54)

<a id="field-field-mq3-client-ui-gameinfo-missionpack-mapinfo-typebits-typebits-src-mq3-client-ui-gameinfo-missionpack-ml-239374235"></a>
### typeBits

```ml
typeBits
```

When constructing this record, `mapInfo` supplies `arenaTypeBits(info.value(arena,"type"))` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo_missionpack.ml#L52)
