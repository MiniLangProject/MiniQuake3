# `mq3.qcommon.cvar.Registry`

[Home](README.md) · [Source file](File-src-mq3-qcommon-cvar-ml-558393614.md)

<a id="struct-struct-mq3-qcommon-cvar-registry-struct-registry-src-mq3-qcommon-cvar-ml-1716716373"></a>
## Registry

```ml
struct Registry
```

Registry record for qcommon.cvar, containing `variables`, `modifiedFlags`, `numIndexes`, `indexes`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L73)

## Members

<a id="field-field-mq3-qcommon-cvar-registry-indexes-indexes-src-mq3-qcommon-cvar-ml-637028616"></a>
### indexes

```ml
indexes
```

Stable index table used to resolve VM-visible variable handles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L81)

<a id="field-field-mq3-qcommon-cvar-registry-modifiedflags-modifiedflags-src-mq3-qcommon-cvar-ml-384652272"></a>
### modifiedFlags

```ml
modifiedFlags
```

Bit mask of configuration-variable categories modified since the last clear.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L77)

<a id="field-field-mq3-qcommon-cvar-registry-numindexes-numindexes-src-mq3-qcommon-cvar-ml-1303432136"></a>
### numIndexes

```ml
numIndexes
```

Number of index elements describing this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L79)

<a id="field-field-mq3-qcommon-cvar-registry-variables-variables-src-mq3-qcommon-cvar-ml-1117855412"></a>
### variables

```ml
variables
```

Registered configuration-variable records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/cvar.ml#L75)
