# `mq3.game.g_public.EntityShared`

[Home](README.md) · [Source file](File-src-mq3-game-g-public-ml-554411541.md)

<a id="struct-struct-mq3-game-g-public-entityshared-struct-entityshared-src-mq3-game-g-public-ml-1876588843"></a>
## EntityShared

```ml
struct EntityShared
```

`EntityShared` record for g public, containing `s`, `linked`, `linkcount`, `svFlags` and `singleClient` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_public.ml#L54)

## Members

<a id="field-field-mq3-game-g-public-entityshared-absmax-absmax-src-mq3-game-g-public-ml-484155545"></a>
### absmax

```ml
absmax
```

Upper corner of the entity bounds after transformation into world space.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_public.ml#L76)

<a id="field-field-mq3-game-g-public-entityshared-absmin-absmin-src-mq3-game-g-public-ml-844271349"></a>
### absmin

```ml
absmin
```

Lower corner of the entity bounds after transformation into world space.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_public.ml#L74)

<a id="field-field-mq3-game-g-public-entityshared-bmodel-bmodel-src-mq3-game-g-public-ml-1539952647"></a>
### bmodel

```ml
bmodel
```

Nonzero when the entity collision shape is a BSP brush model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_public.ml#L66)

<a id="field-field-mq3-game-g-public-entityshared-contents-contents-src-mq3-game-g-public-ml-314736533"></a>
### contents

```ml
contents
```

CONTENTS_* mask describing the collision contents of this object or query result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_public.ml#L72)

<a id="field-field-mq3-game-g-public-entityshared-currentangles-currentangles-src-mq3-game-g-public-ml-239537181"></a>
### currentAngles

```ml
currentAngles
```

Current engine-side orientation used for linking and transformed collision queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_public.ml#L80)

<a id="field-field-mq3-game-g-public-entityshared-currentorigin-currentorigin-src-mq3-game-g-public-ml-900940757"></a>
### currentOrigin

```ml
currentOrigin
```

Current engine-side origin used for linking and collision queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_public.ml#L78)

<a id="field-field-mq3-game-g-public-entityshared-linkcount-linkcount-src-mq3-game-g-public-ml-302955821"></a>
### linkcount

```ml
linkcount
```

Counter incremented when the engine relinks this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_public.ml#L60)

<a id="field-field-mq3-game-g-public-entityshared-linked-linked-src-mq3-game-g-public-ml-924985571"></a>
### linked

```ml
linked
```

Nonzero when the entity is linked into the engine world structures.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_public.ml#L58)

<a id="field-field-mq3-game-g-public-entityshared-maxs-maxs-src-mq3-game-g-public-ml-399412159"></a>
### maxs

```ml
maxs
```

Upper local entity bound exposed to the server for collision and spatial linking.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_public.ml#L70)

<a id="field-field-mq3-game-g-public-entityshared-mins-mins-src-mq3-game-g-public-ml-1826489579"></a>
### mins

```ml
mins
```

Lower local entity bound exposed to the server for collision and spatial linking.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_public.ml#L68)

<a id="field-field-mq3-game-g-public-entityshared-ownernum-ownernum-src-mq3-game-g-public-ml-1611151815"></a>
### ownerNum

```ml
ownerNum
```

Entity number of the owner; used to avoid collisions with or attribute actions to the owner.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_public.ml#L82)

<a id="field-field-mq3-game-g-public-entityshared-s-s-src-mq3-game-g-public-ml-1130676369"></a>
### s

```ml
s
```

Network-visible entity state used to build snapshots for clients.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_public.ml#L56)

<a id="field-field-mq3-game-g-public-entityshared-singleclient-singleclient-src-mq3-game-g-public-ml-461907047"></a>
### singleClient

```ml
singleClient
```

Client slot used by server flags that restrict or exclude snapshot visibility.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_public.ml#L64)

<a id="field-field-mq3-game-g-public-entityshared-svflags-svflags-src-mq3-game-g-public-ml-1024437329"></a>
### svFlags

```ml
svFlags
```

Server-side entity flags controlling visibility, client filtering, and engine handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_public.ml#L62)
