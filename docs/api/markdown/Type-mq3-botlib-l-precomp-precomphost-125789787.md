# `mq3.botlib.l_precomp.PrecompHost`

[Home](README.md) · [Source file](File-src-mq3-botlib-l-precomp-ml-1036988431.md)

<a id="struct-struct-mq3-botlib-l-precomp-precomphost-struct-precomphost-src-mq3-botlib-l-precomp-ml-915217493"></a>
## PrecompHost

```ml
struct PrecompHost
```

`PrecompHost` record for l precomp, containing `loadFn`, `actionFn` and `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L86)

## Members

<a id="field-field-mq3-botlib-l-precomp-precomphost-actionfn-actionfn-src-mq3-botlib-l-precomp-ml-405701691"></a>
### actionFn

```ml
actionFn
```

Host callback that dispatches a recorded subsystem action to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L90)

<a id="field-field-mq3-botlib-l-precomp-precomphost-context-context-src-mq3-botlib-l-precomp-ml-350206915"></a>
### context

```ml
context
```

Caller-supplied data associated with preprocessor source loading and preprocessing diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L92)

<a id="field-field-mq3-botlib-l-precomp-precomphost-loadfn-loadfn-src-mq3-botlib-l-precomp-ml-944596955"></a>
### loadFn

```ml
loadFn
```

Host callback that loads the requested resource through the host interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_precomp.ml#L88)
