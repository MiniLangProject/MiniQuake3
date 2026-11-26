# `mq3.client.ui_gameinfo.GameInfo`

[Home](README.md) · [Source file](File-src-mq3-client-ui-gameinfo-ml-965434910.md)

<a id="struct-struct-mq3-client-ui-gameinfo-gameinfo-struct-gameinfo-src-mq3-client-ui-gameinfo-ml-617399759"></a>
## GameInfo

```ml
struct GameInfo
```

Stores UI gameinfo game info record, including `allocPoint`, `outOfMemory`, `arenas`, `bots`, `numSinglePlayerArenas`, `numSpecialSinglePlayerArenas` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L44)

## Members

<a id="field-field-mq3-client-ui-gameinfo-gameinfo-allocpoint-allocpoint-src-mq3-client-ui-gameinfo-ml-976407341"></a>
### allocPoint

```ml
allocPoint
```

Next byte offset in the bounded arena-info pool; successful allocations advance it to a 32-byte boundary.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L47)

<a id="field-field-mq3-client-ui-gameinfo-gameinfo-arenas-arenas-src-mq3-client-ui-gameinfo-ml-198134987"></a>
### arenas

```ml
arenas
```

Loaded arena info strings, including map names, supported game types, and single-player ordering metadata.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L52)

<a id="field-field-mq3-client-ui-gameinfo-gameinfo-bots-bots-src-mq3-client-ui-gameinfo-ml-1126435211"></a>
### bots

```ml
bots
```

Loaded bot info strings used to resolve bot names and character definitions for menus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L54)

<a id="field-field-mq3-client-ui-gameinfo-gameinfo-cvars-cvars-src-mq3-client-ui-gameinfo-ml-272024695"></a>
### cvars

```ml
cvars
```

Configuration-variable values exposed to the native UI implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L61)

<a id="field-field-mq3-client-ui-gameinfo-gameinfo-demoversion-demoversion-src-mq3-client-ui-gameinfo-ml-1050401703"></a>
### demoversion

```ml
demoversion
```

True when restricted content or the loaded arena set identifies the demo edition, limiting progression and videos.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L69)

<a id="field-field-mq3-client-ui-gameinfo-gameinfo-diagnostics-diagnostics-src-mq3-client-ui-gameinfo-ml-1458696899"></a>
### diagnostics

```ml
diagnostics
```

Messages collected while loading arena or bot definitions and manipulating single-player progress.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L66)

<a id="field-field-mq3-client-ui-gameinfo-gameinfo-levelmenureinitialized-levelmenureinitialized-src-mq3-client-ui-gameinfo-ml-290041171"></a>
### levelMenuReinitialized

```ml
levelMenuReinitialized
```

True after the unlock-levels command requests a refresh of the single-player level menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L71)

<a id="field-field-mq3-client-ui-gameinfo-gameinfo-numsingleplayerarenas-numsingleplayerarenas-src-mq3-client-ui-gameinfo-ml-349536299"></a>
### numSinglePlayerArenas

```ml
numSinglePlayerArenas
```

Number of ordinary single-player arenas, excluding entries marked as special arenas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L56)

<a id="field-field-mq3-client-ui-gameinfo-gameinfo-numspecialsingleplayerarenas-numspecialsingleplayerarenas-src-mq3-client-ui-gameinfo-ml-1887270251"></a>
### numSpecialSinglePlayerArenas

```ml
numSpecialSinglePlayerArenas
```

Number of single-player arenas carrying special progression metadata rather than an ordinary tier position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L59)

<a id="field-field-mq3-client-ui-gameinfo-gameinfo-outofmemory-outofmemory-src-mq3-client-ui-gameinfo-ml-368061403"></a>
### outOfMemory

```ml
outOfMemory
```

True when the bounded allocation or string-storage pool could not satisfy a request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L49)

<a id="field-field-mq3-client-ui-gameinfo-gameinfo-writes-writes-src-mq3-client-ui-gameinfo-ml-909868755"></a>
### writes

```ml
writes
```

Cvar name/value assignments emitted while saving scores, awards, videos, and single-player progress.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L64)
