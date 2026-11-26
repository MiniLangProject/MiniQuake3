# `mq3.client.ui_lan_browser.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-lan-browser-ml-1771171938.md)

<a id="struct-struct-mq3-client-ui-lan-browser-state-struct-state-src-mq3-client-ui-lan-browser-ml-1278207597"></a>
## State

```ml
struct State
```

Stores UI LAN browser state, including `local`, `mplayer`, `globalServers`, `favorites`, `pings`, `cachedMplayer` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L73)

## Members

<a id="field-field-mq3-client-ui-lan-browser-state-cachedfavorites-cachedfavorites-src-mq3-client-ui-lan-browser-ml-2068233894"></a>
### cachedFavorites

```ml
cachedFavorites
```

When constructing this record, `create` supplies an empty list for this member. Used by `save` and `load` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L97)

<a id="field-field-mq3-client-ui-lan-browser-state-cachedglobal-cachedglobal-src-mq3-client-ui-lan-browser-ml-350455084"></a>
### cachedGlobal

```ml
cachedGlobal
```

When constructing this record, `create` supplies an empty list for this member. Used by `save` and `load` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L94)

<a id="field-field-mq3-client-ui-lan-browser-state-cachedmplayer-cachedmplayer-src-mq3-client-ui-lan-browser-ml-1087075330"></a>
### cachedMplayer

```ml
cachedMplayer
```

When constructing this record, `create` supplies an empty list for this member. Used by `save` and `load` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L91)

<a id="field-field-mq3-client-ui-lan-browser-state-favorites-favorites-src-mq3-client-ui-lan-browser-ml-1273054294"></a>
### favorites

```ml
favorites
```

When constructing this record, `create` supplies an empty list for this member. Used by `list` and `setList` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L85)

<a id="field-field-mq3-client-ui-lan-browser-state-globalservers-globalservers-src-mq3-client-ui-lan-browser-ml-1722518594"></a>
### globalServers

```ml
globalServers
```

When constructing this record, `create` supplies an empty list for this member. Used by `list` and `setList` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L82)

<a id="field-field-mq3-client-ui-lan-browser-state-local-local-src-mq3-client-ui-lan-browser-ml-2019780790"></a>
### local

```ml
local
```

When constructing this record, `create` supplies an empty list for this member. Used by `list` and `setList` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L76)

<a id="field-field-mq3-client-ui-lan-browser-state-mplayer-mplayer-src-mq3-client-ui-lan-browser-ml-213542758"></a>
### mplayer

```ml
mplayer
```

When constructing this record, `create` supplies an empty list for this member. Used by `list` and `setList` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L79)

<a id="field-field-mq3-client-ui-lan-browser-state-pings-pings-src-mq3-client-ui-lan-browser-ml-1070427694"></a>
### pings

```ml
pings
```

When constructing this record, `create` supplies an empty list for this member. Used by `queuePing` and `pingCount` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L88)
