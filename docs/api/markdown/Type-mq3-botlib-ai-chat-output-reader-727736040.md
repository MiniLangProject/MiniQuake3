# `mq3.botlib.ai_chat_output.Reader`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-chat-output-ml-737978343.md)

<a id="struct-struct-mq3-botlib-ai-chat-output-reader-struct-reader-src-mq3-botlib-ai-chat-output-ml-1695673503"></a>
## Reader

```ml
struct Reader
```

`Reader` record for ai chat output, containing `registry`, `source` and `pending`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L79)

## Members

<a id="field-field-mq3-botlib-ai-chat-output-reader-pending-pending-src-mq3-botlib-ai-chat-output-ml-670033490"></a>
### pending

```ml
pending
```

Saved token or command awaiting consumption by the next operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L85)

<a id="field-field-mq3-botlib-ai-chat-output-reader-registry-registry-src-mq3-botlib-ai-chat-output-ml-575987516"></a>
### registry

```ml
registry
```

Registry used to resolve registered names, handles, or runtime definitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L81)

<a id="field-field-mq3-botlib-ai-chat-output-reader-source-source-src-mq3-botlib-ai-chat-output-ml-978422764"></a>
### source

```ml
source
```

Preprocessor source handle supplying the reply or random-chat script.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L83)
