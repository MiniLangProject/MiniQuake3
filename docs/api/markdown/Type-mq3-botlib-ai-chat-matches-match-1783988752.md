# `mq3.botlib.ai_chat_matches.Match`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-chat-matches-ml-369456329.md)

<a id="struct-struct-mq3-botlib-ai-chat-matches-match-struct-match-src-mq3-botlib-ai-chat-matches-ml-1337253019"></a>
## Match

```ml
struct Match
```

`Match` record for ai chat matches, containing `string`, `type`, `subtype`, `offsets` and `lengths`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L42)

## Members

<a id="field-field-mq3-botlib-ai-chat-matches-match-lengths-lengths-src-mq3-botlib-ai-chat-matches-ml-1276781922"></a>
### lengths

```ml
lengths
```

Character lengths of the captured match variables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L52)

<a id="field-field-mq3-botlib-ai-chat-matches-match-offsets-offsets-src-mq3-botlib-ai-chat-matches-ml-363875790"></a>
### offsets

```ml
offsets
```

Start positions of captured variables within the matched message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L50)

<a id="field-field-mq3-botlib-ai-chat-matches-match-string-string-src-mq3-botlib-ai-chat-matches-ml-224066608"></a>
### string

```ml
string
```

Input message text matched against the chat templates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L44)

<a id="field-field-mq3-botlib-ai-chat-matches-match-subtype-subtype-src-mq3-botlib-ai-chat-matches-ml-1957021578"></a>
### subtype

```ml
subtype
```

Subtype returned by the chat template that matched this message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L48)

<a id="field-field-mq3-botlib-ai-chat-matches-match-type-type-src-mq3-botlib-ai-chat-matches-ml-993016758"></a>
### type

```ml
type
```

Match-category bits reported by the successful template.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_matches.ml#L46)
