# `mq3.botlib.aas_main.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-main-ml-1988895761.md)

<a id="struct-struct-mq3-botlib-aas-main-state-struct-state-src-mq3-botlib-aas-main-ml-1636234691"></a>
## State

```ml
struct State
```

`State` record for aas main, containing `runtime`, `entities`, `configstrings`, `indexesSetup` and `loaded` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L59)

## Members

<a id="field-field-mq3-botlib-aas-main-state-configstrings-configstrings-src-mq3-botlib-aas-main-ml-553207794"></a>
### configstrings

```ml
configstrings
```

Server configuration strings indexed by their protocol slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L65)

<a id="field-field-mq3-botlib-aas-main-state-entities-entities-src-mq3-botlib-aas-main-ml-1546447664"></a>
### entities

```ml
entities
```

Game or BSP entity records tracked by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L63)

<a id="field-field-mq3-botlib-aas-main-state-filename-filename-src-mq3-botlib-aas-main-ml-728401456"></a>
### filename

```ml
filename
```

Path of the file associated with this operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L80)

<a id="field-field-mq3-botlib-aas-main-state-frameroutingupdates-frameroutingupdates-src-mq3-botlib-aas-main-ml-869576506"></a>
### frameroutingupdates

```ml
frameroutingupdates
```

Routing-cache updates performed during the current frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L90)

<a id="field-field-mq3-botlib-aas-main-state-indexessetup-indexessetup-src-mq3-botlib-aas-main-ml-1559270460"></a>
### indexesSetup

```ml
indexesSetup
```

True when navigation lookup indexes have been initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L67)

<a id="field-field-mq3-botlib-aas-main-state-initialized-initialized-src-mq3-botlib-aas-main-ml-1671937418"></a>
### initialized

```ml
initialized
```

True after the active map has completed AAS reachability, clustering, and routing initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L72)

<a id="field-field-mq3-botlib-aas-main-state-loaded-loaded-src-mq3-botlib-aas-main-ml-1941061992"></a>
### loaded

```ml
loaded
```

True after the current map navigation files have been loaded, before full initialization may finish.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L70)

<a id="field-field-mq3-botlib-aas-main-state-mapname-mapname-src-mq3-botlib-aas-main-ml-1693966130"></a>
### mapname

```ml
mapname
```

Name of the current game map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L78)

<a id="field-field-mq3-botlib-aas-main-state-maxclients-maxclients-src-mq3-botlib-aas-main-ml-1892256562"></a>
### maxclients

```ml
maxclients
```

Client capacity retained by the active AAS lifecycle state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L82)

<a id="field-field-mq3-botlib-aas-main-state-maxentities-maxentities-src-mq3-botlib-aas-main-ml-1944003530"></a>
### maxentities

```ml
maxentities
```

Maximum number of entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L84)

<a id="field-field-mq3-botlib-aas-main-state-numframes-numframes-src-mq3-botlib-aas-main-ml-1435959058"></a>
### numframes

```ml
numframes
```

Number of animation frames represented by this model, surface, or animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L76)

<a id="field-field-mq3-botlib-aas-main-state-runtime-runtime-src-mq3-botlib-aas-main-ml-141976418"></a>
### runtime

```ml
runtime
```

Loaded navigation runtime bound to the currently active AAS map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L61)

<a id="field-field-mq3-botlib-aas-main-state-savefile-savefile-src-mq3-botlib-aas-main-ml-2068122664"></a>
### savefile

```ml
savefile
```

True when the current AAS data should be saved back to a file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L86)

<a id="field-field-mq3-botlib-aas-main-state-saveroutingcache-saveroutingcache-src-mq3-botlib-aas-main-ml-896796496"></a>
### saveroutingcache

```ml
saveroutingcache
```

True when computed routing data should be saved to disk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L88)

<a id="field-field-mq3-botlib-aas-main-state-services-services-src-mq3-botlib-aas-main-ml-2082013026"></a>
### services

```ml
services
```

Lifecycle hooks used to initialize and shut down navigation subsystems.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L92)

<a id="field-field-mq3-botlib-aas-main-state-time-time-src-mq3-botlib-aas-main-ml-1664631032"></a>
### time

```ml
time
```

AAS simulation time supplied by the current bot-library frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_main.ml#L74)
