# `mq3.botlib.ai_weapon_weights.Runtime`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-weapon-weights-ml-776993711.md)

<a id="struct-struct-mq3-botlib-ai-weapon-weights-runtime-struct-runtime-src-mq3-botlib-ai-weapon-weights-ml-186136365"></a>
## Runtime

```ml
struct Runtime
```

`Runtime` record for ai weapon weights, containing `context`, `readFn`, `fuzzyRuntime`, `config` and `fileReads`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L120)

## Members

<a id="field-field-mq3-botlib-ai-weapon-weights-runtime-config-config-src-mq3-botlib-ai-weapon-weights-ml-400248639"></a>
### config

```ml
config
```

Configuration object supplying the settings used by this runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L129)

<a id="field-field-mq3-botlib-ai-weapon-weights-runtime-context-context-src-mq3-botlib-ai-weapon-weights-ml-1888761943"></a>
### context

```ml
context
```

Caller-supplied data associated with loading projectile, weapon, and fuzzy weapon-weight definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L123)

<a id="field-field-mq3-botlib-ai-weapon-weights-runtime-filereads-filereads-src-mq3-botlib-ai-weapon-weights-ml-44893723"></a>
### fileReads

```ml
fileReads
```

Number of source-file reads performed through the loading interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L131)

<a id="field-field-mq3-botlib-ai-weapon-weights-runtime-fuzzyruntime-fuzzyruntime-src-mq3-botlib-ai-weapon-weights-ml-2088612663"></a>
### fuzzyRuntime

```ml
fuzzyRuntime
```

Fuzzy-weight evaluator used to score available weapons.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L127)

<a id="field-field-mq3-botlib-ai-weapon-weights-runtime-readfn-readfn-src-mq3-botlib-ai-weapon-weights-ml-1613414103"></a>
### readFn

```ml
readFn
```

Host callback that reads weapon, projectile, and weapon-weight configuration files.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L125)
