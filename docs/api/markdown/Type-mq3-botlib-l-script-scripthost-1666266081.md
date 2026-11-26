# `mq3.botlib.l_script.ScriptHost`

[Home](README.md) · [Source file](File-src-mq3-botlib-l-script-ml-301363504.md)

<a id="struct-struct-mq3-botlib-l-script-scripthost-struct-scripthost-src-mq3-botlib-l-script-ml-983649877"></a>
## ScriptHost

```ml
struct ScriptHost
```

`ScriptHost` record for l script, containing `loadFn`, `actionFn` and `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L190)

## Members

<a id="field-field-mq3-botlib-l-script-scripthost-actionfn-actionfn-src-mq3-botlib-l-script-ml-1918879430"></a>
### actionFn

```ml
actionFn
```

Host callback that dispatches a recorded subsystem action to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L194)

<a id="field-field-mq3-botlib-l-script-scripthost-context-context-src-mq3-botlib-l-script-ml-1990319670"></a>
### context

```ml
context
```

Caller-supplied data associated with lexical source loading and scanner diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L196)

<a id="field-field-mq3-botlib-l-script-scripthost-loadfn-loadfn-src-mq3-botlib-l-script-ml-1099080270"></a>
### loadFn

```ml
loadFn
```

Host callback that loads the requested resource through the host interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_script.ml#L192)
