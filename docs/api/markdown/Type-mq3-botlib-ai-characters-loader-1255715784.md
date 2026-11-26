# `mq3.botlib.ai_characters.Loader`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-characters-ml-311974577.md)

<a id="struct-struct-mq3-botlib-ai-characters-loader-struct-loader-src-mq3-botlib-ai-characters-ml-332036783"></a>
## Loader

```ml
struct Loader
```

`Loader` record for ai characters, containing `context` and `readFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L59)

## Members

<a id="field-field-mq3-botlib-ai-characters-loader-context-context-src-mq3-botlib-ai-characters-ml-383618522"></a>
### context

```ml
context
```

Caller-supplied data associated with loading bot character files through this parser adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L61)

<a id="field-field-mq3-botlib-ai-characters-loader-readfn-readfn-src-mq3-botlib-ai-characters-ml-2035601818"></a>
### readFn

```ml
readFn
```

Host callback that reads a requested character source through the character-parser adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_characters.ml#L63)
