# `mq3.botlib.l_precomp.Runtime`

[Home](README.md) · [Source file](File-src-mq3-botlib-l-precomp-ml-1036988431.md)

<a id="struct-struct-mq3-botlib-l-precomp-runtime-struct-runtime-src-mq3-botlib-l-precomp-ml-20273429"></a>
## Runtime

```ml
struct Runtime
```

`Runtime` record for l precomp, containing `registry`, `host`, `baseFolder`, `globalDefines` and `actions` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L95)

## Members

<a id="field-field-mq3-botlib-l-precomp-runtime-actions-actions-src-mq3-botlib-l-precomp-ml-1978377431"></a>
### actions

```ml
actions
```

Recorded preprocessing diagnostics with source filenames and line numbers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L105)

<a id="field-field-mq3-botlib-l-precomp-runtime-basefolder-basefolder-src-mq3-botlib-l-precomp-ml-1231593377"></a>
### baseFolder

```ml
baseFolder
```

Base folder prepended when resolving bot script paths.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L101)

<a id="field-field-mq3-botlib-l-precomp-runtime-globaldefines-globaldefines-src-mq3-botlib-l-precomp-ml-1677103807"></a>
### globalDefines

```ml
globalDefines
```

Preprocessor definitions inherited by newly loaded source files.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L103)

<a id="field-field-mq3-botlib-l-precomp-runtime-host-host-src-mq3-botlib-l-precomp-ml-505171535"></a>
### host

```ml
host
```

Host callback interface supplying external services to this runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L99)

<a id="field-field-mq3-botlib-l-precomp-runtime-registry-registry-src-mq3-botlib-l-precomp-ml-716463121"></a>
### registry

```ml
registry
```

Registry used to resolve registered names, handles, or runtime definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L97)

<a id="field-field-mq3-botlib-l-precomp-runtime-retailactive-retailactive-src-mq3-botlib-l-precomp-ml-1518787653"></a>
### retailActive

```ml
retailActive
```

Indicates whether the host-backed retail-compatible runtime path is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L107)

<a id="field-field-mq3-botlib-l-precomp-runtime-tokenheapinitialized-tokenheapinitialized-src-mq3-botlib-l-precomp-ml-1281043989"></a>
### tokenHeapInitialized

```ml
tokenHeapInitialized
```

True after storage for preprocessor tokens has been initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_precomp.ml#L109)
