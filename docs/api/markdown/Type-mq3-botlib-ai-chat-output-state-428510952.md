# `mq3.botlib.ai_chat_output.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-chat-output-ml-737978343.md)

<a id="struct-struct-mq3-botlib-ai-chat-output-state-struct-state-src-mq3-botlib-ai-chat-output-ml-1218316363"></a>
## State

```ml
struct State
```

`State` record for ai chat output, containing `profiles`, `strings`, `actions`, `context` and `readFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L93)

## Members

<a id="field-field-mq3-botlib-ai-chat-output-state-actions-actions-src-mq3-botlib-ai-chat-output-ml-223931758"></a>
### actions

```ml
actions
```

Elementary-action runtime used to send say, say_team, and tell commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L99)

<a id="field-field-mq3-botlib-ai-chat-output-state-context-context-src-mq3-botlib-ai-chat-output-ml-1625534722"></a>
### context

```ml
context
```

Caller-supplied data associated with reply-file loading, reply timing, and random chat selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L101)

<a id="field-field-mq3-botlib-ai-chat-output-state-filereads-filereads-src-mq3-botlib-ai-chat-output-ml-2004187990"></a>
### fileReads

```ml
fileReads
```

Number of source-file reads performed through the loading interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L115)

<a id="field-field-mq3-botlib-ai-chat-output-state-loaded-loaded-src-mq3-botlib-ai-chat-output-ml-669656204"></a>
### loaded

```ml
loaded
```

True after the random-chat and reply-chat resources required for output have been loaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L113)

<a id="field-field-mq3-botlib-ai-chat-output-state-profiles-profiles-src-mq3-botlib-ai-chat-output-ml-998170106"></a>
### profiles

```ml
profiles
```

Loaded initial-chat profiles and their cached message selections.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L95)

<a id="field-field-mq3-botlib-ai-chat-output-state-randomfn-randomfn-src-mq3-botlib-ai-chat-output-ml-761153840"></a>
### randomFn

```ml
randomFn
```

Host callback that supplies the random values used by bot selection and fuzzy logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L107)

<a id="field-field-mq3-botlib-ai-chat-output-state-randomlists-randomlists-src-mq3-botlib-ai-chat-output-ml-634272958"></a>
### randomLists

```ml
randomLists
```

Named lists of random phrases used while expanding bot chat.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L109)

<a id="field-field-mq3-botlib-ai-chat-output-state-readfn-readfn-src-mq3-botlib-ai-chat-output-ml-277947090"></a>
### readFn

```ml
readFn
```

Host callback that reads random-chat lists and reply-chat rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L103)

<a id="field-field-mq3-botlib-ai-chat-output-state-replies-replies-src-mq3-botlib-ai-chat-output-ml-1357086690"></a>
### replies

```ml
replies
```

Reply-chat definitions considered for an incoming message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L111)

<a id="field-field-mq3-botlib-ai-chat-output-state-strings-strings-src-mq3-botlib-ai-chat-output-ml-738664330"></a>
### strings

```ml
strings
```

Whitespace and synonym-normalization runtime used by chat processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L97)

<a id="field-field-mq3-botlib-ai-chat-output-state-timefn-timefn-src-mq3-botlib-ai-chat-output-ml-1429620504"></a>
### timeFn

```ml
timeFn
```

Host callback that supplies the current time used by the bot runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_output.ml#L105)
