# `mq3.botlib.lifecycle_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-lifecycle-runtime-ml-1352513457.md)

<a id="struct-struct-mq3-botlib-lifecycle-runtime-state-struct-state-src-mq3-botlib-lifecycle-runtime-ml-2006269363"></a>
## State

```ml
struct State
```

`State` record for lifecycle runtime, containing `variables`, `setup`, `maxclients`, `maxentities` and `mapName` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L16)

## Members

<a id="field-field-mq3-botlib-lifecycle-runtime-state-developer-developer-src-mq3-botlib-lifecycle-runtime-ml-85768574"></a>
### developer

```ml
developer
```

True when developer bot-library diagnostics are enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L38)

<a id="field-field-mq3-botlib-lifecycle-runtime-state-entityupdates-entityupdates-src-mq3-botlib-lifecycle-runtime-ml-1326422206"></a>
### entityUpdates

```ml
entityUpdates
```

Number of entity-state updates delivered to the bot library.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L34)

<a id="field-field-mq3-botlib-lifecycle-runtime-state-frames-frames-src-mq3-botlib-lifecycle-runtime-ml-2039896606"></a>
### frames

```ml
frames
```

Number of bot-library frame updates processed since setup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L30)

<a id="field-field-mq3-botlib-lifecycle-runtime-state-maploads-maploads-src-mq3-botlib-lifecycle-runtime-ml-550797592"></a>
### mapLoads

```ml
mapLoads
```

Number of map-load operations performed by the bot runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L28)

<a id="field-field-mq3-botlib-lifecycle-runtime-state-mapname-mapname-src-mq3-botlib-lifecycle-runtime-ml-229659334"></a>
### mapName

```ml
mapName
```

Name of the current game map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L26)

<a id="field-field-mq3-botlib-lifecycle-runtime-state-maxclients-maxclients-src-mq3-botlib-lifecycle-runtime-ml-278166462"></a>
### maxclients

```ml
maxclients
```

Client limit supplied when setting up the bot-library lifecycle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L22)

<a id="field-field-mq3-botlib-lifecycle-runtime-state-maxentities-maxentities-src-mq3-botlib-lifecycle-runtime-ml-884857678"></a>
### maxentities

```ml
maxentities
```

Maximum number of entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L24)

<a id="field-field-mq3-botlib-lifecycle-runtime-state-removedentities-removedentities-src-mq3-botlib-lifecycle-runtime-ml-1799037622"></a>
### removedEntities

```ml
removedEntities
```

Entity numbers removed from bot-library tracking.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L36)

<a id="field-field-mq3-botlib-lifecycle-runtime-state-setup-setup-src-mq3-botlib-lifecycle-runtime-ml-337192306"></a>
### setup

```ml
setup
```

True after the bot-library setup sequence has completed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L20)

<a id="field-field-mq3-botlib-lifecycle-runtime-state-time-time-src-mq3-botlib-lifecycle-runtime-ml-1634986212"></a>
### time

```ml
time
```

Time supplied to the most recent bot-library frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L32)

<a id="field-field-mq3-botlib-lifecycle-runtime-state-variables-variables-src-mq3-botlib-lifecycle-runtime-ml-526365938"></a>
### variables

```ml
variables
```

Bot-library configuration variables consulted during setup and map loading.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/lifecycle_runtime.ml#L18)
