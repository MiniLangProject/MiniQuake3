# `mq3.client.map_loading.Screen`

[Home](README.md) · [Source file](File-src-mq3-client-map-loading-ml-2006073650.md)

<a id="struct-struct-mq3-client-map-loading-screen-struct-screen-src-mq3-client-map-loading-ml-537558723"></a>
## Screen

```ml
struct Screen
```

Stores map loading screen record, including `archive`, `scripts`, `assets`, `kinds`, `mapName`, `serverName` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L25)

## Members

<a id="field-field-mq3-client-map-loading-screen-archive-archive-src-mq3-client-map-loading-ml-1621807385"></a>
### archive

```ml
archive
```

When constructing this record, `create` supplies `archive` for this member. Used by `hasImage` and `show` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L28)

<a id="field-field-mq3-client-map-loading-screen-assets-assets-src-mq3-client-map-loading-ml-1702580615"></a>
### assets

```ml
assets
```

Artwork resources retained by the map-loading screen for its preview and loading presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L33)

<a id="field-field-mq3-client-map-loading-screen-catalog-catalog-src-mq3-client-map-loading-ml-282046761"></a>
### catalog

```ml
catalog
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `show` and `release` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L46)

<a id="field-field-mq3-client-map-loading-screen-indexmillis-indexmillis-src-mq3-client-map-loading-ml-1105138193"></a>
### indexMillis

```ml
indexMillis
```

When constructing this record, `create` supplies `indexMillis` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L53)

<a id="field-field-mq3-client-map-loading-screen-kinds-kinds-src-mq3-client-map-loading-ml-176597533"></a>
### kinds

```ml
kinds
```

When constructing this record, `create` supplies `["shaderNoMip","shader","shaderNoMip"]` for this member. Used by `collectIcons` and `show` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L36)

<a id="field-field-mq3-client-map-loading-screen-loadinginfo-loadinginfo-src-mq3-client-map-loading-ml-965824001"></a>
### loadingInfo

```ml
loadingInfo
```

When constructing this record, `create` supplies `cgameInfo.create()` for this member. Used by `collectIcons` and `layout` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L49)

<a id="field-field-mq3-client-map-loading-screen-localgame-localgame-src-mq3-client-map-loading-ml-239597693"></a>
### localGame

```ml
localGame
```

When constructing this record, `create` supplies `localGame` for this member. Used by `layout` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L43)

<a id="field-field-mq3-client-map-loading-screen-mapname-mapname-src-mq3-client-map-loading-ml-1762376793"></a>
### mapName

```ml
mapName
```

Level name displayed while map assets and the playable scene are being prepared.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L38)

<a id="field-field-mq3-client-map-loading-screen-scripts-scripts-src-mq3-client-map-loading-ml-18610785"></a>
### scripts

```ml
scripts
```

When constructing this record, `create` supplies `scripts` for this member. Used by `hasImage` and `show` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L31)

<a id="field-field-mq3-client-map-loading-screen-servername-servername-src-mq3-client-map-loading-ml-248060345"></a>
### serverName

```ml
serverName
```

Display or connection name of the selected game server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L40)

<a id="field-field-mq3-client-map-loading-screen-startedat-startedat-src-mq3-client-map-loading-ml-1027748577"></a>
### startedAt

```ml
startedAt
```

When constructing this record, `create` supplies `startedAt` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/map_loading.ml#L51)
